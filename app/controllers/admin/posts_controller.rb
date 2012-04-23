class Admin::PostsController < Admin::AdminController
  
  # inherits from admin controller

  # GET /admin/posts
  def index
    @posts = Post.find(:all, :limit => 30, :order => 'created_at DESC')
  end

  # GET /admin/posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # GET /admin/posts/new
  def new
    @post = Post.new()
  end

  # POST /admin/posts
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to admin_posts_path
    else
      render :action => "new"
    end
  end

  # PUT /admin/posts/1
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to admin_posts_path()
    else
      render :action => "edit"
    end
  end

  # DELETE /admin/posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post was successfully deleted.'
    redirect_to admin_posts_url
  end

  # delete attachment /admin/posts/delete_attachment/1
  def delete_attachment
      @post = Post.find(params[:id])
      @post.attachment = nil
      if @post.save
        flash[:notice] = 'Post image successfully deleted.'
      else
        flash[:error] = 'Post image could not be deleted.'
      end
      redirect_to edit_admin_post_path
  end

end

class Admin::CategoriesController < Admin::AdminController
  
  # inherits from admin controller

  # GET /admin/categories
  def index
    @categories = Category.find(:all, :order => 'position')
  end

  # GET /admin/categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # GET /admin/categories/new
  def DEPnew
    @category = Category.new()
  end

  # POST /admin/categories
  def DEPcreate
    @category = Category.new(params[:categorie])
    if @category.save
      flash[:notice] = 'Category was successfully created.'
      redirect_to admin_categories_path
    else
      render :action => "new"
    end
  end

  # PUT /admin/categories/1
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = 'Category was successfully updated.'
      redirect_to admin_categories_path()
    else
      render :action => "edit"
    end
  end

  # DELETE /admin/categories/1
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Category was successfully deleted.'
    redirect_to admin_categories_url
  end

end

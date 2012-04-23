class Admin::SlidesController < Admin::AdminController
  
  # inherits from admin controller

  # GET /admin/slides
  def index
    @slides = Slide.find(:all, :order => 'position')
  end

  # GET /admin/slides/1/edit
  def edit
    @slide = Slide.find(params[:id])
  end

  # GET /admin/slides/new
  def new
    @slide = Slide.new()
  end

  # POST /admin/slides
  def create
    @slide = Slide.new(params[:slide])
    if @slide.save
      flash[:notice] = 'Slide was successfully created.'
      redirect_to admin_slides_path
    else
      render :action => "new"
    end
  end

  # PUT /admin/slides/1
  def update
    @slide = Slide.find(params[:id])
    if @slide.update_attributes(params[:slide])
      flash[:notice] = 'Slide was successfully updated.'
      redirect_to admin_slides_path()
    else
      render :action => "edit"
    end
  end

  # DELETE /admin/slides/1
  def destroy
    @slide = Slide.find(params[:id])
    @slide.destroy
    flash[:notice] = 'Slide was successfully deleted.'
    redirect_to admin_slides_url
  end

  # delete attachment /admin/slides/delete_attachment/1
  def delete_attachment
      @slide = Slide.find(params[:id])
      @slide.attachment = nil
      if @slide.save
        flash[:notice] = 'Slide image successfully deleted.'
      else
        flash[:error] = 'Slide image could not be deleted.'
      end
      redirect_to edit_admin_slide_path
  end

end

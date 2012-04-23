class Admin::CalloutsController < Admin::AdminController
  
  # inherits from admin controller

  # GET /admin/callouts
  def index
    @callouts = Callout.find(:all, :order => 'created_at DESC')
  end

  # GET /admin/callouts/1/edit
  def edit
    @callout = Callout.find(params[:id])
  end

  # GET /admin/callouts/new
  def new
    @callout = Callout.new()
  end

  # POST /admin/callouts
  def create
    @callout = Callout.new(params[:callout])
    if @callout.save
      flash[:notice] = 'Callout was successfully created.'
      redirect_to admin_callouts_path
    else
      render :action => "new"
    end
  end

  # PUT /admin/callouts/1
  def update
    @callout = Callout.find(params[:id])
    if @callout.update_attributes(params[:callout])
      flash[:notice] = 'Callout was successfully updated.'
      redirect_to admin_callouts_path()
    else
      render :action => "edit"
    end
  end

  # DELETE /admin/callouts/1
  def destroy
    @callout = Callout.find(params[:id])
    @callout.destroy
    flash[:notice] = 'Callout was successfully deleted.'
    redirect_to admin_callouts_url
  end

  # delete attachment /admin/callout/delete_attachment/1
  def delete_attachment
      @callout = Callout.find(params[:id])
      @callout.attachment = nil
      if @callout.save
        flash[:notice] = 'Call-out image successfully deleted.'
      else
        flash[:error] = 'Call-out image could not be deleted.'
      end
      redirect_to edit_admin_callout_path
  end

end

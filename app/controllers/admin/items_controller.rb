class Admin::ItemsController < Admin::AdminController
  
  # inherits from admin controller

  # GET /admin/items/1/edit
  def edit
    @item = Item.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  # GET /admin/items/new
  def new
    @item = Item.new()
    @category = Category.find(params[:category_id])
  end

  # POST /admin/items
  def create
    @item = Item.new(params[:item])
    @category = Category.find(params[:category_id])
    if @item.save
      flash[:notice] = 'Item was successfully created.'
      redirect_to edit_admin_category_path(@category)
    else
      render :action => "new"
    end
  end

  # PUT /admin/items/1
  def update
    @item = Item.find(params[:id])
    @category = Category.find(params[:category_id])
    if @item.update_attributes(params[:item])
      flash[:notice] = 'Item was successfully updated.'
      redirect_to edit_admin_category_path(@category)
    else
      render :action => "edit"
    end
  end

  # DELETE /admin/items/1
  def destroy
    @item = Item.find(params[:id])
    @category = Category.find(params[:category_id])
    @item.destroy
    flash[:notice] = 'Item was successfully deleted.'
    redirect_to edit_admin_category_path(@category)
  end

  # delete attachment /admin/items/delete_attachment/1
  def delete_attachment
      @item = Item.find(params[:id])
      @category = Category.find(params[:category_id])
      @item.attachment = nil
      if @item.save
        flash[:notice] = 'Item image successfully deleted.'
      else
        flash[:error] = 'Item image could not be deleted.'
      end
      redirect_to edit_admin_category_item_path(@category, @item)
  end

end

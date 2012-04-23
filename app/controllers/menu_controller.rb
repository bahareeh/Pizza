class MenuController < ApplicationController

  def index
    @callout = Callout.find_by_name('catering')
  end

  def category
    # get category
    @category = Category.find_by_slug!(params[:category])
    # redirect root pizzas
    if @category.slug == "pizzas"
      redirect_to :action => 'subcategory', :category => 'pizzas', :subcategory => "classics"
    end
  end

  def subcategory
    # get subcategory
    @subcategory = Category.find_by_slug!(params[:subcategory])
    # custom pizzas/personal view
    if @subcategory.slug == "personal"
      render :template => "menu/pizzas_personal"
    elsif @subcategory.slug == "gluten"
      render :template => "menu/pizzas_gluten"
    end
  end

end

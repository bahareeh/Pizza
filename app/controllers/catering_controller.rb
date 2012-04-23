class CateringController < ApplicationController

  def index
    redirect_to :action => "menu"
  end

  def menu
    @category = Category.find_by_slug('catering')
    @callout = Callout.find_by_name('gift-cards')
  end

  def info
    @category = Category.find_by_slug('catering')
    @callout = Callout.find_by_name('gift-cards')
  end

end

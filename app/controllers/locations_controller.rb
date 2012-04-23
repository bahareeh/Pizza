class LocationsController < ApplicationController

  def index
    @locations = Location.find(:all, :order => 'position ASC')
  end

end

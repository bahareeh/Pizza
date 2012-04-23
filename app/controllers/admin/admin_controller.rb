class Admin::AdminController < ApplicationController

  include AuthenticatedSystem

  before_filter :login_required
  layout 'admin'

  def index
    # temporary redirect to News
    redirect_to :controller => 'posts'
  end

end

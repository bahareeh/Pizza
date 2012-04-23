class HomeController < ApplicationController

  def index
    @slide = Slide.find(:first, :order => :random)
    @callout = Callout.find(:first, :order => :random)
  end

  def tv
    @slide = Slide.find(:first, :order => 'position ASC')
    @callout = Callout.find(:first, :order => :random)
    render :action => 'index'
  end

  def slides
    @slides = Slide.find(:all, :order => 'position ASC')
    render :json => @slides.to_json(:only => [:tagline1, :tagline2, :url, :caveat], :methods => :image)
  end

  def sitemap
    @posts = Post.find(:all, :limit => 100)
    @categories = Category.find(:all)
  end

end

class AboutController < ApplicationController

  def index
    redirect_to :action => "news"
  end

  def news_recent
    @tags = tag_cloud
    @posts = Post.find(:all, :limit => 3, :order => 'created_at DESC')
  end

  def news_view
    @tags = tag_cloud
    @post = Post.find_by_id(params[:id])
    # no such post
    if @post.blank?
      redirect_to :action => "news"
    end
  end

  def news_archive
    @tags = tag_cloud
    @posts = Post.find(:all, :order => 'created_at DESC')
  end
  
  def news_tagged
    @tags = tag_cloud
    @tag = params[:tag]
    # find all messages with tag params[:tag]
    @posts = Post.find_tagged_with(@tag, :order => 'created_at DESC')
    # no such tag
    if @posts.blank?
      redirect_to :action => "news"
    end
  end

  def community
    @callout = Callout.find_by_name('franchise')
  end

  def history
    @callout = Callout.find_by_name('franchise')
  end

  def franchising
  end

  def careers
    @jobapp = JobApplication.new
  end

  def careers_apply
    @jobapp = JobApplication.new(params[:job_application])
    if @jobapp.save
      Email.deliver_job_application(@jobapp)
      @jobapp.destroy
      redirect_to :action => "careers_thanks"
    else
      render :action => "careers"
    end
  end

  def careers_thanks
  end

  def contact
    @comment = Comment.new
  end

  def contact_comment
    @comment = Comment.new(params[:comment])
    if @comment.valid?
      Email.deliver_comment(@comment)
      redirect_to :action => "contact_thanks"
    end
  end

  def contact_thanks
  end

  def gift_cards
  end

  def privacy
  end

private

  def tag_cloud
    @tags = Post.tag_counts
  end
  
end

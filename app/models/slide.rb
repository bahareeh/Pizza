class Slide < ActiveRecord::Base

  validates_presence_of :tagline1, :tagline2
  validates_numericality_of :position

  has_attached_file :attachment,
      :path => "public/:attachment/slides/:id_:style_:basename.:extension",
      :url => "/:attachment/slides/:id_:style_:basename.:extension",
      :styles => { :large => "1200", :thumb => "100x100" }
  validates_attachment_size :attachment,
    :less_than => 2.megabytes,
    :message => "must be under 2 Mb"
  validates_attachment_content_type :attachment, 
      :content_type => ["image/jpeg"], 
      :message => "must be an image file (.jpg)."

  def formatted_tagline
    tagline = tagline1 + '<br/>' + tagline2
    unless url.blank?
      tagline = "<a href=\"#{url}\">#{tagline} <span></span></a>"
    end
    unless caveat.blank?
      tagline = "#{tagline} <em>#{caveat}</em>"
    end
    tagline
  end

  # chooses from admin-uploaded slide, original slide, or default slide
  def image
    if attachment?
      attachment.url(:large)
    elsif filename?
      "/images/slides/#{filename}"
    else
      "/images/slides/default.jpg"
    end
  end

end

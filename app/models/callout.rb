class Callout < ActiveRecord::Base

  validates_presence_of :name, :alt, :url, :filename

  has_attached_file :attachment,
      :path => "public/:attachment/callouts/:id_:style_:basename.:extension",
      :url => "/:attachment/callouts/:id_:style_:basename.:extension",
      :styles => { :medium => "350x180", :thumb => "100" }
  validates_attachment_size :attachment,
      :less_than => 2.megabytes,
      :message => "must be under 2 Mb"
  validates_attachment_content_type :attachment, 
      :content_type => ["image/png"], 
      :message => "must be an image file (.png)."

  # chooses from admin-uploaded callout, original callout, or nil
  def image
    if attachment?
      attachment.url(:medium)
    elsif filename?
      "/images/callouts/#{filename}"
    else
      "/images/callouts/default.png"
    end
  end

end

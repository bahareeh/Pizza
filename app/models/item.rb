class Item < ActiveRecord::Base

  belongs_to :category

  validates_presence_of :title, :body, :category_id
  validates_numericality_of :position

  has_attached_file :attachment,
      :path => "public/:attachment/items/:id_:style_:basename.:extension",
      :url => "/:attachment/items/:id_:style_:basename.:extension",
      :styles => { :large => "400", :thumb => "100x100" }
  validates_attachment_size :attachment,
    :less_than => 2.megabytes,
    :message => "must be under 2 Mb"
  validates_attachment_content_type :attachment, 
      :content_type => ["image/jpeg"], 
      :message => "must be an image file (.jpg)."

  # chooses from admin-uploaded image, original image, or nil
  def image
    if attachment?
      attachment.url(:large)
    elsif filename?
      "/images/menu/#{filename}"
    else
      nil
    end
  end

end

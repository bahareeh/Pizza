class Post < ActiveRecord::Base

  validates_presence_of :title, :body, :tag_list
  validates_length_of :title, :maximum => 128

  has_attached_file :attachment,
      :path => "public/:attachment/posts/:id_:style_:basename.:extension",
      :url => "/:attachment/posts/:id_:style_:basename.:extension",
      :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_size :attachment,
      :less_than => 2.megabytes,
      :message => "must be under 2 Mb"
  validates_attachment_content_type :attachment, 
      :content_type => ["image/jpeg", "image/png", "image/gif"], 
      :message => "must be an image file (.jpg, .png, .gif)."

  acts_as_taggable

  def to_param
    "#{id}-#{permalink}"
  end
  
  def permalink
    # TODO make gsub handle special characters
    title.gsub(/\s/, "-").gsub(/[^\w-]/, '').downcase
  end

end

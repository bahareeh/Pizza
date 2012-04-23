class JobApplication < ActiveRecord::Base

  validates_presence_of :name, :hours, :location_id, :position, :phone
  validates_format_of :email,
    :with => /^([^@s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})$/i

  belongs_to :location

  has_attached_file :attachment, :path => "public/:attachment/jobapp/:id_:basename:extension"
  validates_attachment_size :attachment, :less_than => 2.megabytes, :message => "must be under 2 Mb"

end

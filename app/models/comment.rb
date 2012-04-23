class Comment < ActiveRecord::Base

  validates_presence_of :name, :body
  validates_format_of :email,
    :with => /^([^@s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})$/i

  belongs_to :location

end

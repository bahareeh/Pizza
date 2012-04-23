class Location < ActiveRecord::Base
  belongs_to :province
  has_many :job_applications
  has_many :contacts
  
  validates_presence_of :name, :map_url, :street, :city, :province_id, :postal_code, :email, :phone
  
end

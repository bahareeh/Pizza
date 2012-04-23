class AddPostalCodeToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :postal_code, :string
  end

  def self.down
    remove_column :locations, :postal_code
  end
end

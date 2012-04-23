class AddGoogleMapLinkToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :map_url, :string
  end

  def self.down
    remove_column :locations, :map_url
  end
end

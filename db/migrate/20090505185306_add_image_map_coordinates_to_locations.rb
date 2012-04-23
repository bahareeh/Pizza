class AddImageMapCoordinatesToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :image_map_coordinates, :string
  end

  def self.down
    remove_column :locations, :image_map_coordinates
  end
end

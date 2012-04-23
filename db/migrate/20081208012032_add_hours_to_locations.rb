class AddHoursToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :hours, :text
  end

  def self.down
    remove_column :locations, :hours
  end
end

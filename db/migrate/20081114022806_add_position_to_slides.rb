class AddPositionToSlides < ActiveRecord::Migration
  def self.up
    add_column :slides, :position, :integer, :default => 0
  end

  def self.down
    remove_column :slides, :position
  end
end

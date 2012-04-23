class AddCaveatToSlides < ActiveRecord::Migration
  def self.up
    add_column :slides, :caveat, :string
  end

  def self.down
    remove_column :slides, :caveat
  end
end

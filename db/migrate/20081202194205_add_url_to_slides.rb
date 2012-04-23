class AddUrlToSlides < ActiveRecord::Migration
  def self.up
    add_column :slides, :url, :string
  end

  def self.down
    remove_column :slides, :url
  end
end

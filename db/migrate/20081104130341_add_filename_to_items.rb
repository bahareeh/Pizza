class AddFilenameToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :filename, :text
  end

  def self.down
    remove_column :items, :filename
  end
end

class CreateCallouts < ActiveRecord::Migration
  def self.up
    create_table :callouts do |t|
      t.text :name
      t.text :alt
      t.text :url
      t.text :filename

      t.timestamps
    end
  end

  def self.down
    drop_table :callouts
  end
end

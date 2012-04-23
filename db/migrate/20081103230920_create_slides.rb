class CreateSlides < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.string :tagline1
      t.string :tagline2
      t.text :filename

      t.timestamps
    end
  end

  def self.down
    drop_table :slides
  end
end

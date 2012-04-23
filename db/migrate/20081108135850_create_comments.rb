class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :body
      t.integer :location_id
      t.string :subject

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end

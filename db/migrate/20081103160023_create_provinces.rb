class CreateProvinces < ActiveRecord::Migration
  def self.up
    create_table :provinces do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end

  def self.down
    drop_table :provinces
  end
end

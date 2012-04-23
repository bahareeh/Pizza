class CreateJobApplications < ActiveRecord::Migration
  def self.up
    create_table :job_applications do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :hours
      t.string :position
      t.integer :location_id
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :job_applications
  end
end

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.text :description
      t.integer :attendance_num
      t.references :member
      t.timestamps
    end
  end
end

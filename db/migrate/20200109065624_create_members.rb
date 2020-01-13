class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :gender
      t.date :dob
      t.string :status
      t.string :occupation
      t.string :phone
      t.string :email
      t.string :instagram
      t.string :line
      t.text :address
      
      t.timestamps
    end
  end
end

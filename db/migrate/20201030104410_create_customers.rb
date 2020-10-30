class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :profile_pic
      t.text :address, null: false

      t.timestamps
    end
  end
end

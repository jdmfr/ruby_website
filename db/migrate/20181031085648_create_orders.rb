class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.integer :phone
      t.integer :pay_type

      t.timestamps
    end
  end
end

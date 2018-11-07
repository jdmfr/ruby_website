class AddCatagoryRefToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :catagory, foreign_key: true
  end
end

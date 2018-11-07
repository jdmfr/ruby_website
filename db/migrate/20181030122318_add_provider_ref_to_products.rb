class AddProviderRefToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :provider, foreign_key: true
  end
end

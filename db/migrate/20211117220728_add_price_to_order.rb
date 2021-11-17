class AddPriceToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :price, :decimal, precision: 7, scale: 2
  end
end

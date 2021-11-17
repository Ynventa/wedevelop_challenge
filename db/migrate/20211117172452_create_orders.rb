class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :book_id
      t.integer :client_id
      t.datetime :datetime

      t.timestamps
    end

    add_foreign_key "orders", "clients", on_delete: :nullify
    add_foreign_key "orders", "books", on_delete: :nullify
  end
end

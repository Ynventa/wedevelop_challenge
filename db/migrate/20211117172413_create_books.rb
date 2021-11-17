class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.integer :stock
      t.decimal :price, precision: 7, scale: 2

      t.timestamps
    end

    add_foreign_key "books", "authors", on_delete: :cascade
  end
end

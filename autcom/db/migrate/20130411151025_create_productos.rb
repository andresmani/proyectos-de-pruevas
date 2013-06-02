class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :name
      t.references :marca

      t.timestamps
    end
    add_index :productos, :marca_id
  end
end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.references :brand

      t.timestamps
    end
    add_index :products, :brand_id
  end
end

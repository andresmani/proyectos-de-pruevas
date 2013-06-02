class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :identificacion
      t.string :email
      t.date :fch_ncto
      t.string :telefono
      t.references :municipio
      t.timestamps
    end
    add_index :personas, :municipio_id
    add_attachment :users, :avatar
  end
end

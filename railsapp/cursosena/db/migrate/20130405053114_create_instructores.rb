class CreateInstructores < ActiveRecord::Migration
  def change
    create_table :instructores do |t|
      t.string :nombre
      t.string :apellido
      t.string :cedula
      t.string :telefono
      t.string :direccion
      t.references :materia

      t.timestamps
    end
    add_index :instructores, :materia_id
  end
end

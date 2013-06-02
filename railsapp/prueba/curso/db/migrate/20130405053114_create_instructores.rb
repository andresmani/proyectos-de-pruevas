class CreateInstructores < ActiveRecord::Migration
  def change
    create_table :instructores do |t|
      t.string :nombre
      t.string :apellido
      t.string :cedula
      t.string :telefono
      t.string :direccion

      t.timestamps
    end
  end
end

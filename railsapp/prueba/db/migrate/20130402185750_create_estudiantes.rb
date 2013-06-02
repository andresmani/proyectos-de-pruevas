class CreateEstudiantes < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.string :nombres
      t.string :apellidos
      t.string :cedula
      t.string :email
      t.string :direccion
      t.date :fch_nacimiento

      t.timestamps
    end
  end
end

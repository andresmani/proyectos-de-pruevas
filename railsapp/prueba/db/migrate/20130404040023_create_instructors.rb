class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :nombres
      t.string :apellidos
      t.string :cedula
      t.string :email
      t.string :direccion
      t.string :telefono
      t.date :fch_ncto
      t.string :modalidad

      t.timestamps
    end
  end
end

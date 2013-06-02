class CreateMaterias < ActiveRecord::Migration
  def change
    create_table :materias do |t|
      t.string :nombre_materia

      t.timestamps
    end
  end
end

# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130405053300) do

  create_table "asignaturas", :force => true do |t|
    t.string   "nombre_asignatura"
    t.string   "ficha"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "estudiantes", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "cedula"
    t.string   "telefono"
    t.string   "direccion"
    t.integer  "asignatura_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "estudiantes", ["asignatura_id"], :name => "index_estudiantes_on_asignatura_id"

  create_table "horarios", :force => true do |t|
    t.date     "dia"
    t.time     "hora"
    t.string   "aula"
    t.integer  "materia_id"
    t.integer  "instructor_id"
    t.integer  "asignatura_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "horarios", ["asignatura_id"], :name => "index_horarios_on_asignatura_id"
  add_index "horarios", ["instructor_id"], :name => "index_horarios_on_instructor_id"
  add_index "horarios", ["materia_id"], :name => "index_horarios_on_materia_id"

  create_table "instructores", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "cedula"
    t.string   "telefono"
    t.string   "direccion"
    t.integer  "materia_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "instructores", ["materia_id"], :name => "index_instructores_on_materia_id"

  create_table "materias", :force => true do |t|
    t.string   "nombre_materia"
    t.integer  "asignatura_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "materias", ["asignatura_id"], :name => "index_materias_on_asignatura_id"

end
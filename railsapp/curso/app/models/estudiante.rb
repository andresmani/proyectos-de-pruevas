class Estudiante < ActiveRecord::Base
  belongs_to :curso
  attr_accessible :apellido, :cedula, :direccion, :nombre, :telefono
end

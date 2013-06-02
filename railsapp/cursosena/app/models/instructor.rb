class Instructor < ActiveRecord::Base
	has_many :horarios
	belongs_to :materia
  attr_accessible :apellido, :cedula, :direccion, :nombre, :telefono, :materia_id
 
  validate :nombre, :presence => true, :length => {:maximum => 80}
  validate :apellido, :presence => true, :length => {:maximum => 80}
  validate :cedula, :presence => true, :uniqueness => true, :length => {:maximum => 20}
  validate :telefono, :presence => true, :uniqueness => true, :length => {:maximum => 18}
  validate :direccion, :presence => true, :uniqueness => true 
  
  def self.search(search)

  	where('nombre like ? or apellido like ?', "%#{search}%", "%#{search}%")
  	
  end
end

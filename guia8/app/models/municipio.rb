class Municipio < ActiveRecord::Base
  belongs_to :departamento
  has_many :personas, :dependent => :destroy
  attr_accessible :nombre, :departamento_nombre

  validates :nombre, :presence => true,
  	:length => {:minimum => 3 }


	def departamento_nombre
		departamento.nombre if departamento
	end

	def departamento_nombre=(name)
		self.departamento = Departamento.find_or_create_by_nombre(name) unless nombre.blank?
	end

	def self.municipio_lugar(munic)
		@ubicacion = munic.nombre + ' | ' + munic.departamento.nombre + ' | ' + munic.departamento.pais.nombre
	end

	def self.search(search)
		where('nombre like ? ',"%#{search}%")
	end

end

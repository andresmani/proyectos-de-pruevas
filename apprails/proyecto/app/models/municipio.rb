class Municipio < ActiveRecord::Base
  belongs_to :departamento
  has_many :personas
  attr_accessible :nombre, :departamento_nombre, :pernosas

	def departamento_nombre
		departamento.nombre if departamento
	end

	def departamento_nombre=(name)
		self.departamento = Departamento.find_or_create_by_nombre(name) unless nombre.blank?
	end

	def self.search(search)
		where('nombre like ? ',"%#{search}%")
	end

end

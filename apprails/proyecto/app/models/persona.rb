class Persona < ActiveRecord::Base
  belongs_to :municipio
  attr_accessible :email, :fch_ncto, :identificacion, :nombre, :telefono, :municipio_nombre

	def municipio_nombre
		municipio.nombre if municipio
	end

	def municipio_nombre=(name)
		self.municipio = Municipio.find_or_create_by_nombre(name) unless name.blank?
	end

end

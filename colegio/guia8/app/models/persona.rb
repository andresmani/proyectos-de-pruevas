class Persona < ActiveRecord::Base
  belongs_to :municipio
  attr_accessible :email, :fch_ncto, :identificacion, :nombre, :telefono,  :municipio_nombre

	validates :nombre, :presence => true,
	:length => { :minimum => 3, :maximum => 80 }

	validates :email, :presence => true,
	:uniqueness => true,
	:format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

	validates :identificacion, :presence => true,
	:uniqueness => true,
	:length => { :minimum => 7}
	
	validates :telefono, :presence => true,
	:length => { :minimum => 7, :maximum => 15 },
	:numericality => true

	


    def municipio_nombre

	   municipio.nombre if municipio
	end

	def municipio_nombre=(nombre)
	    self.municipio = Municipio.find_or_create_by_nombre(nombre) unless nombre.blank?
	end

	def self.search(search)
        where('nombre like ?', "%#{search}%")
    end

end

class Municipio < ActiveRecord::Base
  
  #relacion de paderes e hijos
  belongs_to :departamento
  has_many  :personas, :dependent => :destroy

   #campos de la tabla
   attr_accessible :nombre, :departamento_nombre
   
   #validacion de los campos
  validates :nombre, :presence => true,
  :length => { :minimum => 3,:maximum => 80 }


     #los tres metodos  son del auto complete
    def departamento_nombre
	    departamento.nombre if departamento
	end
	
	def departamento_nombre=(nombre)
	    self.departamento = Departamento.find_or_create_by_nombre(nombre) unless nombre.blank?
	end

	def self.municipio_ubicacion(munic) # este parametro  almacena la informacion del formulario municipio
		@ubicacion = munic.nombre + ' | ' + munic.departamento.nombre + ' | ' + munic.departamento.pais.nombre # la variable @ubicacion me guarda la concatenacion de las tablas
	end

	# codigo del  buscador 
	def self.search(search) 
     where('nombre like ?', "%#{search}%")
    end
end

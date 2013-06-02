class Departamento < ActiveRecord::Base
  belongs_to :pais
  has_many :municipios, :dependent => :destroy
  attr_accessible :nombre, :pais_nombre

 validates :nombre,  :presence => true, 
  	:length => {:minimum => 3, :maximum  => 30}

	def pais_nombre
		pais.nombre if pais
	end

	def pais_nombre=(name)
		self.pais = Pais.find_or_create_by_nombre(name) unless name.blank?
	end

	def self.search(search)
		where('nombre like ?', "%#{search}%")
	end

end

class Estudiante < ActiveRecord::Base
	  belongs_to :curso

  attr_accessible :cedula, :direccion, :telefono, :email, :apellido, :nombre, :curso_id
  
  
def self.search(search)
where('nombre like ? or cedula like ? or direccion like ? or email like ? ',"%#{search}%" ,"%#{search}%","%#{search}%","%#{search}%")
end

end

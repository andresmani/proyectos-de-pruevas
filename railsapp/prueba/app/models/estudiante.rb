class Estudiante < ActiveRecord::Base

  attr_accessible :apellidos, :cedula, :direccion, :email, :fch_nacimiento, :nombres

  def self.search(search)
      
   	where('nombres like ?',"%#{search}%")
  end

  validates :nombres,:presence => true,
	:length => {:maximum => 80}

  validates :email,:presence => true,:uniqueness => true,:format => {:whit => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/!}	

  validates :cedula,:presence => true,
	:length => {:minimum => 6,:maximum => 15},
	:numericality => true	
  
end

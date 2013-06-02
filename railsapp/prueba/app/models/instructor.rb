class Instructor < ActiveRecord::Base
  attr_accessible :apellidos, :cedula, :direccion, :email, :fch_ncto, :modalidad, :nombres, :telefono

  def self.search(search)

  	where('nombres like ?',"%#{search}%") 
  	
  end

  validates :nombres,:presence => true,
	:length => {:maximum => 80}

  validates :modalidad,:presence => true,
	:length => {:maximum => 80}	

  validates :telefono,:presence => true,
	:length => {:maximum => 80}		

  validates :apellidos,:presence => true,
  :length => {:maximum => 80}

  validates :direccion,:presence => true,
  :length => {:maximum => 80}

  validates :email,:presence => true,:uniqueness => true,:format => {:with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}	

  validates :cedula,:presence => true,                              

	:length => {:minimum => 6,:maximum => 15},
	:numericality => true	
end

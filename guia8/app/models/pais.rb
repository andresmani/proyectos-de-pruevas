class Pais < ActiveRecord::Base
  attr_accessible :nombre 
  has_many :departamentos, :dependent => :destroy


  validates :nombre,  :presence => true, 
   :uniqueness => true,
  	:length => {:minimum => 3, :maximum  => 30}

  def self.search(search)
   where('nombre like ?', "%#{search}%")
  end
  
end

class Pais < ActiveRecord::Base
has_many :departamentos, :dependent => :destroy
attr_accessible :nombre 

validates :nombre, :presence => true, 
 :uniqueness => true,
 :length => { :maximum => 80 }
 
	def self.search(search)
     where('nombre like ?', "%#{search}%")
    end
end

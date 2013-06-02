class Pais < ActiveRecord::Base
  attr_accessible :nombre 
  has_many :departamentos

  def self.search(search)
where('nombre like ?', "%#{search}%")
end

end

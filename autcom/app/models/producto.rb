class Producto < ActiveRecord::Base
  belongs_to :marca
  attr_accessible :name, :marca_name
  attr_accessible :marca_name

  def marca_name
  	marca.name if marca
  end

  def marca_name=(name)
  	self.marca = Marca.find_or_create_by_name(name) unless name.blank?
  end
end

class Marca < ActiveRecord::Base
	has_many :productos
  attr_accessible :id, :name

  def funky_method
    "#{self.name}"
  end
end

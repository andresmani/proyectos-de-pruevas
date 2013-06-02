class Brand < ActiveRecord::Base
  has_many :products
  attr_accessible :name

  def funky_method
    "#{self.name}"
  end

end

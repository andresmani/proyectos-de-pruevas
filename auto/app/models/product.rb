class Product < ActiveRecord::Base
  belongs_to :brand
  attr_accessible :name, :brand_name

def brand_name
      brand.name if brand
  end

  def brand_name=(name)
    self.brand = Brand.find_or_create_by_name(name) unless name.blank?      
  end

def self.pro_x_brand(brand)
  	data={}
  	i=""
  	brand.each do |b|
  		i = b.name
      @num_product = Product.find_all_by_brand_id(b.id) 
      @tol_per = Product.all
    data[i] = (@num_product.count*100.0/ @tol_per.count)
    end
   return data
  end		

end

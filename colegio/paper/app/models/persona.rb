class Persona < ActiveRecord::Base
  attr_accessible :identificacion, :nombre, :imagen


#codigo para subir fotos,documentos
has_attached_file :imagen, :styles => { :small => "100x100>" , :lsmall => "30x30>" },
                  :url  => "/assets/personas/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/personas/:id/:style/:basename.:extension"

validates_attachment_presence :imagen
validates_attachment_size :imagen, :less_than => 5.megabytes
validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png']

end

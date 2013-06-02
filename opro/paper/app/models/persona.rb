class Persona < ActiveRecord::Base
  attr_accessible :identificacion, :nombre, :photo


#codigo para subir fotos,documentos
has_attached_file :photo, :styles => { :small => "100x100>" , :lsmall => "30x30>" },
                  :url  => "/assets/personas/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/personas/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end

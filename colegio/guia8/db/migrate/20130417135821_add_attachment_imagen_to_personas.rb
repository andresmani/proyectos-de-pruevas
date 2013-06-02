class AddAttachmentImagenToPersonas < ActiveRecord::Migration
  def self.up
    change_table :personas do |t|
      t.attachment :imagen
    end
  end

  def self.down
    drop_attached_file :personas, :imagen
  end
end

class AddAttachmentPhotoToPersonas < ActiveRecord::Migration
  def self.up
    change_table :personas do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :personas, :photo
  end
end

class AddAttachmentAvatarToPersonas < ActiveRecord::Migration
  def self.up
    change_table :personas do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :personas, :avatar
  end
end

class AddAttachmentPastorPhotoToLocations < ActiveRecord::Migration[5.0]
  def self.up
    change_table :locations do |t|
      t.attachment :pastor_photo
    end
  end

  def self.down
    remove_attachment :locations, :pastor_photo
  end
end

class AddAttachmentPhotoToLocations < ActiveRecord::Migration[5.0]
  def self.up
    change_table :locations do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :locations, :photo
  end
end

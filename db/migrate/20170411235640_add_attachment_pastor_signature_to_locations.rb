class AddAttachmentPastorSignatureToLocations < ActiveRecord::Migration[5.0]
  def self.up
    change_table :locations do |t|
      t.attachment :pastor_signature
    end
  end

  def self.down
    remove_attachment :locations, :pastor_signature
  end
end

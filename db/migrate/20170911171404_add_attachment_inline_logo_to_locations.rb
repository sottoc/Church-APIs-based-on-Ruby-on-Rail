class AddAttachmentInlineLogoToLocations < ActiveRecord::Migration[5.0]
  def self.up
    change_table :locations do |t|
      t.attachment :inline_logo
    end
  end

  def self.down
    remove_attachment :locations, :inline_logo
  end
end

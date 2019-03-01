class AddAttachmentSourceToPodcasts < ActiveRecord::Migration[5.0]
  def self.up
    change_table :podcasts do |t|
      t.attachment :source
    end
  end

  def self.down
    drop_attached_file :podcasts, :source
  end
end

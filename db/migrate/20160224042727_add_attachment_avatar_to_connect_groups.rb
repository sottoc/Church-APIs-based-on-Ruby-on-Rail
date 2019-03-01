class AddAttachmentAvatarToConnectGroups < ActiveRecord::Migration[5.0]
  def self.up
    change_table :connect_groups do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :connect_groups, :avatar
  end
end

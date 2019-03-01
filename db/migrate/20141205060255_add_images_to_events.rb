class AddImagesToEvents < ActiveRecord::Migration[5.0]
def self.up
    add_attachment :events, :image
  end

  def self.down
    remove_attachment :events, :image

  end
end

class AddSocialLinksToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :facebook, :string
    add_column :locations, :twitter, :string
    add_column :locations, :instagram, :string
  end
end

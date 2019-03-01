class AddShowInListingToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :show_in_listing, :boolean
  end
end

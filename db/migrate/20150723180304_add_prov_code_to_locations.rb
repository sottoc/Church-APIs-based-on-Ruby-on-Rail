class AddProvCodeToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :province, :string
    add_column :locations, :code, :string
  end
end

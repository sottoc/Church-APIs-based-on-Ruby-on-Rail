class AddLocationToConnectGroups < ActiveRecord::Migration[5.0]
  def change
    add_reference :connect_groups, :location, index: true
  end
end

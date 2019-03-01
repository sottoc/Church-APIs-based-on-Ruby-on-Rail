class RenameLocationInConnectGroupsToAddress < ActiveRecord::Migration[5.0]
  def change
    rename_column :connect_groups, :location, :address
  end
end

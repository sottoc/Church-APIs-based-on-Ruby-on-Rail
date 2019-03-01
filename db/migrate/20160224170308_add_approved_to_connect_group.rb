class AddApprovedToConnectGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :connect_groups, :approved, :boolean
  end
end

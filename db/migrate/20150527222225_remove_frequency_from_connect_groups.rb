class RemoveFrequencyFromConnectGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :connect_groups, :frequency, :string
  end
end

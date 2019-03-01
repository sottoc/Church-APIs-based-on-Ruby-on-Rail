class RemoveAssistantFromConnectGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :connect_groups, :assistant, :string
  end
end

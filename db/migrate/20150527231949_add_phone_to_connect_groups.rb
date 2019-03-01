class AddPhoneToConnectGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :connect_groups, :phone, :string
  end
end

class DropDonations < ActiveRecord::Migration[5.0]
  def change
    drop_table :donations
    drop_table :meetings
    drop_table :groups
    drop_table  :group_types
  end
end

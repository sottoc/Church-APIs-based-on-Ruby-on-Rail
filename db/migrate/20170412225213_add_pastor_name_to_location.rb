class AddPastorNameToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :pastor_name, :string
  end
end

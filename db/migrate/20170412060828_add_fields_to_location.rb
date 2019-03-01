class AddFieldsToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :day, :string
    add_column :locations, :times, :string
    add_column :locations, :welcome, :text
  end
end

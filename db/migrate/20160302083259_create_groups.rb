class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :visitors
      t.integer :meetings
      t.integer :group_type_id

      t.timestamps
    end
  end
end

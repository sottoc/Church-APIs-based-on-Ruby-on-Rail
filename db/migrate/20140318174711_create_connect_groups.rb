class CreateConnectGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :connect_groups do |t|
      t.string :name
      t.string :leader
      t.string :assistant
      t.string :location
      t.time :time
      t.string :day
      t.string :frequency
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

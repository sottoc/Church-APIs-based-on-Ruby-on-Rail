class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.float :attendance
      t.float :decisions
      t.float :visitors
      t.date :start_date
      t.integer :group_id

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :descripton
      t.datetime :starttime
      t.datetime :endtime

      t.timestamps
    end
  end
end

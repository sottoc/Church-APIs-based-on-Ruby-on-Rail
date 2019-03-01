class AddRepeatToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :repeat, :boolean
    add_column :events, :frequency, :string
    add_column :events, :limit, :integer
    add_column :events, :repeat_day, :integer
    add_column :events, :repeat_date, :boolean
    add_column :events, :repeat_week, :integer
  end
end

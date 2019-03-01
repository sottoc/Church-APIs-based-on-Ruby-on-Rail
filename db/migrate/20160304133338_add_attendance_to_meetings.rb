class AddAttendanceToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :calculated_attendance, :integer
    add_column :meetings, :entered_attendance, :integer
  end
end

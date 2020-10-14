class ChangeEventColumnNameInAttendance < ActiveRecord::Migration[6.0]
  def change
    rename_column :attendances, :event_id, :attended_event_id
  end
end

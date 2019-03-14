class AddValidationToAttendance < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :validation, :boolean
  end
end

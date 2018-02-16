class ModifyBeginDateToDateTimeFromDateInProjectUserReservations < ActiveRecord::Migration[5.1]
  def change
    change_column :project_user_reservations, :begin_date, :datetime
  end
end

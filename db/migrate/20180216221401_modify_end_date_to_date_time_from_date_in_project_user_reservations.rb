class ModifyEndDateToDateTimeFromDateInProjectUserReservations < ActiveRecord::Migration[5.1]
  def change
    change_column :project_user_reservations, :end_date, :datetime    
  end
end

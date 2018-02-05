class RenameProjectUserToProjectUserIdInProjectUserReservations < ActiveRecord::Migration[5.1]
  def change
    rename_column :project_user_reservations, :project_user, :project_user_id
  end
end

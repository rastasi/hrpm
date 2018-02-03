class CreateProjectUserReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :project_user_reservations do |t|
      t.integer :project_user
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end

class CreateHolidays < ActiveRecord::Migration[5.1]
  def change
    create_table :holidays do |t|
      t.datetime :begin_date
      t.datetime :end_date
      t.integer :user_id
      t.timestamps
    end
  end
end

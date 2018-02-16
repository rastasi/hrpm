class AddApplicableToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :applicable, :boolean, default: true
  end
end

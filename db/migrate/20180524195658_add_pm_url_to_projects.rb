class AddPmUrlToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :pm_url, :string
  end
end

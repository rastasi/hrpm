ActiveAdmin.register ProjectUserReservation do
  permit_params :project_user_id, :begin_date, :end_date
  actions :new, :create, :edit, :update, :delete, :index    
  belongs_to :project_user
  index do
    selectable_column
    column :begin_date
    column :end_date
    actions
  end
end

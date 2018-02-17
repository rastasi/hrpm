ActiveAdmin.register ProjectUserReservation do
  permit_params :project_user_id, :begin_date_date, :begin_date_time_hour, :begin_date_time_minute, :end_date_date, :end_date_time_hour, :end_date_time_minute
  actions :new, :create, :edit, :update, :destroy, :index    
  belongs_to :project_user

  form do |f|
    f.inputs do
      f.input :project_user
      f.input :begin_date, as: :just_datetime_picker
      f.input :end_date, as: :just_datetime_picker
    end
    f.actions
  end

  index do
    selectable_column
    column :begin_date
    column :end_date
    actions
  end
end

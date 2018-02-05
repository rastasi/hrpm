ActiveAdmin.register ProjectUserReservation do
  menu parent: 'Projects'
  permit_params :project_user_id, :begin_date, :end_date
  belongs_to :project_user
end

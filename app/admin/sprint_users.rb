ActiveAdmin.register SprintUser do
  belongs_to :sprint
  permit_params :user_id, :sprint_id, :percent
  actions :new, :create, :edit, :update, :destroy, :index
  config.filters = false
  
  index do
    selectable_column
    column do |sprint_user|
      sprint_user.user.try :name
    end
    column do |sprint_user|
      "#{:percent}%"
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :sprint_id, as: :select, collection: Sprint.all
      f.input :user_id, as: :select, collection: User.all
      f.input :percent, as: :select, collection: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    end
    f.actions
  end

end

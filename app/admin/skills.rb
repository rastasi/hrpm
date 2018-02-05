ActiveAdmin.register Skill do
  permit_params :name, :skill_group_id

  index do
    selectable_column
    column :name
    column :skill_group
    actions
  end
end

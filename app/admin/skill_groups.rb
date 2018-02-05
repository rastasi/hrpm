ActiveAdmin.register SkillGroup do
  menu parent: 'Misc'
  permit_params :name
  index do
    selectable_column
    column :name
    actions
  end
end

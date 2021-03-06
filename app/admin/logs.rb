ActiveAdmin.register Log do
  menu priority: 9999999
  actions :index, :show    

  index do
    selectable_column
    column :entity_type
    column :entity do |object|
      begin
        entity = object.entity_type.constantize.find(object.entity_id)
        entity.name
      rescue => e
        'Deleted'
      end
    end
    column :change do |object|
      out = ''
      change = JSON.parse(object.change)
      change.each do |field, diff|
        out += "<b>#{field.humanize}</b>: #{diff[0]} -> #{diff[1]}<br/>"
      end
      out.html_safe
    end
    column :created_at do |object|
      I18n.l(object.created_at)
    end
  end
end

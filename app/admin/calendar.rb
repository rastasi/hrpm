ActiveAdmin.register_page "Calendar" do
  menu priority: 2
  content do
    para "Calendar"
    render partial: 'calendar'
  end
end
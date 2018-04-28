# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

module ApplicationHelper
  def l(object, options = {})
    if object && object.class.in?([Time, Date, DateTime, ActiveSupport::TimeWithZone])
      super(object, options) 
    else
      object
    end
  end
end

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

module ApplicationHelper
  def l(object, options = {})
    super(object, options) if object
  end
end
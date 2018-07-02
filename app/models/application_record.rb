class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  before_save :create_log

  private

  def create_log
    return if self.class.name == 'Log'
    Log.create!(
      entity_id: self.id,
      entity_type: self.class.name,
      change: self.changes.to_json
    )
  end
end

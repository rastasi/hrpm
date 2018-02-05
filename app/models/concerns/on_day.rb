module OnDay
  extend ActiveSupport::Concern

  included do
    scope :on_day, -> (date) { where("begin_date <= ? and end_date >= ?", date, date) }
  end
end
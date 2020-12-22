class Order < ApplicationRecord
  include Calendarable

  validates :start_time, uniqueness: true
  belongs_to :user
  belongs_to :service
end

class Order < ApplicationRecord
  include Calendarable

  belongs_to :user
  belongs_to :service
end

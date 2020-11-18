class Company < ApplicationRecord
  has_many :services
  has_one :address
end
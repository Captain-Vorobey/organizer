class Company < ApplicationRecord
  has_many :service, dependent: :destroy
  has_one :address, as: :addressable
end

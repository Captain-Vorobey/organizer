class Company < ApplicationRecord
  belongs_to :service
  belongs_to :address
end

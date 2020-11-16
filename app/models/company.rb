class Company < ApplicationRecord
    belongs_to :address, as: :addressable
    has_many :services
end

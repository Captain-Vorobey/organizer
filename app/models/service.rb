class Service < ApplicationRecord
    has_many :users, through: :orders
end

class Order < ApplicationRecord
    belongs_to: services
    belongs_to: users
end

class Service < ApplicationRecord
    has_many :users, through: :orders
    has_many :orders
    belongs_to :company
end

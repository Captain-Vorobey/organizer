class Service < ApplicationRecord
    has_many :users, through: :orders
    belongs_to :company
end
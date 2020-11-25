class Service < ApplicationRecord
  include Search

  belongs_to :company
  has_many :orders
  has_many :users, through: :orders

  resourcify
end

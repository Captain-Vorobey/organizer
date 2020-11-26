class Service < ApplicationRecord
  include Searchable

  belongs_to :company
  has_many :orders
  has_many :users, through: :orders

  resourcify
end

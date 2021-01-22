class Service < ApplicationRecord
  paginates_per 3
  include Searchable
  include Avatar

  has_one_attached :avatar

  belongs_to :company
  has_many :orders
  has_many :users, through: :orders, dependent: :destroy
  has_one :time_limit, dependent: :destroy
  has_many :comments
  
  resourcify
end

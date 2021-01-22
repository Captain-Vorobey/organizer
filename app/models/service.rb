class Service < ApplicationRecord
  include Searchable
  include Avatar

  has_one_attached :avatar

  belongs_to :company
  has_many :orders
  has_many :users, through: :orders, dependent: :destroy
  has_one :time_limit, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  resourcify
end

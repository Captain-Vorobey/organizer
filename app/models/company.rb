class Company < ApplicationRecord
  include Avatar

  has_one_attached :avatar

  has_many :services, dependent: :destroy
  has_one :address, as: :addressable
  has_many :comments, as: :commentable
end

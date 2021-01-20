class Service < ApplicationRecord
  include Searchable

  has_one_attached :avatar

  def avatar_thumbnail
    avatar.variant(resize: "150x150!").processed if avatar.attached?
  end

  belongs_to :company
  has_many :orders
  has_many :users, through: :orders,  dependent: :destroy
  has_one :time_limit,  dependent: :destroy
  resourcify
end

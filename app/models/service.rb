class Service < ApplicationRecord
  include Searchable
  include Avatar

  after_save    { logger.debug ['Updating document... ', index_document].join }
  after_destroy { logger.debug ['Deleting document... ', delete_document].join }

  paginates_per 3

  has_one_attached :avatar

  belongs_to :company
  has_many :orders
  has_many :users, through: :orders, dependent: :destroy
  has_one :time_limit, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  resourcify
end

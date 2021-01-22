class Comment < ApplicationRecord

  include Avatar

  belongs_to :user
  belongs_to :service
end

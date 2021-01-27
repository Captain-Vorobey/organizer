class Comment < ApplicationRecord
  include Avatar

  belongs_to :commentable, polymorphic: true
  belongs_to :user
end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :company

  after_create_commit do
    MessageBroadcastJob.perform_later(self)
  end
end

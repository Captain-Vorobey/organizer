module ApplicationHelper
  def readable_time(time)
    time
  end

  def author_of(record)
    user_signed_in? && current_user.id == record.user_id
  end
end

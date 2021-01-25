module ServicesHelper
  def current_user_companies
    arr = Company.where(user_id: current_user.id)
  end
end

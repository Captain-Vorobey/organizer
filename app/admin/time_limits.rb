ActiveAdmin.register TimeLimit do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :start_time, :end_time, :user_id, :service_id, :length
  #
  # or
  #
  # permit_params do
  #   permitted = [:start_time, :end_time, :user_id, :service_id, :length]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end

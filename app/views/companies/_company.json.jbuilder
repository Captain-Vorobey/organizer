json.extract! company, :id, :name, :description, :avatar, :address_id, :user_id, :created_at, :updated_at
json.url company_url(company, format: :json)

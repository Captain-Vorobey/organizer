json.extract! order, :id, :name, :start_time, :end_time, :user_id, :service_id, :created_at, :updated_at
json.url order_url(order, format: :json)

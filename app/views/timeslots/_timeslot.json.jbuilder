json.extract! timeslot, :id, :name, :start_time, :end_time, :user_id, :created_at, :updated_at
json.url timeslot_url(timeslot, format: :json)

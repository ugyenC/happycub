json.extract! event, :id, :title, :category_id, :start_date, :end_date, :location, :capacity, :allow_guests, :created_at, :updated_at
json.url event_url(event, format: :json)

json.extract! landmark, :id, :lat, :lng, :name, :description, :created_at, :updated_at
json.url landmark_url(landmark, format: :json)

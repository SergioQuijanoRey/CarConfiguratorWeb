json.extract! user, :id, :username, :mail, :password, :role, :created_at, :updated_at
json.url user_url(user, format: :json)

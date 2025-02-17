json.extract! user, :id, :username, :name, :email, :password_digest, :phone, :address, :credit_card, :created_at, :updated_at
json.url user_url(user, format: :json)

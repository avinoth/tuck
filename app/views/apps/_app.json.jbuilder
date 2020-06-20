json.extract! app, :id, :name, :smtp_key, :smtp_secret, :smtp_address, :smtp_port, :smtp_authentication, :created_at, :updated_at
json.url app_url(app, format: :json)

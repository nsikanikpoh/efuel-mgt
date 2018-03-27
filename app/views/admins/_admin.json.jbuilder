json.extract! admin, :id, :fname, :lname, :address, :phone, :city, :state, :created_at, :updated_at
json.url admin_url(admin, format: :json)

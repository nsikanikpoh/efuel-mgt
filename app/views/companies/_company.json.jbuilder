json.extract! company, :id, :name, :address, :phone, :state, :city, :created_at, :updated_at
json.url company_url(company, format: :json)

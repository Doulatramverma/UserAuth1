json.extract! company, :id, :name, :country_id, :state_id, :city_id, :postcode, :start_date, :active, :created_at, :updated_at
json.url company_url(company, format: :json)

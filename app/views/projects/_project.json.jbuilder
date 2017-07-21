json.extract! project, :id, :name, :identifier, :address, :npa, :city, :country, :bill_option, :client_name, :client_address, :client_npa, :client_city, :client_country, :created_at, :updated_at
json.url project_url(project, format: :json)

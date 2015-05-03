json.array!(@companies) do |company|
  json.extract! company, :id, :name, :industry_id, :company_type_id, :extract, :country_id, :contact_name, :phones, :website, :logo, :email
  json.url company_url(company, format: :json)
end

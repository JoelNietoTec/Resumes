json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :forenames, :surnames, :email, :sex_id, :marital_status_id, :birth_date, :professional_title, :nationality_id, :country_id, :province_id, :district_id, :township_id, :address, :phone_number, :skills, :wage_aspiration, :presentation
  json.url profile_url(profile, format: :json)
end

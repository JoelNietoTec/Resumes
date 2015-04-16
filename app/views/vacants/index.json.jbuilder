json.array!(@vacants) do |vacant|
  json.extract! vacant, :id, :position, :professional_area_id, :country_id, :province_id, :district_id, :keywords, :due_date, :job_type_id, :wage_offer, :job_description, :active
  json.url vacant_url(vacant, format: :json)
end

json.array!(@estudies) do |estudy|
  json.extract! estudy, :id, :profile_id, :institution, :title, :education_level_id, :professional_area_id, :begin_year, :end_year, :finished
  json.url estudy_url(estudy, format: :json)
end

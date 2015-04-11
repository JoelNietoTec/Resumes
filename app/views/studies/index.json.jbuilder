json.array!(@studies) do |study|
  json.extract! study, :id, :profile_id, :institution, :title, :education_level_id, :professional_area_id, :begin_year, :end_year, :finished
  json.url study_url(study, format: :json)
end

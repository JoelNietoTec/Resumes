json.array!(@experiences) do |experience|
  json.extract! experience, :id, :profile_id, :company, :position, :professional_area_id, :starting_salary, :final_salary, :begin_date, :end_date, :job_description
  json.url experience_url(experience, format: :json)
end

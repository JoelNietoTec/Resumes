class Vacant < ActiveRecord::Base
  belongs_to :professional_area
  belongs_to :job_type
  acts_as_ordered_taggable_on :keywords
  belongs_to :province
  belongs_to :country
  belongs_to :district

  filterrific(
  default_filter_params: { sorted_by: 'created_at_desc' },
  available_filters: [
    :sorted_by,
    :search_query,
    :with_district_id,
    :with_job_type_id,
    :with_professional_area_id
  ]
)
end

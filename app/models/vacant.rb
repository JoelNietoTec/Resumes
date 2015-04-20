class Vacant < ActiveRecord::Base
  belongs_to :professional_area
  belongs_to :job_type
  acts_as_ordered_taggable_on :keywords
  belongs_to :province
  belongs_to :country
  belongs_to :district

  filterrific(
    available_filters: [
      :with_district_id,
      :with_province_id,
      :with_job_type_id,
      :with_professional_area_id
    ]
  )
  self.per_page = 10
  scope :with_province_id, lambda { |province_ids|
    where(:province_id => [*province_ids])
  }

  scope :with_district_id, lambda { |district_ids|
    where(:district_id => [*district_ids])
  }

  scope :with_job_type_id, lambda { |job_type_ids|
    where(:job_type_id => [*job_type_ids])
  }

  scope :with_professional_area_id, lambda { |professional_area_ids|
    where(:professional_area_id => [*professional_area_ids])
  }

end

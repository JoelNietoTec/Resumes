class Vacant < ActiveRecord::Base
  belongs_to :professional_area
  belongs_to :job_type
  acts_as_ordered_taggable_on :keywords
end

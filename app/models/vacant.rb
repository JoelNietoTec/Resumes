class Vacant < ActiveRecord::Base
  belongs_to :professional_area
  belongs_to :job_type
end

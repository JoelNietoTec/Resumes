class Experience < ActiveRecord::Base
  belongs_to :profile
  belongs_to :professional_area
end

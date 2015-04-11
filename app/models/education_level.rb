class EducationLevel < ActiveRecord::Base
  validates :name, uniqueness: true
end

class ProfessionalArea < ActiveRecord::Base
  validates :name, uniqueness: true
end

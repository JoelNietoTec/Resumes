class Study < ActiveRecord::Base
  belongs_to :profile
  belongs_to :professional_area
  belongs_to :education_level

  validates :institution, presence: { message: 'Completa este campo' }
  validates :title, presence: { message: 'Completa este campo' }
  validates :begin_year, presence: { message: 'Completa este campo' }
end

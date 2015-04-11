class Experience < ActiveRecord::Base
  belongs_to :profile
  belongs_to :professional_area
  validates :company, presence: { message: 'Completa este campo' }
  validates :position, presence: { message: 'Completa este campo' }
  validates :begin_date, presence: { message: 'Completa este campo' }
end

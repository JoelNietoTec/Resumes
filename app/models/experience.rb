class Experience < ActiveRecord::Base
  include DateModule
  belongs_to :profile
  belongs_to :professional_area
  validates :company, presence: { message: 'Completa este campo' }
  validates :position, presence: { message: 'Completa este campo' }
  validates :begin_date, presence: { message: 'Completa este campo' }

  def work_time
    time_elapsed(self.begin_date, self.end_date)
  end
end

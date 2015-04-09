class Township < ActiveRecord::Base
  belongs_to :district
  validates :name, uniqueness: { scope: :district_id }

  def title
    self.name.titleize
  end

end

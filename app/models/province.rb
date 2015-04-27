class Province < ActiveRecord::Base
  belongs_to :country
  validates :name, uniqueness: { scope: :country_id }
  has_many :districts
  has_many :townships, :through => :districts
  has_many :postulations
  def title
    self.name.titleize
  end
end

class Country < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :provinces
  has_many :districts, :through => :provinces

  def title
    self.name.titleize
  end

  def esp_title
    self.esp_name.titleize
  end
end

class EducativeArea < ActiveRecord::Base
  validates :name, uniqueness: true
  def title
    self.name.titleize
  end
end

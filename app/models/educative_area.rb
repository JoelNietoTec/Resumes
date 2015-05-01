class EducativeArea < ActiveRecord::Base
  validates :name, uniqueness: true
  def title
    self.name.titleize
  end

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name.titleize, e.id] }
  end
end

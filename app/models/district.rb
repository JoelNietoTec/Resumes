class District < ActiveRecord::Base
  belongs_to :province
  has_many :townships
  validates :name, uniqueness: { scope: :province_id }

  def title
    self.name.titleize
  end

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name.titleize, e.id] }
  end

end

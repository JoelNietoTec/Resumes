class PostulationStatus < ActiveRecord::Base
  validates :name, uniqueness: true
end

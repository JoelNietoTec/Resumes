class JobType < ActiveRecord::Base
  validates :name, uniqueness: true
end

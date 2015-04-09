class Sex < ActiveRecord::Base
  validates :name, uniqueness: true
end

class MaritalStatus < ActiveRecord::Base
  validates :name, uniqueness: true
end

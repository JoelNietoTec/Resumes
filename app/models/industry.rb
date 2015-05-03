class Industry < ActiveRecord::Base
  validates :name, uniqueness: true
end

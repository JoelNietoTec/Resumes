class CompanyType < ActiveRecord::Base
  validates :name, uniqueness: true
end

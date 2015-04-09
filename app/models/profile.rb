class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :sex
  belongs_to :marital_status
  belongs_to :province
  belongs_to :district
  belongs_to :township
  belongs_to :country
end

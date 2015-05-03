class Company < ActiveRecord::Base
  belongs_to :country
  belongs_to :company_type
  belongs_to :industry
  mount_uploader :logo, LogoUploader

  validates :name, :phones, :contact_name, presence: { message: 'Completa este campo' }
end

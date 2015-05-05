class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_one :profile
  has_many :companies
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { :with => VALID_EMAIL_REGEX , message: "Formato de email inválido" }
  validates :email, presence: { message: 'Introducir email' }
  validates :email, uniqueness: { message: 'Email ya registrado' }
  validates :password, presence: { message: 'Completa este campo' }
  validates :password, confirmation: { message: 'Contraseñas no coinciden' }

  accepts_nested_attributes_for :profile
  validates_associated :profile


  def user_profile
    Profile.where("user_id = ?", self.id).first
  end

  def is_admin?
    if self.role_id == 1 then true
    else
      false
    end
  end

  def is_candidate?
    if self.role_id == 2 then true
    else
      false
    end
  end

  def is_company?
    if self.role_id == 3 then true
    else
      false
    end
  end
end

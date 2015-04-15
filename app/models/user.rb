class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_one :profile
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { :with => VALID_EMAIL_REGEX , message: "Formato de email inválido" }
  validates :email, presence: { message: 'Introducir email' }
  validates :password, presence: { message: 'Completa este campo' }
  validates :password, confirmation: { message: 'Contraseñas no coinciden' }
end

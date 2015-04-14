class Profile < ActiveRecord::Base

  #Relaciones
  belongs_to :user
  belongs_to :sex
  belongs_to :marital_status
  belongs_to :province
  belongs_to :district
  belongs_to :township
  belongs_to :country
  has_many :experiences, -> { order "begin_date DESC" }
  has_many :studies, -> { order "begin_year DESC" }

  #Uploader
  mount_uploader :avatar, AvatarUploader

  # Nested Attributes
  accepts_nested_attributes_for :experiences, allow_destroy: true
  accepts_nested_attributes_for :studies, allow_destroy: true
  validates_associated :experiences
  validates_associated :studies

  #Validaciones
  acts_as_ordered_taggable_on :skills
  validates :surnames, :forenames, :email, :professional_title, :address, :birth_date, :presentation, presence: { message: 'Completa este campo' }
  validates :wage_aspiration, numericality: { message: 'Este campo debe ser un número' }

  #Funciones
  def age
    age = Date.today.year - self.birth_date.year
    age -= 1 if Date.today < self.birth_date + age.year
    age
  end

  def max_education
    Study.where("profile_id = ?", self.id).maximum(:education_level_id)
  end

end

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

  self.per_page = 16

  filterrific(
    available_filters: [
      :search_query,
      :with_education_level,
      :with_province_id,
      :with_district_id,
      :with_professional_area,
      :with_educative_area
      ]
    )

  scope :search_query, lambda { |query|
    return nil  if query.blank?
    query = query.gsub(/,/, ' ')
    terms = query.downcase.split(/\s+/)
    terms = terms.map { |e|
      '%' + (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    num_or_conds = 4
    where(
      terms.map { |term|
        %( id IN (SELECT profiles.id FROM profiles, taggings, tags
          WHERE taggings.taggable_id = profiles.id
          AND taggings.taggable_type = "Profile"
          AND tags.id = taggings.tag_id
          AND (LOWER(tags.name) LIKE ?
          OR LOWER(profiles.forenames) LIKE ?
          OR LOWER(profiles.surnames) LIKE ?
          OR LOWER(profiles.professional_title) LIKE ?)))
        }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
      )
    }

  scope :with_education_level, lambda { |education_level_id|
    where([
      %( id IN (select profile_id FROM studies
        WHERE studies.education_level_id >= ? )
      ), education_level_id
    ])
  }

  scope :with_province_id, lambda { |province_ids|
    where(:province_id => [*province_ids])
  }

  scope :with_district_id, lambda { |district_ids|
    where(:district_id => [*district_ids])
  }

  scope :with_professional_area, lambda { |professional_area_id|
    where([
      %( id IN (SELECT profile_id FROM experiences
      WHERE professional_area_id = ? )
      ), professional_area_id
    ])
  }

  scope :with_educative_area, lambda { |educative_area_id|
    where([
      %( id IN (SELECT profile_id FROM studies
      WHERE educative_area_id = ? )
      ), educative_area_id
    ])
  }

end

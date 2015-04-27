class Postulation < ActiveRecord::Base
  belongs_to :vacant
  belongs_to :profile
  validates :profile_id, uniqueness: { scope: :vacant_id }
  def candidates
    Postulation.where(vacant_id: self.vacant_id).count
  end
end

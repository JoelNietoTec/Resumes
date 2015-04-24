module VacantsHelper
  def postulated vacant, profile
    Postulation.where(:vacant_id => vacant, :profile_id => profile).first
  end
end

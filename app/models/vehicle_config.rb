class VehicleConfig < ApplicationRecord
  before_create :set_slug
  belongs_to :vehicle_make
  belongs_to :vehicle_model
  belongs_to :vehicle_trim
  belongs_to :vehicle_config_status
  
  private
  def set_slug
    loop do
      self.slug = SecureRandom.uuid
      break unless VehicleMake.where(slug: slug).exists?
    end
  end
end

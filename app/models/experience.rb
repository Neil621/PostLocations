class Experience < ApplicationRecord

  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  #validates :exp_type, presence: true

end

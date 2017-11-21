class CharacterAttribute < ApplicationRecord
  belongs_to :character
  mount_uploader :icon, PictureUploader

  validates :attribute_name, presence: true, uniqueness: { scope: :character_id }
  validates :attribute_value, numericality:  {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100}
  validates :icon, presence: true

end

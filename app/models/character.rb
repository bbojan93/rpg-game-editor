class Character < ApplicationRecord
  belongs_to :user
  has_many :character_attributes, dependent: :destroy
  mount_uploader :avatar, PictureUploader

  enum name: {
    "Mage" => 0,
    "Hunter" => 1,
    "Warrior" => 2,
    "Assassin" => 3,
    "Guardian" => 4
  }

  validates :name, inclusion: names.keys, presence: true, uniqueness: { scope: :user_id }
  validates :avatar, presence: true

end

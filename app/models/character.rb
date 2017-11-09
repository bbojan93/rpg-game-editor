class Character < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, PictureUploader

  enum name: {
    "Mage" => 0,
    "Hunter" => 1,
    "Warrior" => 2,
    "Assassin" => 3,
    "Guardian" => 4
  }

  validates :name, inclusion: names.keys, presence: true
  validates :avatar, presence: true
  
end

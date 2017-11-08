class Character < ApplicationRecord
  belongs_to :user
  enum name: {
    "Mage" => 0,
    "Hunter" => 1,
    "Warrior" => 2,
    "Assassin" => 3,
    "Guardian" => 4
  }

  validates :name, inclusion: names.keys
end

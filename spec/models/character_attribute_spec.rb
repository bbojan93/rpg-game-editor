require 'rails_helper'

RSpec.describe CharacterAttribute, type: :model do
  before do
    @user = FactoryGirl.create(:user)
    @character = FactoryGirl.create(:character, user_id: @user.id)
  end

  it "is valid with icon, attribute name and value" do
    character_attribute = FactoryGirl.build(:character_attribute, character_id: @character.id)
    expect(character_attribute).to be_valid
  end

  it "is invalid without icon" do
    character_attribute = FactoryGirl.build(:character_attribute, icon: nil, character_id: @character.id)
    character_attribute.valid?
    expect(character_attribute.errors[:icon]).to include("can't be blank")
  end

  it "is invalid without attribute name" do
    character_attribute = FactoryGirl.build(:character_attribute, attribute_name: nil, character_id: @character.id)
    character_attribute.valid?
    expect(character_attribute.errors[:attribute_name]).to include("can't be blank")
  end

  it "is invalid with duplicate attribute name with same character" do
    character_attribute = FactoryGirl.create(:character_attribute, character_id: @character.id)
    character_attribute1 = FactoryGirl.build(:character_attribute, character_id: @character.id)
    character_attribute1.valid?
    expect(character_attribute1.errors[:attribute_name]).to include("has already been taken")
  end

  it "is valid with duplicate attribute name between different characters" do
    character_attribute = FactoryGirl.create(:character_attribute, character_id: @character.id)
    character = FactoryGirl.create(:character, name: "Hunter", user_id: @user.id)
    character_attribute1 = FactoryGirl.build(:character_attribute, character_id: character.id)
    expect(character_attribute1).to be_valid
  end

  it "is invalid without attribute value" do
    character_attribute = FactoryGirl.build(:character_attribute, attribute_value: nil, character_id: @character.id)
    character_attribute.valid?
    expect(character_attribute.errors[:attribute_value]).to include("is not a number")
  end

  context "when given a value that is not within 1-100 range" do
    it "should return an error" do
      character_attribute = FactoryGirl.build(:character_attribute, attribute_value: 102, character_id: @character.id)
      character_attribute.valid?
      expect(character_attribute.errors[:attribute_value]).to include("must be less than or equal to 100")
    end
  end


end

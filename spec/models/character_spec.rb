require 'rails_helper'

RSpec.describe Character, type: :model do
  before do
    @user = FactoryGirl.create(:user)
    @user1 = FactoryGirl.create(:user)
  end

  it "is valid with name and avatar" do
    character = FactoryGirl.build(:character, user_id: @user.id)
    expect(character).to be_valid
  end

  it "is invalid without name" do
    character = FactoryGirl.build(:character, user_id: @user.id, name: nil)
    character.valid?
    expect(character.errors[:name]).to include("can't be blank")
  end

  it "is invalid without avatar" do
    character = FactoryGirl.build(:character, user_id: @user.id, avatar: nil)
    character.valid?
    expect(character.errors[:avatar]).to include("can't be blank")
  end

  it "is invalid with duplicate name" do
    character = FactoryGirl.create(:character, user_id: @user.id)
    character1 = FactoryGirl.build(:character, user_id: @user.id)
    character1.valid?
    expect(character1.errors[:name]).to include("has already been taken")
  end

  it "is valid with duplicate name between two users" do
    character = FactoryGirl.create(:character, user_id: @user.id)
    character1 = FactoryGirl.build(:character, user_id: @user1.id)
    expect(character1).to be_valid
  end

end

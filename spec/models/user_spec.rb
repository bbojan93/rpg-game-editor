require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with username, email and password" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end
  it "is invalid without username" do
    user = FactoryGirl.build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end
  it "is invalid without email" do
    user = FactoryGirl.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  it "is invalid without password" do
    user = FactoryGirl.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
  it "is invalid with duplicate username" do
    user1 = User.create(username: 'user1', email: 'email@example.com', password: 'password')
    user2 = FactoryGirl.build(:user, username: 'user1')
    user2.valid?
    expect(user2.errors[:username]).to include("has already been taken")
  end
  it "is invalid with duplicate email" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.build(:user, email: user1.email)
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end
  
end

FactoryGirl.define do
  factory :user do
    username {FFaker::Internet.user_name}
    email {FFaker::Internet.email}
    password {Devise.friendly_token.first(8)}
  end
end

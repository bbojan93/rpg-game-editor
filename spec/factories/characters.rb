FactoryGirl.define do
  factory :character do
    name "Mage"
    avatar Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/avatar.png')))
  end
end

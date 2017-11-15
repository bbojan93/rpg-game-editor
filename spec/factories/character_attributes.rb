FactoryGirl.define do
  factory :character_attribute do
    icon Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/icon.png')))
    attribute_name "Speed"
    attribute_value "70"
  end
end

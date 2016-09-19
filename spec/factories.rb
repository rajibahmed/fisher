FactoryGirl.define do
  factory :catch do
    email 'example@gmail.com'
    species 'fish1'
    weight 100
    length 30
    lang 3.333
    lat 4.3333
		fish_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'test.png')) }
  end
end

FactoryBot.define do
  factory :item_image do

    url {Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/icon-01.png"), 'image/png') }
    association :item

  end
end



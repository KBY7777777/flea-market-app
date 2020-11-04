FactoryBot.define do

  factory :address do
    destination_family_name              {"山田"}
    destination_first_name               {"太郎"}
    destination_family_name_furigana     {"ヤマダ"}
    destination_first_name_furigana      {"タロウ"}
    postal_code                          {"111-1111"}
    prefectures_area                     {"1"}
    municipality                         {"豊島区"}
    house_number                         {"三角町1-1-1"}
    building                             {"三角ビル"}
    tel                                  {"0000000000"}
  end
end

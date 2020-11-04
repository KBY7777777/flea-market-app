FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@email.com"}
    password              {"0000000"}
    encrypted_password    {"0000000"}
    family_name           {"山田"}
    first_name            {"太郎"}
    familyname_furigana   {"ヤマダ"}
    firstname_furigana    {"タロウ"}
    date                  {"2000-01-01"}
  end
end

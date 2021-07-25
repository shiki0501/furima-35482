FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    email                 { Faker::Internet.free_email }
    first_name_kanji      { Gimei::Name.first.kanji }
    last_name_kanji       { Gimei::Name.last.kanji }
    first_name_kana       { Gimei::Name.first.katakana }
    last_name_kana        { Gimei::Name.last.katakana }
    birthday              { Faker::Date.backward }
  end
end

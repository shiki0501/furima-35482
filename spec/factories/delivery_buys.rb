FactoryBot.define do
  factory :delivery_buy do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    shipping_area_id     { Faker::Number.between(from: 2, to: 3) }
    municipality { "福島市" }
    address { "福島町" }
    building_name { '1-1' }
    tell { "08044238841" }
  end
end

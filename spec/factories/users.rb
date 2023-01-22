FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'abcd1234' }
    password_confirmation { password }
    last_name { '市川' }
    first_name { 'ひでカズ' }
    last_name_kana { 'イチカワ' }
    first_name_kana { 'ヒデカズ' }
    birthday { Faker::Date.backward }
  end
end

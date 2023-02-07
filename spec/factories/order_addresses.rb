FactoryBot.define do
  factory :order_address do
    postal_code {'000-0000'}
    prefecture_id {1}
    city {'港区'}
    house_number {'青山１−１−１'}
    building_name {'ライオンズマンション111'}
    phone_number {'09011119999'}
  end
end

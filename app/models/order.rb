class Order < ApplicationRecord
  belongs_to :record

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id,      numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number
end
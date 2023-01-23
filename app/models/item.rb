class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :describe
    validates :category,        numericality: { other_than: 0, message: "can't be blank" }
    validates :condition,       numericality: { other_than: 0 }
    validates :delivery_charge, numericality: { other_than: 0 }
    validates :prefecture,      numericality: { other_than: 0 }
    validates :days_to_ship,    numericality: { other_than: 0 }
    validates :price,           numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }  300-9,999,999
  end
end

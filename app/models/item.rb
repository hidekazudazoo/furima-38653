class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :describe
    validates :category_id,        numericality: { other_than: 0, message: "can't be blank" }
    validates :condition_id,       numericality: { other_than: 0 }
    validates :delivery_charge_id, numericality: { other_than: 0 }
    validates :prefecture_id,      numericality: { other_than: 0 }
    validates :days_to_ship_id,    numericality: { other_than: 0 }
    validates :price,              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end

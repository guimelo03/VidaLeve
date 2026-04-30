class Meal < ApplicationRecord
  belongs_to :diet

  has_many :meal_items, dependent: :destroy

  accepts_nested_attributes_for :meal_items, allow_destroy: true

  validates :name, presence: true
end

class Skill < ApplicationRecord
  belongs_to :subcategory
  has_many :skill_levels
end

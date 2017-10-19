require 'csv'

namespace :import do

  desc "Import SFIA data from CSV"

  task categories: :environment do
    CATEGORY_NAME = 9
    SUBCATEGORY_NAME = 14
    SKILL_NAME = 19
    SKILL_CODE = 23
    SKILL_DESCRIPTION = 21
    SKILL_LEVEL = 26
    SKILL_LEVEL_DESCRIPTION = 28

    filename = File.join Rails.root, 'sfiaskills.6.3.en.csv'

    CSV.foreach(filename, {:headers => true}) do |row|
      process_row row
    end
  end

  def process_row row
    category    = import_category(row[CATEGORY_NAME])
    subcategory = import_subcategory(category, row[SUBCATEGORY_NAME])
    skill       = import_skill(subcategory, row[SKILL_NAME], row[SKILL_CODE], row[SKILL_DESCRIPTION])
    skill_level = import_skill_level(skill, row[SKILL_LEVEL], row[SKILL_LEVEL_DESCRIPTION])
  end

  def import_category name
    category = Category.where(name: name).first
    category ||= Category.create!(name: name)
  end

  def import_subcategory category, name
    subcategory = category.subcategories.where(name: name).first
    subcategory ||= category.subcategories.create!(name: name)
  end

  def import_skill subcategory, name, code, description
    skill = subcategory.skills.where(name: name).first
    skill ||= subcategory.skills.create!(name: name, code: code, description: description)
  end

  def import_skill_level skill, level, description
    skill_level = skill.skill_levels.where(level: level).first
    skill_level ||= skill.skill_levels.create!(level: level, description: description)
  end
end
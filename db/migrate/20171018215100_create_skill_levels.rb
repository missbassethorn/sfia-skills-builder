class CreateSkillLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_levels do |t|
      t.integer :level
      t.text :description
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end

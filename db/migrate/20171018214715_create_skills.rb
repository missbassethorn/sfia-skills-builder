class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :code
      t.text :description
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end

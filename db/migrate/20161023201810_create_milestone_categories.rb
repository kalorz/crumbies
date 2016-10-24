class CreateMilestoneCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :milestone_categories, id: :uuid do |t|
      t.string :caption
      t.text :description
      t.text :formatted_description
      t.string :color

      t.integer :position, default: 1, null: false

      t.timestamps
    end
  end
end

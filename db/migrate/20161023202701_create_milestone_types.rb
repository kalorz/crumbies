class CreateMilestoneTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :milestone_types, id: :uuid do |t|
      t.references :milestone_category, type: :uuid, foreign_key: { on_delete: :restrict }, null: false

      t.string :caption
      t.text :description
      t.text :formatted_description
      t.integer :minimum_months
      t.integer :maximum_months

      t.integer :position, default: 1, null: false

      t.timestamps
    end

    add_column :milestone_categories, :milestone_types_count, :integer, default: 0, null: false
  end
end

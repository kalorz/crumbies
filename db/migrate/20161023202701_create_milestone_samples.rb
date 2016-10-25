class CreateMilestoneSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :milestone_samples, id: :uuid do |t|
      t.uuid :category_id, null: false

      t.string :caption
      t.text :description
      t.text :formatted_description
      t.integer :minimum_months
      t.integer :maximum_months

      t.integer :position, default: 1, null: false

      t.timestamps
    end

    add_foreign_key :milestone_samples, :milestone_categories, column: :category_id, on_delete: :restrict

    add_column :milestone_categories, :samples_count, :integer, default: 0, null: false
  end
end

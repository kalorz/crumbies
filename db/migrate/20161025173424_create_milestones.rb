class CreateMilestones < ActiveRecord::Migration[5.0]
  def change
    create_table :milestones, id: :uuid do |t|
      t.uuid :category_id
      t.uuid :sample_id

      t.string :caption
      t.datetime :timestamp

      t.timestamps

      t.foreign_key :milestone_categories, column: :category_id, on_delete: :restrict
      t.foreign_key :milestone_samples, column: :sample_id, on_delete: :restrict
    end

    add_column :milestone_categories, :milestones_count, :integer, default: 0, null: false
    add_column :milestone_samples, :milestones_count, :integer, default: 0, null: false
  end
end

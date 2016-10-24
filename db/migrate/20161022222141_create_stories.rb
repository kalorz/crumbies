class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories, id: :uuid do |t|
      t.references :journal, type: :uuid, foreign_key: { on_delete: :restrict}, null: false

      t.string :caption
      t.datetime :timestamp

      t.timestamps
    end

    add_column :journals, :stories_count, :integer, default: 0, null: false
  end
end

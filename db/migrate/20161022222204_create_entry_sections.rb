class CreateEntrySections < ActiveRecord::Migration[5.0]
  def change
    create_table :entry_sections, id: :uuid do |t|
      t.references :entry, type: :uuid, foreign_key: {on_delete: :restrict}, null: false

      t.integer :position, default: 1, null: false

      t.timestamps
    end

    add_column :entries, :sections_count, :integer, default: 0, null: false
  end
end

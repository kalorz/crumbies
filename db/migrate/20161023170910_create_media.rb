class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media, id: :uuid do |t|
      t.references :media_component, type: :uuid, foreign_key: { on_delete: :restrict }, null: false

      t.string :caption
      t.string :file_id
      t.string :file_filename
      t.integer :file_size
      t.string :file_content_type
      t.string :file_url

      t.integer :position, default: 0, null: false

      t.timestamps
    end

    add_column :media_components, :media_count, :integer, default: 0, null: false
  end
end

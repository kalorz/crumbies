class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media, id: :uuid do |t|
      t.string :caption

      t.string :file_id
      t.string :file_filename
      t.integer :file_size
      t.string :file_content_type
      t.string :file_url

      t.timestamps
    end
  end
end

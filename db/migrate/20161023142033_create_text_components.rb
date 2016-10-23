class CreateTextComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :text_components, id: :uuid do |t|
      t.text :body
      t.text :formatted_body

      t.timestamps
    end
  end
end

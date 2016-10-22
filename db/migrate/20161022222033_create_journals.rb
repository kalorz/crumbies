class CreateJournals < ActiveRecord::Migration[5.0]
  def change
    create_table :journals, id: :uuid do |t|
      t.string :caption

      t.timestamps
    end
  end
end

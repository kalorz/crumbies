class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth

      t.timestamps
    end
  end
end

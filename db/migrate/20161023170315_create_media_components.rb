class CreateMediaComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :media_components, id: :uuid do |t|
      t.timestamps
    end
  end
end

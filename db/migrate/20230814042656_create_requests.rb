class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :title, null: false
      t.string :date, null: false
      t.text :description, null: false
      t.string :expected_length, null: false
      t.text :expected_place, null: false
      t.timestamps
    end
  end
end

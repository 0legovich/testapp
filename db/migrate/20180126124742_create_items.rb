class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name_item
      t.float :weight
      t.float :price
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.string :image, null: false
      t.integer :category, null: false
      t.integer :condition, null: false
      t.integer :price, null: false
      t.integer :shipping_fee, null: false
      t.integer :shipping_from, null: false
      t.integer :days_for_shipping, null: false
      t.timestamps
    end
  end
end

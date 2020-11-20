class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,           null: false,foreign_key:true
      t.string :item_name,          null: false
      t.text :item_text,            null: false
      t.references :category,       null: false,foreign_key:true
      t.string :brand
      t.integer :item_status,       null: false
      t.integer :delivery_charge,   null: false
      t.integer :delivery_area,     null: false
      t.integer :delivery_day,      null: false
      t.integer :price,             null: false   

      t.timestamps
    end
  end
end

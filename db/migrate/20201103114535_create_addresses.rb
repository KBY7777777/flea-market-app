class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :destination_family_name,           null: false
      t.string :destination_first_name,            null: false
      t.string :destination_family_name_furigana,  null: false
      t.string :destination_first_name_furigana,   null: false
      t.string :postal_code,                       null: false
      t.integer :prefectures_area,                 null: false
      t.string :municipality,                      null: false
      t.string :house_number,                      null: false
      t.string :building
      t.string :tel,                               unique: true
      t.timestamps
    end
  end
end

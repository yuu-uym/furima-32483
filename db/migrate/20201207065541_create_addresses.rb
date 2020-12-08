class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,         null: false
      t.integer :prefecture_id,      null: false
      t.string :city,                null: false
      t.string :address,             null: false
      t.string :building_name,       null: false
      t.string :phone_number,        null: false
      t.references :order,           null: false
      t.timestamps
    end
  end
end
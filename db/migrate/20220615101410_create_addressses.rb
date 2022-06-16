class CreateAddressses < ActiveRecord::Migration[6.0]
  def change
    create_table :addressses do |t|
      t.references :order,               null: false, foreign_key: true
      t.string     :post_code,           null: false
      t.integer    :shipping_charges_id, null: false
      t.string     :municipality,        null: false
      t.string     :house_number,        null: false
      t.string     :building_name
      t.string     :pohne,               null: false
      t.timestamps
    end 
  end
end

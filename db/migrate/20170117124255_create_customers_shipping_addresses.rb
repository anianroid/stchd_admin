class CreateCustomersShippingAddresses < ActiveRecord::Migration
  def change
    create_table :customers_shipping_addresses do |t|
      t.references :customer, 			null: false
      t.references :address, 			null: false
      t.boolean :primary,				null: false, default: false
      t.timestamps null: false
    end
  end
end

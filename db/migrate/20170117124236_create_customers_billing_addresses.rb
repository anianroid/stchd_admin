class CreateCustomersBillingAddresses < ActiveRecord::Migration
  def change
    create_table :customers_billing_addresses do |t|
      t.references :customer, 		null: false
      t.references :address, 		null: false
      t.timestamps null: false
    end
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Customer.all.count == 0
	350_000.times do |i|
	  Customer.create!(
	    first_name: Faker::Name.first_name,
	     last_name: Faker::Name.last_name,
	      username: "#{Faker::Internet.user_name}#{i}",
	         email: Faker::Internet.user_name + i.to_s +
	                "@#{Faker::Internet.domain_name}")
	end
end

#All 29 states in India

State.create!(name: 'Andhra Pradesh'			, code: 'AP')
State.create!(name: 'Arunachal Pradesh'			, code: 'AR')
State.create!(name: 'Assam'						, code: 'AS')
State.create!(name: 'Bihar'						, code: 'BR')
State.create!(name: 'Chhattisgarh'				, code: 'CG')
State.create!(name: 'Goa'						, code: 'GA')
State.create!(name: 'Gujarat'					, code: 'GJ')
State.create!(name: 'Haryana'					, code: 'HR')
State.create!(name: 'Himachal Pradesh'			, code: 'HP')
State.create!(name: 'Jammu and Kashmir'			, code: 'JK')
State.create!(name: 'Jharkhand'					, code: 'JH')
State.create!(name: 'Karnataka'					, code: 'KA')
State.create!(name: 'Kerala'					, code: 'KL')
State.create!(name: 'Madhya Pradesh'			, code: 'MP')
State.create!(name: 'Maharashtra'				, code: 'MH')
State.create!(name: 'Manipur'					, code: 'MN')
State.create!(name: 'Meghalaya'					, code: 'ML')
State.create!(name: 'Mizoram'					, code: 'MZ')
State.create!(name: 'Nagaland'					, code: 'NL')
State.create!(name: 'Odisha'					, code: 'OD')
State.create!(name: 'Punjab'					, code: 'PB')
State.create!(name: 'Rahasthan'					, code: 'RJ')
State.create!(name: 'Sikkim'					, code: 'SK')
State.create!(name: 'Tamil Nadu'				, code: 'TN')
State.create!(name: 'Telangala'					, code: 'TS')
State.create!(name: 'Tripura'					, code: 'TR')
State.create!(name: 'Uttar Pradesh'			    , code: 'UP')
State.create!(name: 'Uttarakhand'				, code: 'UK')
State.create!(name: 'West Bengal'				, code: 'WB')


#Helper method to create a billing address for a customer

def create_billing_address(customer_id, num_states)
	billing_state = State.all[rand(num_states)]
	billing_address = Address.create!(
		street: Faker::Address.street_address,
		city: Faker::Address.city,
		state: billing_state,
		zipcode: Faker::Address.zip
	)
	CustomersBillingAddress.create!(customer_id: customer_id, address: billing_address)
	
end

#Helper method to create a shipping address for a customer

def create_shipping_address(customer_id, num_states, is_primary)
	shipping_state = State.all[rand(num_states)]
	shipping_address = Address.create!(
		street: Faker::Address.street_address,
		city: Faker::Address.city,
		state: shipping_state,
		zipcode: Faker::Address.zip
	)
	CustomersShippingAddress.create!(customer_id: customer_id, address: shipping_address, primary: is_primary)
end


#Cache the number of states (No need to query each time)

num_states = State.all.count

#For all Customers

Customer.all.pluck(:id).each do |customer_id|

	#Create Billing address for them
	create_billing_address(customer_id, num_states)

	#Creating a random number of shipping addresses, making sure we create at least 1
	num_shipping_addresses = rand(4) + 1

	num_shipping_addresses.times do |i|
		#Create the shipping addresses, setting the first one we create as "primary"
		create_shipping_address(customer_id, num_states, i==0)
	end
end








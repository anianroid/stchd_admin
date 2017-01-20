require 'rails_helper'

feature "angular_test" do
	let(:email)		{"bob@stchd.in"}
	let(:password)	{"password123"}

	before do
		User.create!(email:email,
					 password: password,
					 password_confirmation: password)
	end

	scenario "Our Angular Test App is Working" do
		visit "/angular_test"

		#Log In
		fill_in		  "Email", with: "bob@stchd.in"
		fill_in		  "Password", with: "password123"
		click_button  "Log in"

		#Check that we go to the right page
		expect(page).to have_content("Name")

		#Test the page
		fill_in "name", with: "Bob"
		within "header h1" do
			expect(page).to have_content("Hello!, Bob")
		end
	end
end
# add_customer_steps.rb
# Contains steps that are used for add customer

# ----------------------------------------
# :section: create object for page
# ----------------------------------------

And(/^I click the "ADD CUSTOMER" button$/) do
	@current_page = $site.on("add customer")
	puts "#{@current_page.clickaddcustomer}"
end


And(/^I am redirected to the "ADD CUSTOMER" page$/) do
	puts "#{@current_page.addcustomerurl}"
end

Then(/^a "ADD CUSTOMER" main header is displayed$/) do
	puts "#{@current_page.addcustomerheader}"
end







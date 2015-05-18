# Document the responsibility of the class

require_relative 'base_page'

class AddCustomerPage < BasePage


	def clickaddcustomer
		if ($browser.a(:name => "addCustomer").present?)
			r1 = verifytrue(true, "Add customer link is displayed in home page [Customer Listing Page]")
			addcustlink = $browser.a(:name => "addCustomer")
			r2 = verifytrue(addcustlink.visible? , "Add customer link is enabled")
			r3 = verifytrue(((addcustlink.text) == "ADD CUSTOMER"), "Text 'Add Customer' is correct- #{addcustlink.text}")
			addcustlink.click
			r4 = verifytrue(true, "Add customer link is click- successful")
			@browser.div(:id => "edit-customer-view").wait_until_present
			r5 = verifytrue((@browser.div(:id => "edit-customer-view").present?),"Add Customer page is displayed")
			return (r1= r1, r2=r2, r3=r3, r4=r4, r5=r5)
		else
			expecttrue(false, "Add customer link not present")
		end
	end

	def addcustomerurl
		pageurl = @browser.url
		r1 = verifytrue((pageurl.include? "diagnostics.mynexia.com/customers/new"),"Add customer page URL - #{pageurl}")
		return (r1=r1)
	end

	def addcustomerheader
		
	end



end# AddcustomerPage
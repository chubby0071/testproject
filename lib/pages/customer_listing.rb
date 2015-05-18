# Document the responsibility of the class

require_relative 'base_page'

class CustomerListing < BasePage

  def click_logout
  	logout_button.wait_until_present
    logout_button.click
  end

  private

# ----------------------------------------
# :section: Locator Methods
# ----------------------------------------

  # [Element:] "LOGOUT"
  # [HTML:] <a href="#" name="logout">Logout</a>
  def logout_button # :doc:
    @browser.a(:name => "logout")
  end

end # Customer
#Basepage
# Document the responsibility of the class

require_relative '../site'


class BasePage < Site
  include RSpec::Matchers

  def initialize(browser)
    @browser = browser
    utilitiesbrowser(browser)
  end

  def method_missing(sym, *args, &block)
    @browser.send sym, *args, &block
  end


  def take_screenshot(filename)
    @browser.screenshot.save "html-report/#{filename}"
  end

# ----------------------------------------
# Methods: Verify Page Title
# ----------------------------------------
def title_verify(checkTitle)
  title = $browser.title
  p "Title of page -  #{title}"
  returnone = verifytrue(checkTitle == title, "Expected Title of page #{title}")
end


# ----------------------------------------
# :section: Wait Methods
# ----------------------------------------

private

# ----------------------------------------
# :section: Locator Methods
# ----------------------------------------

  # [Element:]
  # [HTML:]
  def back_arrow
    @browser.a(:id => "header-left-action")
  end

end #BasePage
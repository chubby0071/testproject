require_relative 'browser_container'
require_relative './pages/logfile'
require_relative './pages/Utilities' 
require_relative '../scripts/requires'
require 'yaml'

# Document the responsibility of the class

class Site < BrowserContainer
include Utilities


  PAGE_MAPPING = {
    "sign in" => "SignInPage" ,
    "add customer" => "AddCustomerPage"
  }

# ----------------------------------------
# :section: Page Object Methods
# ----------------------------------------

def current_page
  @current_page = BasePage.new(@browser)
end

def visit(page)

end

def on(page)
  @current_page = Object.const_get(PAGE_MAPPING[page.downcase]).new(@browser)
  $log.info "Object currentPage holds -" + @current_page.inspect
  verificationcount()
  return @current_page
end


# ----------------------------------------
# :section: Browser Methods
# ----------------------------------------

def open
  @browser.goto URL
end

def refresh
 @browser.refresh
end

def get_url
  @browser.url
end

def expectedtext(expectedtext, dynamictext)
  expect(expectedtext).to eq(dynamictext)
end

def expect_url(url)
  observed = @browser.url
  expect(observed).to eq(url)
end

def use_last_window
  browser.windows.last.use
end

def clear_local_storage
 @browser.execute_script("localStorage.clear()")
 @browser.cookies.clear
 refresh
end

# ----------------------------------------
# :section: Pop-up Methods
# ----------------------------------------

def pop_up_present?
  @browser.alert.present?
end

def pop_up_text
  @browser.alert.text
end

def pop_up_click_close
  sleep(1)
  if pop_up_present?
    puts "Pop-up present, text: #{pop_up_text}"
    @browser.alert.close
      # puts "Pop-up close"
    else
    end
  end

  def pop_up_click_ok
    sleep(1)
    if pop_up_present?
      puts "Pop-up present, text: #{pop_up_text}"
      @browser.alert.ok
      # puts "Pop-up ok"
    else
    end
  end

# ----------------------------------------
# :section: Wait Methods
# ----------------------------------------

def wait_for_modal_background
  modal_background.wait_while_present
end

def wait_for_spinner
  spinner.wait_while_present(35)
end

private

# ----------------------------------------
# :section: Locator Methods
# ----------------------------------------

  # [Element:] Modal Background - Greyed out layer
  # [HTML:] <div class="modal-background visible"></div>
  def modal_background # :doc:
    @browser.div(:class => "modal-background")
  end

  # [Element:] Spinner
  # [HTML:]
  def spinner
    @browser.div(:class => "spinner-background")
  end

end # Site
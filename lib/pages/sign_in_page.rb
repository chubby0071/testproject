# Document the responsibility of the class

require_relative 'base_page'

class SignInPage < BasePage

  def enter_username(username)
    username_field.when_present.set "#{username}"
    r1=  "User Name given is - #{username}"
    return r1
  end

  def enter_password(password)
    password_field.when_present.set "#{password}"
    r1 =  "Password given is - #{password}"
    return r1
  end

  def click_login
    login_button.click
  end

  def logininvalid_error(expected)
    observed = error_box.text
    r1= verifytrue(observed==expected, "Expecting invalid login message - #{observed}")
    return r1
  end

  def login(username, password)
    puts @browser.url
    if((@browser.url).include? ("login")) then
    # @browser.goto($url)
    enter_username(username)
    enter_password(password)
    click_login
    @browser.div(:class => "customers-container").wait_until_present
    return "Logged in Nexia Diagnostics- UserName: #{username}, Password: #{password}- Login Successful}"
  elsif ((@browser.url).include? (("customers")||("contact")|| ("employees"))) then
    showCustomerList = @browser.li(:id => "showCustomerList")
    customers = showCustomerList.a(:name => "customers")
    customers.click
    return "Logged in Nexia Diagnostics/Redirected to Add Customer Page"
  else
    @browser.goto($url)
    enter_username(username)
    enter_password(password)
    click_login
    @browser.div(:class => "customers-container").wait_until_present
    return "Logged in Nexia Diagnostics- UserName: #{username}, Password: #{password}- Login Successful}"

  end

end


def logintopimage
  @browser.div(:class => "logo").wait_until_present
  imagelogo = @browser.div(:class => "logo")
  returnone = verifytrue(imagelogo.present?, "Expecting logo image on sign in page")
  srcvalue = imagelogo.img()
  returntwo =  verifytrue(srcvalue.attribute_value("src") == "https://qa-diagnostics.mynexia.com/img/link_logo.png", "Expecting logo image SRC value - #{srcvalue.attribute_value("src")}")
  return (x= returnone, y= returntwo)
end

def formdetails
  title = @browser.div(:class => "title")
  r1 = verifytrue(title.text == "NEXIA™ DIAGNOSTICS", "Expecting form title - #{title.text}")

  username = @browser.div(:class => "user-name")
  r2 = verifytrue(username.text == "Username", "Expecting username text - #{username.text}")

  password = @browser.div(:class => "password")
  r3 = verifytrue(password.text == "Password", "Expecting Password text - #{password.text}")

  btn = @browser.button(:class => "submit")
  r4 = verifytrue(btn.text == "LOGIN", "Expecting button text - #{btn.text}")

  r5 = verifytrue(@browser.text_field(:name => "username").present?,"User Name text field is present")

  r6 = verifytrue(@browser.text_field(:name => "password").present?,"Password text field is present")

  r7 = verifytrue(@browser.button(:class => "submit").enabled?,"Login button is enabled")

  return (r1= r1, r2=r2, r3=r3, r4=r4, r5=r5, r6=r6, r7=r7)
end


def customerlistinghome
  sleep(5)
  urlvalue = @browser.url
  customertitle = @browser.title
  r1 = verifytrue((urlvalue.include? ("diagnostics.mynexia.com/customers")), "Expecting Customerlisting home URL - #{urlvalue}")
  r2 = verifytrue(customertitle == "Nexia™ Diagnostics", "Expecting Customerlisting home page title - #{customertitle}")
  return (r1= r1, r2=r2)
end


def logouttologin
  logoutbtn = $browser.a(:name => "logout")
  logoutbtn.click
  sleep(1)
  urlvalue = $browser.url
  logintitle = $browser.title

  puts "Eror - #{($browser.div(:class => "error-box error-box-modal").present?)}"
  if($browser.div(:class => "error-box error-box-modal").present?)
    errorbox = $browser.div(:class => "error-box error-box-modal")
    errorbox.button().click

  end

  r1 = verifytrue((urlvalue.include? ("diagnostics.mynexia.com/login")), "Expecting login home URL - #{urlvalue}")
  r2 = verifytrue(logintitle == "Nexia™ Diagnostics", "Expecting Login home page title - #{logintitle}")
  return (r1= r1, r2=r2)
end


private

# ----------------------------------------
# :section: Locator Methods
# ----------------------------------------

  # [Element:] "Username"
  # [HTML:] <label>Username
  #           <input name="username" autofocus="" type="text">
  #         </label>
  def username_field # :doc:
    @browser.text_field(:name => "username")
  end

  # [Element:] "Password"
  # [HTML:] <label>Password
  #           <input name="password" type="password">
  #         </label>
  def password_field # :doc:
    @browser.text_field(:name => "password")
  end

  # [Element:] "LOGIN"
  # [HTML:] <button class="submit">Login</button>
  def login_button # :doc:
    @browser.button(:class => "submit")
  end

  # [Element:] Validation
  # [HTML:] <div style="margin-top: -4px; display: inline-block;" class="error-box error-box-arrow-top">Invalid credentials</div>
  def error_box
    @browser.div(:class => "error-box error-box-arrow-top")
  end

end # Login
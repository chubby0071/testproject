# signin_steps.rb
# Contains steps that are used on the 'signin' page

# ----------------------------------------
# :section: Page validations
# ----------------------------------------
#signin.feature-step 8
Then(/^I am able to verify detail of element in 'sign in' Page$/) do
 #verify title of page- method invoked from Site/SignInPage/Basepage
 puts "#{ @current_page.title_verify("Nexia™ Diagnostics")} "
  #Verify top image and src of signin page- method inovked from Site/SignInPage
  puts "#{ @current_page.logintopimage  } "
#verify username password login button in page - method inovked from Site/SignInPage
puts "#{@current_page.formdetails}"

end

# ----------------------------------------
# :section: Input- login attempt
# ----------------------------------------

When(/^I enter the login username "(.*?)"$/) do |username|
  puts "#{@current_page.enter_username(username)}"
  
end

When(/^I enter the login password "(.*?)"$/) do |password|
  puts "#{@current_page.enter_password(password)}"
  
end

When(/^I click the 'Login' button$/) do
  @current_page.click_login
  sleep(3)
end

# ----------------------------------------
# :section: result capture/ output
# ----------------------------------------
Then(/^an error\-box is displayed: "(.*?)"$/) do |message|
  puts "#{@current_page.logininvalid_error(message)}"
end


Then(/^I am directed to the 'customer listing' page$/) do
  puts "#{@current_page.customerlistinghome}"
  sleep(1)
end

Then(/^I am logged out after 'Logout'$/) do
 puts "#{@current_page.logouttologin}"
 sleep(1)
end












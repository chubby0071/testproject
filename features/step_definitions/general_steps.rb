# general_steps.rb
# Contains steps that are used on the commom across page


# ----------------------------------------
# :section: create object for page
# ----------------------------------------

#signin.feature-step7
Given(/^I am on the '(.*?)' page$/) do |page|
  @current_page = $site.on(page)
end


Given(/^I am logged in$/) do
 	@current_page = $site.on('sign in')
	puts "#{@current_page.login("dso", "13ebusiness")}"
end







Given(/^execution terminated$/) do
  #steps %Q{
  puts "Execution of cucumber is terminated"
  puts "verificationcount -  #{verificationcount}"
  puts "verificationcountfailed - #{verificationcountfailed}"
#}
end


# ----------------------------------------
# :section: Input
# ----------------------------------------


# ----------------------------------------
# :section: Output
# ----------------------------------------


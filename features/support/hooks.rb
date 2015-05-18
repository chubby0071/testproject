# After do |scenario|
#     Dir::mkdir('html-report') if not File.directory?('html-report')
#     screenshot = "./html-report/#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
#     @browser.driver.save_screenshot(screenshot)
#     embed screenshot, 'image/png'
# end

# ------------------------------
# Scenario hooks
# ______________________________

# Before do |scenario|
# 	p "Enter 'Before' scenario hook"
# 	# Before hook runs before each scenario
# 	p "Exit 'Before' scenario hook"
# end

# Around do |scenario, block|
# 	# Around hook runs around each block
# 	p "Enter 'Around' scenario hook"
# 	block.call
# 	p "Exit 'Around' scenario hook"
# end

After('@logged_in') do |scenario|
	# p "Enter 'After' scenario hook"
	# After hook runs after each scenario
	#sleep(1)
	#@customer_listing_page = @site.customer_listing_page
   # @customer_listing_page.click_logout
  #  sleep(1)
	# p "Exit 'After' scenario hook"
end

# ------------------------------
# Tagged hooks
#   For OR tags, pass the tags in a single string comma separated:

#   Before('@test_a, @test_b') do
#     This will only run before scenarios tagged
#     with @test_a OR @test_b.
#   end

#   For AND tags, pass the tags as separate tag strings:

#   Before('@test_a', '~@test_b') do
#     This will only run before scenarios tagged
#     with @test_a AND NOT @test_b.
#   end
# ______________________________

Before('~@signed_in') do |scenario|
	# p "Enter 'Before' '@elements' tagged hook"
	# Before hook runs before each scenario
    # @site.clear_local_storage
	# p "Exit 'Before' '@elements' tagged hook"
end

# Around('@test_a') do |scenario, block|
# 	# Around hook runs around each block
# 	p "Enter 'Around' tagged hook"
# 	block.call
# 	p "Exit 'Around' tagged hook"
# end

# After('@close_tab') do |scenario|
# 	# p "Enter 'After' '@close_tab' tagged hook"
#     @browser.windows.last.close
#     # p "Exit 'After' '@close_tab' tagged hook"
# end
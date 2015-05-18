require_relative '../../scripts/requires'

# URL = "https://qa.mynexia.com/software/mobile_web/index#"

environment = Environment.new(:qa)
account = Account.new(:qa)
Loggingclass.new("./log/logfile.log")
browser = Watir::Browser.new :chrome
browser.driver.manage.timeouts.implicit_wait = 30
browser.goto($url)

#rescue if the page is loading after a long time or page not found error
begin
	starttime = Time.new
	until (browser.div(:class => 'title').exist?)
		endtime = Time.new
		if((endtime - starttime) < 120)
			$log.info "Time wait for URL page to load [" + $url  + "]  #{(endtime - starttime)}"
		else
			puts "in screenshot"
			browser.close
			raise "Page load not completed/ Check Internet connection/ Retry"
			break
		end

	end
end

#	
#browser.window.resize_to(600, 600)
#browser.window.move_to(100, 10)
sleep(1)
$site = Site.new(browser)

# Global Hooks
Before do
  # p "Enter 'Before' hook"
 # @site = Site.new(browser)
  # p "Exit 'Before' hook"
end

at_exit do
  # p "Enter 'at_exit' hook"
  @site = Site.new(browser)
  browser.close
    steps %Q{
      Given execution terminated
    }
  # p "Exit 'at_exit' hook"
end
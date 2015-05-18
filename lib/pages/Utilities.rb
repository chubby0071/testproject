
require_relative '../site'
require_relative '../../scripts/requires'

module Utilities 

	include RSpec::Matchers


	$verificationcount = 0
	$verificationcountfailed = 0
	$browser

	def initialize(browser)
		@browser = browser
	end

	def verificationcount
		$verificationcount = $verificationcount +1
	end

	def verificationcountfailed
		$verificationcountfailed = $verificationcountfailed +1
	end

	def utilitiesbrowser(browserobject)
		$browser = browserobject
	end


	def verifytrue(condition, message)
		if(condition)
			verificationcount()
			return "Verified:#{message}"
		else
			verificationcountfailed()
			return "******** Failed:#{message}"
		end
	end

	def expecttrue(observed, expected, message)
		if(observed == expected)
			verificationcount()
			expect(observed).to eq(expected)
			return "Verified:#{message}"
		else
			verificationcountfailed()
			expect(observed).to eq(expected)
			return "******** Failed:#{message}"
		end
	end


	def we(parent, tag, field, value)
		fld = ":" << field

		if tag == "div" then
			webelement = parent.div(fld =>  value)
		elsif tag == "a" then
			webelement = parent.a(fld =>  value)
		elsif tag == "span" then
			webelement = parent.span(fld =>  value)
		elsif tag == "li" then
			webelement = parent.li(fld =>  value)
		elsif tag == "ui" then
			webelement = parent.ui(fld =>  value)
		elsif tag == "img" then
			webelement = parent.img(fld =>  value)
		else
			webelement = nil						

		end
		return webelement
	end

	def we_wait(parent, tag, field, value)
		fld = ":" << field

		if tag == "div" then
			webelement = parent.div(fld =>  value)
		elsif tag == "a" then
			webelement = parent.a(fld =>  value)
		elsif tag == "span" then
			webelement = parent.span(fld =>  value)
		elsif tag == "li" then
			webelement = parent.li(fld =>  value)
		elsif tag == "ui" then
			webelement = parent.ui(fld =>  value)
		elsif tag == "img" then
			webelement = parent.img(fld =>  value)
		else
			webelement = nil						
		end
		puts  webelement
		webelement.wait_until_present
	end




end #Utilities


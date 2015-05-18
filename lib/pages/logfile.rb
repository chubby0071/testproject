#!/usr/bin/env ruby
require 'logger'


class Loggingclass


def initialize(locationpath)
		FileUtils.rm(locationpath)
		$log = Logger.new(locationpath)
		$log.level = Logger::INFO
		$log.level = Logger::DEBUG
		#$log.level = Logger::WARN
		#$log.level = Logger::UNKNOWN
		#$log.level = Logger::ERROR
		#$log.level = Logger::FATAL
		
		$log.info("starting")

		puts "logfile created"

end

end #end of Loggingclass
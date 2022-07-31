#!/usr/bin/env ruby

Dir["./lib/**/*.rb"].each { |file| require file }
# require './lib/log_parser/page_stats.rb'

file_path = ARGV.first
LogParser::UrlStats.run(file_path:)

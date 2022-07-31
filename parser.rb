#!/usr/bin/env ruby

Dir["./lib/**/*.rb"].each { |file| require file }

file_path = ARGV.first
LogParser::UrlStats.run(file_path:)

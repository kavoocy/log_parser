# frozen_string_literal: true

require "logger"
require "awesome_print"

module LogParser
  class UrlStats
    # Required options:
    # * log_list - An array containing the list of log entries
    # log_list is in the form of ['URL IP', 'URL IP', 'URL IP', 'URL IP', ...]
    class << self
      def run(file_path:)
        new(file_path:).run
      end
    end

    def initialize(file_path:)
      @file_path = file_path
      init_logger
    end

    def run
      @log_list = parse_file(file_path:)
      return if log_list.blank?

      print_results
    rescue StandardError => e
      logger.error "An error occurred and the execution halted - error: #{e.class} and message: #{e.message}"
      nil
    end

    private

    def print_results
      result = {
        "Page Views" => process_page_views_stats(uniq_urls: false),
        "Unique Page Views" => process_page_views_stats(uniq_urls: true)
      }

      ap result
    end

    # parses the file and return the file contents splitted into array items
    def parse_file(file_path:)
      file_content = File.read(file_path)
      return logger.warn("File is empty") && nil if file_content.blank?

      file_content.split("\n").map(&:strip)
    end

    # Required param: :uniq_urls
    # :uniq_urls deteremines whether the output should include "any sort" of page urls OR
    # it should consolidate "similar" page urls
    def process_page_views_stats(uniq_urls:)
      # finds the proper parser
      parser = LogParser::StatsParserBuilder.build(uniq_urls:, log_list:)
      parser.parse
    end

    def init_logger
      @logger = Logger.new($stdout)
    end

    attr_reader :log_list, :file_path, :logger
  end
end

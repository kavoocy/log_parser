# frozen_string_literal: true

module LogParser
  module ParseHelpers
    class BaseStatsParser
      IP_PATTERN = /\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b/
      NOT_IMPLEMENTED = "Not Implemented"

      def initialize(log_list:)
        # On initialization, extract the page urls and group them
        # so to make them ready for sorting and uniqueness extraction
        prepare_groupped_page_urls(log_list:)
      end

      def parse
        raise AbstractMethodError, NOT_IMPLEMENTED
      end

      protected

      # Required param:
      # * hash_list - An array containing a list of hashes - each hash value holds a number on which we can sort
      # Example of a hash_list:
      #   [{ '/url_1' => 3 },{ '/url_2' => 5 },{ '/url_2/1' => 4 },{ '/url_3' => 2 }]
      def sort_by_value(hash_list:)
        hash_list.sort_by { |_k, v| v }.reverse.to_h
      end

      attr_reader :groupped_page_urls

      private

      def prepare_groupped_page_urls(log_list:)
        # log_list gets splitted by ' ' and then the first item will represent the page URL
        page_urls = log_list
          &.map(&:split)
          &.reject(&method(:invalid_rows))
          &.map(&:first)
  
        # after extraction, group them
        @groupped_page_urls = group_and_aggregate_unique_visits(page_urls:)
      end

      # array: each item in the array has two members: page url and ip address
      def invalid_rows(array=[])
        return true if array.any?(&:blank?)
        return true if array.length != 2
        return true unless array.first.starts_with?("/")
        return true if IP_PATTERN.match(array.second).nil?

        false
      end

      # Groups unique page urls and sum their occurrences in the list.
      # Note that no sorting is happening in this phase
      def group_and_aggregate_unique_visits(page_urls:)
        return {} if page_urls.blank?

        page_urls.each_with_object({}) do |url, hash|
          hash[url] ||= 0
          hash[url] += 1
        end
      end
    end
  end
end

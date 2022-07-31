# frozen_string_literal: true

module LogParser
  module ParseHelpers
    class StatsParser < BaseStatsParser
      def parse
        # call the base class to sort
        # before sorting, it should consolidate similar page urls
        sort_by_value(hash_array: consolidated_page_urls)
      end

      private

      # Consolidates items with similar page url names and aggregates number of their page visits
      # For instance, {'/about' => 2} and {'/about/2' => 8} will be merged and converted to {'/about' => 10}
      def consolidated_page_urls
        groupped_page_urls.each_with_object({}) do |(page_url, visit_numbers), hash|
          page_url = "/#{page_url.split('/').second}"

          hash[page_url] ||= 0
          hash[page_url] += visit_numbers
        end
      end
    end
  end
end

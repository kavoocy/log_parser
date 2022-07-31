module LogParser
  module ParseHelpers
    class UniqStatsParser < BaseStatsParser
      def parse
        # call base class to sort
        # uses groupped_page_urls which is already initiated and set up in the base class
        sort_by_value(hash_list: groupped_page_urls)
      end
    end
  end
end

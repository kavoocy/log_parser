# Uses Builder pattern to find the right class to construct
module LogParser
  class StatsParserBuilder
    class << self
      def build(uniq_urls:, log_list:)
        new(uniq_urls:, log_list:).build
      end
    end

    def initialize(uniq_urls:, log_list:)
      @uniq_urls = uniq_urls
      @log_list = log_list
    end

    def build
      case uniq_urls
      when true then LogParser::ParseHelpers::UniqStatsParser.new(log_list:)
      else LogParser::ParseHelpers::StatsParser.new(log_list:)
      end
    end

    private

    attr_reader :log_list, :uniq_urls
  end
end

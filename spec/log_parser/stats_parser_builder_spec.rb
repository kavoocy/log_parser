# frozen_string_literal: true

require "spec_helper"
describe LogParser::StatsParserBuilder do
  describe ".build" do
    let(:subject) { LogParser::StatsParserBuilder }

    context "uniq_urls flag is true" do
      let(:uniq_urls) { true }
      let(:log_list)  { [] }

      it "builds UniqStatsParser class" do
        expect(subject.build(uniq_urls:, log_list:)).to be_an_instance_of(LogParser::ParseHelpers::UniqStatsParser)
      end
    end

    context "uniq_urls flag is false" do
      let(:uniq_urls) { false }
      let(:log_list)  { [] }

      it "builds StatsParser class" do
        expect(subject.build(uniq_urls:, log_list:)).to be_an_instance_of(LogParser::ParseHelpers::StatsParser)
      end
    end
  end
end

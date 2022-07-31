# frozen_string_literal: true

require "spec_helper"
describe LogParser::ParseHelpers::BaseStatsParser do
  describe "#parse" do
    let(:subject) { LogParser::ParseHelpers::BaseStatsParser.new(log_list: nil) }

    context "throws AbstractMethodError error" do
      it do
        expect { subject.parse }.to raise_error(AbstractMethodError, LogParser::ParseHelpers::BaseStatsParser::NOT_IMPLEMENTED)
      end
    end
  end

  describe "#sort_by_value" do
    let(:subject) { LogParser::ParseHelpers::BaseStatsParser.new(log_list: nil) }

    context "sorts the given hash array" do
      let(:hash_list) { hash_list_given }
      let(:expected_array) { hash_list_expected }

      it "properly sorts" do
        expect(subject.send(:sort_by_value, hash_list:)).to eq(expected_array)
      end
    end

  end

  describe "#prepare_groupped_page_urls" do
    context "when the log_list contains correct data" do
      let(:log_list)          { correct_log_list_given }
      let(:log_list_expected) { correct_log_list_expected }
      let(:subject)           { LogParser::ParseHelpers::BaseStatsParser.new(log_list:) }
  
      it "properly sorts - no row is omitted" do
        expect(subject.send(:prepare_groupped_page_urls, log_list:)).to eq(log_list_expected)
      end
    end

    context "when the log_list contains correct bad data" do
      let(:log_list)          { log_list_with_bad_rows_given }
      let(:log_list_expected) { omitted_log_list_expected }
      let(:subject)           { LogParser::ParseHelpers::BaseStatsParser.new(log_list:) }
  
      it "properly sorts - some rows are omitted" do
        expect(subject.send(:prepare_groupped_page_urls, log_list:)).to eq(log_list_expected)
      end
    end

  end
end

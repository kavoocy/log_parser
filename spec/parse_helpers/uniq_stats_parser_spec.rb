# frozen_string_literal: true

require "spec_helper"
describe LogParser::ParseHelpers::UniqStatsParser do
  describe "#parse" do
    let(:subject)   { LogParser::ParseHelpers::UniqStatsParser.new(log_list:) }

    context "parses and sorts the given log list" do
      let(:log_list)  { correct_log_list_given }
      it do
        expect(subject.parse).to eq(correct_log_list_expected)
      end
    end

    context "parses, omits bad data and sorts the given log list" do
      let(:log_list)  { log_list_with_bad_rows_given }
      it do
        expect(subject.parse).to eq(omitted_log_list_expected)
      end
    end
  end
end

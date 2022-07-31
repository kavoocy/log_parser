# frozen_string_literal: true

require "spec_helper"
describe LogParser::ParseHelpers::StatsParser do
  describe "#parse" do
    let(:subject)   { LogParser::ParseHelpers::StatsParser.new(log_list:) }

    context "consolidates and sorts the given log list" do
      let(:log_list)  { correct_log_list_given_non_unique }
      it do
        expect(subject.parse).to eq(correct_log_list_expected_non_unique)
      end
    end

    context "consolidates, omits bad rows and sorts the given log list" do
      let(:log_list)  { log_list_with_bad_rows_given_non_unique }
      it do
        expect(subject.parse).to eq(correct_log_list_with_omitted_expected_non_unique)
      end
    end
  end
end

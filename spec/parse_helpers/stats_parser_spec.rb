# frozen_string_literal: true

require 'spec_helper'
describe LogParser::ParseHelpers::StatsParser do

  describe '#parse' do
    let(:subject)   { LogParser::ParseHelpers::StatsParser.new(log_list:) }

    context 'consolidates and sorts the given log list' do
      let(:log_list)  { correct_log_list_given }
      it do
        expect(subject.parse).to eq(correct_log_list_expected)
      end
    end

    context 'consolidates, omits bad rows and sorts the given log list' do
      let(:log_list)  { log_list_with_bad_rows_given }
      it do
        expect(subject.parse).to eq(correct_log_list_with_omitted_expected)
      end
    end

    def correct_log_list_given
      [
        "/about/2 543.910.244.929",
        "/help_page/1 200.017.277.774",
        "/home 126.318.035.038",
        "/about/2 184.123.665.067",
        "/home/1 451.106.204.921",
        "/home 200.817.217.774",
        "/help_page 300.027.279.774",
        "/home/2 200.017.277.774",
        "/about/2 200.117.237.774",
        "/about 543.910.244.929"
      ]
    end

    def log_list_with_bad_rows_given
      [
        "about/2 543.910.244.929",
        "/help_page/1 XYZ.017.277.774",
        "/home 126.318.035.038",
        "/about/2 184.123.665.067",
        "/home/1451.106.204.921",
        "/home 200.817.217.774",
        "/help_page 300.027.279.774",
        "/home/2 200.017.277.774",
        "/about/2 200.117.237.774",
        "/about 543.910.244.929"
      ]
    end

    def correct_log_list_expected
      {
        "/about" => 4,
        "/home" => 4,
        "/help_page" => 2
      }
    end

    def correct_log_list_with_omitted_expected
      {
        "/about" => 3,
        "/home" => 3,
        "/help_page" => 1
      }
    end
  end
end

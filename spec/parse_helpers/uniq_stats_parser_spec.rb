# frozen_string_literal: true

require 'spec_helper'
describe LogParser::ParseHelpers::UniqStatsParser do

  describe '#parse' do
    let(:subject)   { LogParser::ParseHelpers::UniqStatsParser.new(log_list:) }

    context 'parses and sorts the given log list' do
      let(:log_list)  { correct_log_list_given }
      it do
        expect(subject.parse).to eq(correct_log_list_expected)
      end
    end

    context 'parses, omits bad data and sorts the given log list' do
      let(:log_list)  { log_list_with_bad_rows_given }
      it do
        expect(subject.parse).to eq(omitted_log_list_expected)
      end
    end

    def correct_log_list_given
      [
        "/about/2 543.910.244.929",
        "/help_page/1 200.017.277.774",
        "/home 126.318.035.038",
        "/about/2 184.123.665.067",
        "/home 451.106.204.921",
        "/home 200.017.277.774",
        "/about/2 200.017.277.774",
        "/about 543.910.244.929"
      ]
    end
    
    def correct_log_list_expected
      {
        "/about/2" => 3,
        "/home" => 3,
        "/help_page/1" => 1,
        "/about" => 1
      }
    end

    def log_list_with_bad_rows_given
      [
        "/about/2543.910.244.929",
        "/help_page/1 200.017.277.774",
        "/home BAD_IP",
        "/about/2 184.123.665.067",
        "home// 451.106.204.921",
        "/home 200.017.277.774",
        "/about/2 200.017.277.774",
        "/home/6 200.017.277.774"
      ]
    end

    def omitted_log_list_expected
      {
        "/about/2" => 2,
        "/help_page/1" => 1,
        "/home" => 1,
        "/home/6" => 1
      }
    end
  end
end

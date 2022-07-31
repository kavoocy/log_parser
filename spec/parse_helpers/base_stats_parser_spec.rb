# frozen_string_literal: true

require 'spec_helper'
describe LogParser::ParseHelpers::BaseStatsParser do

  describe '#parse' do
    let(:subject) { LogParser::ParseHelpers::BaseStatsParser.new(log_list: nil) }

    context 'throws AbstractMethodError error' do
      it do
        expect { subject.parse }.to raise_error(AbstractMethodError, LogParser::ParseHelpers::BaseStatsParser::NOT_IMPLEMENTED)
      end
    end
  end

  describe '#sort_by_value' do
    let(:subject) { LogParser::ParseHelpers::BaseStatsParser.new(log_list: nil) }

    context 'sorts the given hash array' do
      let(:hash_list) { hash_list_given }
      let(:expected_array) { hash_list_expected }

      it 'properly sorts' do
        expect(subject.send(:sort_by_value, hash_list:)).to eq(expected_array)
      end
    end

    def hash_list_given
      {
        '/url_2/1' => 4,
        '/url_3' => 2,
        '/url_2' => 5,
        '/url_1' => 3
      }
    end
    def hash_list_expected
      {
        '/url_3' => 2,
        '/url_1' => 3,
        '/url_2/1' => 4,
        '/url_2' => 5
      }
    end
  end

  describe '#prepare_groupped_page_urls' do
    context 'when the log_list contains correct data' do
      let(:log_list)          { correct_log_list_given }
      let(:log_list_expected) { correct_log_list_expected }
      let(:subject)           { LogParser::ParseHelpers::BaseStatsParser.new(log_list:) }
  
      it 'properly sorts - no row is omitted' do
        expect(subject.send(:prepare_groupped_page_urls, log_list:)).to eq(log_list_expected)
      end
    end

    context 'when the log_list contains correct bad data' do
      let(:log_list)          { log_list_with_bad_rows_given }
      let(:log_list_expected) { omitted_log_list_expected }
      let(:subject)           { LogParser::ParseHelpers::BaseStatsParser.new(log_list:) }
  
      it 'properly sorts - some rows are omitted' do
        expect(subject.send(:prepare_groupped_page_urls, log_list:)).to eq(log_list_expected)
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
        "/help_page/1" => 1,
        "/home" => 3,
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
        "/about/2 200.017.277.774"
      ]
    end

    def omitted_log_list_expected
      {
        "/about/2" => 2,
        "/help_page/1" => 1,
        "/home" => 1
      }
    end
  end
end

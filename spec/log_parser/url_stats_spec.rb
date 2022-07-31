# frozen_string_literal: true

require 'spec_helper'
describe LogParser::UrlStats do

  describe '.run' do
    let(:subject) { LogParser::UrlStats }

    context 'with wrong path' do
      let(:file_path) { 'bad/path' }

      it 'throws error message and returns nil' do
        expect(subject.run(file_path:)).to eq(nil)
        expect { subject.run(file_path:) }.to output(/ERROR -- : An error occurred and the execution halted - error: Errno::ENOENT and message: No such file or directory @ rb_sysopen - bad\/path/).to_stdout
      end
    end

    context 'with correct path' do
      context 'when the file is empty' do
        let(:file_path) { 'spec/fixtures/webserver_empty.log' }
  
        it 'throws warning message and returns nil' do
          expect(subject.run(file_path:)).to eq(nil)
          expect { subject.run(file_path:) }.to output(/WARN -- : File is empty/).to_stdout
        end
      end

      context 'when the file has correct data' do
        let(:file_path) { 'spec/fixtures/webserver.log' }
  
        it 'prints results' do
          expect { subject.run(file_path:) }.to output(/\"Page Views\"/).to_stdout
        end
      end

      context 'when the file has bad data' do
        context 'bad format in page urls' do
          let(:file_path) { 'spec/fixtures/webserver_wrong_urls.log' }

          it 'ignores bad data' do
            expect { subject.run(file_path:) }.to output(/\"Page Views\"/).to_stdout
          end
        end
      end
    end
  end
end

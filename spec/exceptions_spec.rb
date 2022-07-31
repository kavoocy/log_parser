# frozen_string_literal: true

require 'spec_helper'
describe AbstractMethodError do
  CALLEE_STUB_STR = "this method"
  MUST_IMPLEMENT = "You must implement %<callee>s in child class."

  describe '#initialize' do
    context 'when initialized with no message' do
      let(:error) { AbstractMethodError.new }
      
      before do
        allow_any_instance_of(AbstractMethodError).to receive(:__callee__).and_return CALLEE_STUB_STR
      end

      it 'applies the default message' do
        msg = MUST_IMPLEMENT % {callee: CALLEE_STUB_STR}
        expect(error.message).to eq(msg)
      end
    end
  end
end

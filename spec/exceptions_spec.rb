# frozen_string_literal: true

require "spec_helper"
describe AbstractMethodError do
  describe "#initialize" do
    context "when initialized with no message" do
      let(:error) { AbstractMethodError.new }
      
      before do
        allow_any_instance_of(AbstractMethodError).to receive(:__callee__).and_return "this method"
      end

      it "applies the default message" do
        msg = format("You must implement %<callee>s in child class." , callee: "this method")
        expect(error.message).to eq(msg)
      end
    end
  end
end

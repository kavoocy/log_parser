# frozen_string_literal: true

require "spec_helper"
describe Object do
  describe "#blank?" do
    context "returns false as a regular string is supplied" do
      let(:subject) { "test" }
      it do
        expect(subject.blank?).to be_falsey
      end
    end

    context "returns true when nil is supplied" do
      it do
        expect(nil.blank?).to be_truthy
        expect([].blank?).to be_truthy
        expect("".blank?).to be_truthy
      end
    end
  end
end

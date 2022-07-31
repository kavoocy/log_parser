# frozen_string_literal: true

require "spec_helper"
describe Array do
  describe "#second" do
    context "returns nil as there are no memebers in array" do
      let(:subject) { Array.new(0) }
      it do
        expect(subject.second).to be_nil
      end
    end
    context "return the value of 1" do
      let(:subject) { Array.new(4, &:to_s) }
      it do
        expect(subject.second).to eq("1")
      end
    end
  end
end

require "spec_helper"

describe Microbat do
  describe "::VERSION" do
    subject { described_class::VERSION }

    it { should be_a(String) }
  end

  describe "::PORT" do
    subject { described_class::PORT }

    it { should be_an(Integer) }
  end
end

require "spec_helper"

module Microbat
  describe Server do
    describe "::run" do
      context "default port" do
        let(:uri) { URI.parse("http://localhost:#{Microbat::PORT}") }

        use_vcr_cassette("default_port")

        it "starts the server" do
          puts Net::HTTP.new(uri.host, uri.port).inspect
        end
      end
    end

    describe "::response" do
      subject { described_class::response.call }

      its([0]) { should == 200 }
      its([1]) { should include(
        "Content-Type" => "text/plain",
        "Access-Control-Allow-Origin" => "*"
      )}
      its([2]) { should be_an(Array) }
    end
  end
end

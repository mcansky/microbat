require "rubygems"
require "bundler/setup"

require "microbat"
require "net/http"
require "uri"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "spec/vcr_cassettes"
  c.hook_into :webmock
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end

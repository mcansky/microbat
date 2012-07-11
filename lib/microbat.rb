require "microbat/version"
require "microbat/server"

module Microbat
  PORT = 8989

  def self.root
    File.expand_path("../..", __FILE__)
  end
end

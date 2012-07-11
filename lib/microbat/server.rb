require "rack"
require "rack/handler/puma"

module Microbat
  class Server
    def self.run(options = {})
      options = {
        :port => Microbat::PORT
      }.merge(options)

      Rack::Handler::Puma.run(
        server,
        :Port => options[:port]
      )
    end

    def self.server
      proc {|env| [
        200,
        { "Content-Type" => "text/plain",
          "Access-Control-Allow-Origin" => "*"
        },
        ["^v^"]
      ] }
    end
  end
end

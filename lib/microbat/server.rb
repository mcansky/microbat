require "rack"
require "rack/handler/puma"

module Microbat
  class Server
    def self.run(options = {})
      options = {
        :port => Microbat::PORT
      }.merge(options)

      Rack::Handler::Puma.run(
        response,
        :Port => options[:port]
      )
    end

    def self.response
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

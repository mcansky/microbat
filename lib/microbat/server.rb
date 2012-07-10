require "rack"

module Microbat
  class Server
    def call(env)
      [200, headers, ["^v^"]]
    end

    private
      def headers
        {"Content-Type" => "text/plain", "Access-Control-Allow-Origin" => "*"}
      end
  end
end

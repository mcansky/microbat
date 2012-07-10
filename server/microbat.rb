require "rubygems"
require "rack"

run proc do |env|
  [
    200,
    {
      "Content-Type"                => "text/plain",
      "Access-Control-Allow-Origin" => "*"
    },
    ["^v^"]
  ]
end

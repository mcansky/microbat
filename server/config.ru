require "rubygems"
require "rack"

run proc {|env|
  [200, { "Content-Type" => "text/plain" }, ["PONG"]]
}

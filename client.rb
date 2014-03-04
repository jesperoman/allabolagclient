#!/usr/local/bin/ruby
require "./api_connector"

query = ARGV.join ' '
parsed = ApiConnector.new.search(query)
if parsed["error"]
  puts parsed["error"]
else
  puts parsed["name"] + ": " + parsed["orgnr"]
end

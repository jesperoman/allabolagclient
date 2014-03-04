#!/usr/local/bin/ruby
require 'json'
require 'net/http'
require 'uri'

query = ARGV.join ' '
url = 'http://localhost:3000/search/index.json'
params = { :query => query }
uri = URI(url)
uri.query = URI.encode_www_form(params)
res = Net::HTTP.get_response(uri)
if res.is_a?(Net::HTTPSuccess)
  parsed = JSON.parse(res.body)
  puts parsed["orgnr"]
end

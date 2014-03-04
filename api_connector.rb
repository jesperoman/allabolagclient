require 'json'
require 'net/http'
require 'uri'

class ApiConnector
  def search(query)
    params = { :query => query }
    url = 'http://localhost:3000/search/index.json'
    uri = URI(url)
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    parseResult(res)
  end

  def parseResult(result)
    if result.is_a?(Net::HTTPSuccess)
      parsed = JSON.parse(result.body)
    end
  end
end

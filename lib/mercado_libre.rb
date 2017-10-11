require 'net/http'
require 'uri'
require 'json'

ML_URL = 'https://api.mercadolibre.com'

class MercadoLibre
    def item id
        uri = URI.parse(ML_URL + "/items/#{id}")
        Rails.logger.debug "Requesting URL #{uri}"
        response = Net::HTTP.get_response(uri)
        Rails.logger.debug "Got status code: #{response.code}"
        if response.code == '200'
            return JSON.parse(response.body)
        else
            raise RuntimeError.new("got error from server. Status code: #{response.code}")
        end
    end
end

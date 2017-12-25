# Copyright 2017 Richard Davis
#
# This file is part of bittrader-bot.
#
# bittrader-bot is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# bittrader-bot is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with bittrader-bot.  If not, see <http://www.gnu.org/licenses/>.

require 'uri'
require 'net/http'
require 'net/https'
require 'json'

##
# = BotLogic
# Author::    Richard Davis
# Copyright:: Copyright 2017 Richard Davis
# License::   GNU Public License 3
#
# Provides object for basic bot behavior over HTTP
module BittraderBot
  class BotLogic
    attr_reader :exchange, :host, :key, :secret

    ##
    # Initializes a BotLogic object
    def initialize config
      @exchange = config['exchange']
      @host = config['host']
      @key = config['key']
    end

    ##
    # Starts the connection to the server and provides identification
    def start_connection host
      uri = URI.parse(host)
      https = Net::HTTP.new(uri.host, 443)
      https.use_ssl = true
      return https
    end

    ##
    # Send GET request to exchange
    def send_get_request host, request
      https = start_connection host
      req = Net::HTTP::Get.new(request)
      https.request(req)
    end

    ##
    # Sends POST request to exchange
    def send_post_request data
      request = Net::HTTP::Post.new(uri.path, initheader: {'Content-Type' =>'application/json'})
      request['key'] = @key
      request['sign'] = sign_post_data(data.to_json)
      request.body = data.to_json
      response = https.request(request)
      puts "Response #{response.code} #{response.message}: #{response.body}"
    end

    ##
    # Signs POST data using HMAC-SHA512 method
    def sign_post_data data
      digest = OpenSSL::Digest.new('sha512')
      OpenSSL::HMAC.digest(digest, @secret, data)
    end
  end
end

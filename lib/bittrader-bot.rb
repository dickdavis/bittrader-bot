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

##
# = /lib/bittrader-bot.rb
# Author::    Richard Davis
# Copyright:: Copyright 2017 Richard Davis
# License::   GNU Public License 3
#
# Main application file that loads other files.
require 'bittrader-bot/bot_logic'
require 'bittrader-bot/namespace'
require 'bittrader-bot/coinmarketcap'
require 'bittrader-bot/exchange_interface'
require 'bittrader-bot/poloniex'

require 'optparse'

require 'telegram/bot'

trap('INT') do
  puts "\nTerminating..."
  exit
end

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: bittrader-bot [options]'

  opts.on('-e', '--execute FILE', 'Launches the bot with the specified configuration file.') do |file|
    options[:execute] = true
    options[:file] = file
  end

  opts.on('-l', '--license', 'Displays the copyright notice') do
    puts "This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
"
  end

  opts.on('-w', '--warranty', 'Displays the warranty statement') do
    puts "This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
"
  end

  opts.on_tail('-h', '--help', 'Displays the help screen') do
    puts opts
    exit
  end
end

optparse.parse!

##
# Launches bot with values read from config file
def start_bot config
  puts 'Loading configuration file...'
  file = File.read(config)
  config = JSON.parse file
  @bot = BittraderBot::BotLogic.new(config.to_h)
  puts 'Bittrader-Bot initialized.'
end

##
# Queries CoinMarketCap's API for a coin's current value in BTC and USD
def query_coin_price coin
  data = BittraderBot::CoinMarketCap.ticker_by_currency(coin)
  response = @bot.send_get_request(data[0], data[1])
  response_json = JSON.parse(response.body)
  coin_data = response_json[0].to_h
  "The price of #{coin} is currently #{coin_data['price_btc']} BTC (#{coin_data['price_usd']} USD)"
end

def on regex, message, &block
  regex =~ message.text

  if $~
    case block.arity
    when 0
      yield
    when 1
      yield $1
    when 2
      yield $1, $2
    end
  end
end

if options[:execute]
  start_bot options[:file]
  Telegram::Bot::Client.run(@bot.telegram_token) do |bot|
    bot.listen do |message|
      on (/^\/start/), message do
        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
      end

      on (/^\/check (.+)/), message do |arg|
        bot.api.send_message(chat_id: message.chat.id, text: "#{query_coin_price arg}")
      end

      on (/^\/stop/), message do
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
      end
    end
  end
end

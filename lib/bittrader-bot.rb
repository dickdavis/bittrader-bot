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

require 'optparse'

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

if options[:execute]
  puts 'Loading configuration file...'
  file = File.read(options[:file])
  config = JSON.parse file
  bot = BittraderBot::BotLogic.new(config.to_h)
  bot.start_connection
  puts 'Bot initialized; commencing trading activity.'
end


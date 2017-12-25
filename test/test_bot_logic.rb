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

require 'minitest/autorun'
require_relative '../lib/bittrader-bot/bot_logic'

##
# = BotLogicTest
# Author::    Richard Davis
# Copyright:: Copyright 2017 Richard Davis
# License::   GNU Public License 3
#
# Tests for Bittrader::BotLogic class
class BotLogicTest < Minitest::Test
  ##
  # Initializes test with sample data
  def setup
    config = { telegram_token: 'example_token' }
    @bot = BittraderBot::BotLogic.new(config)
  end

  ##
  # Tests that telegram_token gets properly initialized
  def test_telegram_token
    assert_equal('example_token', @bot.telegram_token)
  end
end

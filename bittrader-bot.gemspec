# -*- encoding: utf-8 -*-
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

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'bittrader-bot'
  s.version       = '0.0.1'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Richard Davis"]
  s.email         = 'rvdavis@member.fsf.org'
  s.homepage      = 'https://github.com/d3d1rty/bittrader-bot'
  s.summary       = 'A cryptocurrency trading bot.'
  s.description   = <<-EOF
  A cryptocurrency trading bot that interfaces with a given cryptocurrency trading exchange and sends notifications of trades via Telegram.
EOF
  s.license       = 'GPL-3.0'
  s.files         = Dir['lib/**/*']
  
    s.executables   = ['bittrader-bot']
  
  s.test_files    = Dir['test/**/*']
  s.require_path  = ['lib']
end

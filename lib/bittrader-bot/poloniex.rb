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

module BittraderBot
  module ExchangeInterface
    ##
    # = Poloniex
    # Author::    Richard Davis
    # Copyright:: Copyright 2017 Richard Davis
    # License::   GNU Public License 3
    #
    # Holds methods for interacting with Poloniex Exchange
    module Poloniex
      def self.return_ticker
      end

      def self.return_24_volume
      end

      def self.return_order_book
      end

      def self.return_trade_history
      end

      def self.return_chart_data
      end

      def self.return_currencies
      end

      def self.return_loan_orders
      end

      def self.return_balances
      end

      def self.return_complete_balances
      end

      ##
      # Not implemented
      def self.return_deposit_addresses
      end

      ##
      # Not implemented
      def self.generate_new_address
      end

      ##
      # Not implemented
      def self.return_deposits_withdrawals
      end

      def self.return_open_orders
      end

      def self.return_trade_history
      end

      def self.order_trades
      end

      def self.buy
      end

      def self.sell
      end

      def self.cancel_order
      end

      ##
      # Not implemented
      def self.move_order
      end

      ##
      # Not implemented
      def self.withdraw
      end

      def self.return_fee_info
      end

      def self.return_available_account_balances
      end

      def self.return_tradable_balances
      end

      ##
      # Not implemented
      def self.transfer_balance
      end

      ##
      # Not implemented
      def self.return_margin_account_summary
      end

      ##
      # Not implemented
      def self.margin_buy
      end

      ##
      # Not implemented
      def self.margin_sell
      end

      ##
      # Not implemented
      def self.get_margin_position
      end

      ##
      # Not implemented
      def self.close_margin_position
      end

      ##
      # Not implemented
      def self.create_loan_offer
      end

      ##
      # Not implemented
      def self.cancel_loan_offer
      end

      ##
      # Not implemented
      def self.return_open_loan_offers
      end

      ##
      # Not implemented
      def self.return_active_loans
      end

      ##
      # Not implemented
      def self.return_lending_history
      end

      ##
      # Not implemented
      def self.toggle_auto_renew
      end
    end
  end
end

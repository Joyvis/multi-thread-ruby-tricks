# frozen_string_literal: true

module BankAccounts
  module CalculateBalance
    module Step
      class SumIncomingTransfers < Micro::Case
        attributes :bank_account

        validates! :bank_account, type: BankAccount

        def call!
          Success do
            {
              total_outgoing: bank_account.outgoing_transfers&.sum(:value) || 0
            }
          end
        end
      end
    end
  end
end

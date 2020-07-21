# frozen_string_literal: true

module BankAccounts
  module CalculateBalance
    module Step
      class SumOutgoingTransfers < Micro::Case
        attributes :bank_account

        validates! :bank_account, type: BankAccount

        def call!
          Success do
            {
              total_incoming: bank_account.incoming_transfers&.sum(:value) || 0
            }
          end
        end
      end
    end
  end
end

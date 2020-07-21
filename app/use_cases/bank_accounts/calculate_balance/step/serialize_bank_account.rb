# frozen_string_literal: true

module BankAccounts
  module CalculateBalance
    module Step
      class SerializeBankAccount < Micro::Case
        attributes :bank_account, :total_balance

        validates! :bank_account, type: BankAccount
        validates! :total_balance, type: Float

        def call!
          Success do
            {
              bank_account: serialized_bank_account
            }
          end
        end

        private

        def serialized_bank_account
          bank_account.attributes.merge(balance: total_balance)
        end
      end
    end
  end
end

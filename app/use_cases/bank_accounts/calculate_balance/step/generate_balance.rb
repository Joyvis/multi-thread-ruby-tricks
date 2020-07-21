# frozen_string_literal: true

module BankAccounts
  module CalculateBalance
    module Step
      class GenerateBalance < Micro::Case
        attributes :total_outgoing, :total_incoming, :total_external

        validates! :total_incoming, type: Float
        validates! :total_outgoing, type: Float
        validates! :total_external, type: Float

        def call!
          Success do
            {
              total_balance: total_balance
            }
          end
        end

        private

        def total_balance
          total_incoming - total_outgoing + total_external
        end
      end
    end
  end
end

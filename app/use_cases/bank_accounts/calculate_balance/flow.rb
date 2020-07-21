module BankAccounts
  module CalculateBalance
    class Flow < Micro::Case
      flow Step::SumIncomingTransfers,
           Step::SumOutgoingTransfers,
           Step::SumExternalServiceValues,
           Step::GenerateBalance,
           Step::SerializeBankAccount
    end
  end
end

# frozen_string_literal: true

module BankAccounts
  module CalculateBalance
    module Step
      class SumExternalServiceValues < Micro::Case
        def call!
          Success do
            {
              total_external: total_external
            }
          end
        end

        private

        def total_external
          request_external_services
            .map { |transaction| transaction[:value] }
            .sum
            .to_f
        end

        def request_external_services
          [
            service_value, service_value, service_value, service_value,
            service_value, service_value, service_value, service_value
          ].flatten
        end

        def service_value
          RestClient.get('http://localhost:4000/external_requests') do |response|
            JSON.parse(response, symbolize_names: true)
          end
        end
      end
    end
  end
end

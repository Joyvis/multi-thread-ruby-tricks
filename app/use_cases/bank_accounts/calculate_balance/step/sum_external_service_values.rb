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
            .map(&:execute)
            .map(&:value)
            .flatten
            .map { |transaction| transaction[:value].to_f }
            .sum
        end

        def request_external_services
          [
            service_value, service_value, service_value, service_value,
            service_value, service_value, service_value, service_value,
            service_value, service_value, service_value, service_value,
            service_value, service_value, service_value, service_value,
            service_value, service_value, service_value, service_value
          ].flatten
        end

        def service_value
          Concurrent::Promise
            .new { RestClient.get('http://localhost:4000/external_requests') }
            .then { |response| JSON.parse(response, symbolize_names: true) }
        end
      end
    end
  end
end

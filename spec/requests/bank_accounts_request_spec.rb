require 'rails_helper'

describe "BankAccounts", type: :request do
  describe 'showing a BankAccount' do
    let(:parsed_response) { JSON.parse(response.body, symbolize_names: true)[:bank_account] }
    before do
      create(:transfer, target_account: bank_account, value: 10)
      create(:transfer, target_account: bank_account, value: 10)
      create(:transfer, target_account: bank_account, value: 10)
      create(:transfer, source_account: bank_account, value: 10)
      create(:transfer, source_account: bank_account, value: 10)

      get "/bank_accounts/#{bank_account_id}"
    end

    context 'when BankAccount exists' do
      let(:bank_account) { create(:bank_account) }
      let(:bank_account_id) { bank_account.id }

      it 'bank account has been shown' do
        expect(parsed_response.keys).to include(:balance)
        expect(parsed_response[:balance]).to eq(90)
      end
    end
  end
end

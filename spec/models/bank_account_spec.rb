require 'rails_helper'

describe BankAccount, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:incoming_transfers) }
    it { is_expected.to have_many(:outgoing_transfers) }
  end
end

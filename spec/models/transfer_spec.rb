require 'rails_helper'

describe Transfer, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:source_account) }
    it { is_expected.to belong_to(:target_account) }
  end
end

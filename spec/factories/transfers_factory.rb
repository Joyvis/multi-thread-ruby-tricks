FactoryBot.define do
  factory :transfer do
    source_account { create(:bank_account) }
    target_account { create(:bank_account) }
    value { 1 }
  end
end

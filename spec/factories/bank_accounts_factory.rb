FactoryBot.define do
  factory :bank_account do
    description { 'main account' }
    code { '00999-2' }

    user
  end
end

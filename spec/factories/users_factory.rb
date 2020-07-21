FactoryBot.define do
  factory :user do
    name { 'Karl Banks' }
    identification_document { '011223344' }
    birthdate { '1998-02-01' }
  end
end

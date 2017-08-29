FactoryGirl.define do
   factory :phrase do
     sequence(:title) { |n| "Phrase ##{n}" }
   end
end

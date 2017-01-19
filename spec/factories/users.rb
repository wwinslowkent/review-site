FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Hermione Granger #{n}" }
    sequence(:email) { |e| "harry@potter.com #{e}"}
    password "HarryPotter"
  end
end

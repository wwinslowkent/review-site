FactoryGirl.define do
  factory :admin do
    sequence(:email) { |e| "harry@potter.com #{e}"}
    password "HarryPotter"
  end
end

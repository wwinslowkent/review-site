FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Hermione Granger #{n}" }
    sequence(:email) { |e| "harry#{e}@potter.com" }
    password "HarryPotter"
    after :create do |b|
      b.update_column(:profile_photo, 'support/images/photo.png')
    end
  end
end

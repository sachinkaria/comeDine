FactoryGirl.define do
  factory :user do
    email 'sachin@sachin.com'
    password 'sachinkaria'
    password_confirmation 'sachinkaria'

    factory :user_with_table do
      after(:create) do |user|
        create(:table, user: user)
      end
    end

    factory :user_with_meal do
      after(:create) do |user|
        create(:table_with_meal, user: user)
      end
    end

  end
end

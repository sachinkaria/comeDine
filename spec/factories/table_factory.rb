FactoryGirl.define do
  factory :table do
    name "Sachins Restaurant"
    spaces 4
    house_number "2"
    street "Badminton Close"
    city "London"
    postcode "UB54NA"

    factory :table_with_meal do
      after(:create) do |table|
        create(:meal, table: table)
      end
    end

    factory :table_with_review do
      after(:create) do |table|
        create(:review, table: table)
      end
    end

  end
end

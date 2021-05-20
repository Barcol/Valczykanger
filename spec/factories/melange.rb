FactoryBot.define do
  factory :melange do
    name { "#{Faker::Movie.title} fans convention" }
    event_date { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }

    trait :with_participants do
      transient do
        number { 3 }
      end
      after(:build) do |melange, evaluator|
        evaluator.number.times do
          create(:participant_organizer, melange: melange, user: create(:user))
        end
      end
    end
  end
end

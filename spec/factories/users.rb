FactoryBot.define do
  factory :user do
    name { Faker::FunnyName.name }
    password { "password" }
    language { "pl" }

    sequence :email do |n|
      "user-#{n}@example.com"
    end

    before(:create) do |user|
      user.skip_confirmation!
    end
  end
end

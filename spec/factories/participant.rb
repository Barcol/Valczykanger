FactoryBot.define do
  factory :participant do
    association :user, factory: :user
    association :melange, factory: :melange

    factory :participant_guest do
      role { :guest }
    end

    factory :participant_moderator do
      role { :moderator }
    end

    factory :participant_organizer do
      role { :organizer }
    end
  end
end

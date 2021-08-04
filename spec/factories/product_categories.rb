FactoryBot.define do
  factory :product_category do
    melange { Melange.first }
    name { %w[Alkohol Jedzenie Przybory].sample }
  end
end

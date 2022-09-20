FactoryBot.define do
    factory :website do
        name { Faker::Company.name }
        url { Faker::Internet.url }
    end
end
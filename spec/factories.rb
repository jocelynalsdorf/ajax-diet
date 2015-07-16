FactoryGirl.define do


 factory :user do
  	name('jocelyn alsdorf')
    sequence(:email) {|n| "test#{n}@example.com" }
    password('12345678')
  end

  factory :food do
    food_name('eggs')
    calories(100)
  end

  factory :exercise do
    description('run')
    burned(200)
  end

end

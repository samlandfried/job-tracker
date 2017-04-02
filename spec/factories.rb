FactoryGirl.define do
  factory :tag do
    title 'tag title'
    jobs []
  end

  factory :job do
    sequence :title do |n|
      "Plumber ##{n}"
    end
    description '#1 in the #2 business'
    level_of_interest 22
    city 'Denver'
  end
end

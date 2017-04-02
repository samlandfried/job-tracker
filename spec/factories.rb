FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "Category ##{n}"
    end
  end

  factory :company do
    sequence :name do |n|
      "Company ##{n}"
    end
  end

  factory :tag do
    sequence :title do |n|
      "Tag ##{n}"
    end
  end

  factory :job do
    sequence :title do |n|
      "Job ##{n}"
    end
    description '#1 in the #2 business'
    level_of_interest 22
    city 'Denver'
    category
    company
  end
end

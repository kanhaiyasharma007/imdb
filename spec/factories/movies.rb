FactoryGirl.define do
  factory :movie do |u|
    u.name   {Faker::Name.first_name}
    u.description  {Faker::Name.last_name}
  end
end

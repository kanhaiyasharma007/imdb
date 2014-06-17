FactoryGirl.define do
  factory :rating do |u|
    u.stars { 1 + rand(6) }  
  end
end

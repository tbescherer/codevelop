FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    username 'example_person'
    password 'password'
    factory :valid_user_two do
      email 'example2@example.com'
      username 'example2_person'
    end
  end
end

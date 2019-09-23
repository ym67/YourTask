FactoryBot.define do
  factory :test_user1, class: User do
    id { 1 }
    name { 'テストユーザ1' }
    email { 'test1@example.com' }
    password { 'test111'}
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

  factory :test_user2, class: User do
    id { 2 }
    name { 'テストユーザ2' }
    email { 'test2@example.com' }
    password { 'test222'}
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

  factory :test_user3, class: User do
    id { 3 }
    name { 'テストユーザ3' }
    email { 'test3@example.com' }
    password { 'test333'}
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

end

FactoryBot.define do
  factory :test_task1, class: Task do
    name { 'テスト（タスク名）1' }
    description { 'テスト（説明）1' }
    created_at { DateTime.current }
    updated_at { DateTime.current }
    deadline { DateTime.current }
    status { 'done' }
    priority { 'low' }
    user_id { 1 }
  end

  factory :test_task2, class: Task do
    name { 'テスト（タスク名）2' }
    description { 'テスト（説明）2' }
    created_at { DateTime.current + 1.days }
    updated_at { DateTime.current + 2.days }
    deadline { DateTime.current + 3.days }
    status { 'in_progress' }
    priority { 'high' }
    user_id { 1 }
  end

  factory :test_task3, class: Task do
    name { 'テスト（タスク名）3' }
    description { 'テスト（説明）3' }
    created_at { DateTime.current + 2.days }
    updated_at { DateTime.current + 3.days }
    deadline { DateTime.current + 4.days }
    status { 'untouched' }
    priority { 'middle' }
    user_id { 2 }
  end
end

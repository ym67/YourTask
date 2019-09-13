FactoryBot.define do
  factory :task_test1, class: Task do
    name { 'テスト1:タスク名' }
    description { 'テスト1:説明' }
    created_at { Time.current + 1.days }
  end

  factory :task_test2, class: Task do
    name { 'テスト2:タスク名' }
    description { 'テスト2:説明' }
    created_at { Time.current + 2.days }
  end
end

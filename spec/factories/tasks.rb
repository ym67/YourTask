FactoryBot.define do
  factory :task_test1, class: Task do
    name { 'タスク名カラム1' }
    description { '説明カラム1' }
    created_at { Time.current }
    updated_at { Time.current }
    deadline { Time.current }
  end

  factory :task_test2, class: Task do
    name { 'タスク名カラム2' }
    description { '説明カラム2' }
    created_at { Time.current + 1.days }
    updated_at { Time.current + 2.days }
    deadline { Time.current + 3.days }
  end

  factory :task_test3, class: Task do
    name { 'タスク名カラム3' }
    description { '説明カラム3' }
    created_at { Time.current + 2.days }
    updated_at { Time.current + 3.days }
    deadline { Time.current + 4.days }
  end
end

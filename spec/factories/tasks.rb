FactoryBot.define do
  factory :task_test1, class: Task do
    name { 'タスク名カラム1' }
    description { '説明カラム1' }
    created_at { DateTime.current }
    updated_at { DateTime.current }
    deadline { DateTime.current }
    status { 'done' }
  end

  factory :task_test2, class: Task do
    name { 'タスク名カラム2' }
    description { '説明カラム2' }
    created_at { DateTime.current + 1.days }
    updated_at { DateTime.current + 2.days }
    deadline { DateTime.current + 3.days }
    status { 'in_progress' }
  end

  factory :task_test3, class: Task do
    name { 'タスク名カラム3' }
    description { '説明カラム3' }
    created_at { DateTime.current + 2.days }
    updated_at { DateTime.current + 3.days }
    deadline { DateTime.current + 4.days }
    status { 'untouched' }
  end
end

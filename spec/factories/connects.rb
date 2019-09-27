FactoryBot.define do
  factory :test_connect1, class: Connect do
    task_id { 14 }
    label_id { 1 }
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

  factory :test_connect2, class: Connect do
    task_id { 1 }
    label_id { 2 }
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

  factory :test_connect3, class: Connect do
    task_id { 1 }
    label_id { 3 }
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

  factory :test_connect4, class: Connect do
    task_id { 23 }
    label_id { 1 }
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end
end

FactoryBot.define do
  factory :test_label1, class: Label do
    id { 1 }
    label { '仕事' }
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

  factory :test_label2, class: Label do
    id { 2 }
    label { '勉強' }
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

  factory :test_label3, class: Label do
    id { 3 }
    label { '交際' }
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

  factory :test_label4, class: Label do
    id { 4 }
    label { '健康' }
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end

  factory :test_label5, class: Label do
    id { 5 }
    label { 'その他' }
    created_at { DateTime.current }
    updated_at { DateTime.current }
  end
end

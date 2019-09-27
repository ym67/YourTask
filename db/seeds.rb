# conding: utf-8

# 一般ユーザ
User.create!(
  [
    {
      name: '一般ユーザ1', email: 'test1@seed.com', password: '000000', created_at: DateTime.current, updated_at: DateTime.current, admin: false
    },
    {
      name: '一般ユーザ2', email: 'testl2@seed.com', password: '000000', created_at: DateTime.current, updated_at: DateTime.current, admin: false
    },
    {
      name: '一般ユーザ3', email: 'test3@seed.com', password: '000000', created_at: DateTime.current, updated_at: DateTime.current, admin: false
    }
  ]
)

# 管理者
User.create!(
  [
    {
      name: '管理者1', email: 'admin1@seed.com', password: '000000', created_at: DateTime.current, updated_at: DateTime.current, admin: true
    },
    {
      name: '管理者2', email: 'admin2@seed.com', password: '000000', created_at: DateTime.current, updated_at: DateTime.current, admin: true
    },
    {
      name: '管理者3', email: 'admin3@seed.com', password: '000000', created_at: DateTime.current, updated_at: DateTime.current, admin: true
    }
  ]
)

# タスク
Task.create!(
  [
    {
      name: 'タスク1', description: 'タスク1です。', created_at: DateTime.current, updated_at: DateTime.current, deadline: DateTime.current + 1.days, status: 'done', priority: 'high', user_id: 1
    },
    {
      name: 'タスク2', description: 'タスク2です。', created_at: DateTime.current, updated_at: DateTime.current, deadline: DateTime.current + 2.days, status: 'in_progress', priority: 'middle', user_id: 2
    },
    {
      name: 'タスク3', description: 'タスク3です。', created_at: DateTime.current, updated_at: DateTime.current, deadline: DateTime.current + 3.days, status: 'untouched', priority: 'low', user_id: 3
    }
  ]
)

# ラベル
Label.create!(
  [
    {
      label: '仕事', created_at: DateTime.current, updated_at: DateTime.current
    },
    {
      label: '勉強', created_at: DateTime.current, updated_at: DateTime.current
    },
    {
      label: '交際', created_at: DateTime.current, updated_at: DateTime.current
    },
    {
      label: '健康', created_at: DateTime.current, updated_at: DateTime.current
    },
    {
      label: 'その他', created_at: DateTime.current, updated_at: DateTime.current
    }
  ]
)

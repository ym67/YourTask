# conding: utf-8

User.create(name: '一般ユーザ', email: 'normal@seed.com', password: 'seed111', created_at: DateTime.current, updated_at: DateTime.current, admin: false)

User.create(name: 'adminユーザ', email: 'admin@seed.com', password: 'admin111', created_at: DateTime.current, updated_at: DateTime.current, admin: true)

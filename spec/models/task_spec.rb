require 'rails_helper'

RSpec.describe Task, type: :model do
  it "nameが空ならバリデーションが通らない" do
    task = Task.new(name: '', description: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "nameとdescriptionに内容が記載されていればバリデーションが通る" do
    task = Task.new(name: 'テスト！', description: '成功テスト')
    expect(task).to be_valid
  end

  it "scopeのテスト" do
    FactoryBot.create(:task_test1)
    FactoryBot.create(:task_test2)
    FactoryBot.create(:task_test3)
    tasks = Task.all
    tasks_without_scope = tasks.order(created_at: :desc)
    tasks_with_scope = tasks.sorted
    expect(tasks_without_scope.first).to eq tasks_with_scope.first
    expect(tasks_without_scope.first).not_to eq tasks_with_scope.last
  end

end

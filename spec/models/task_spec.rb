require 'rails_helper'

RSpec.describe Task, type: :model do
  it "nameが空ならバリデーションが通らない" do
    FactoryBot.create(:test_user1)
    task = Task.new(name: '', description: '失敗テスト', user_id: 1)
    expect(task).not_to be_valid
  end

  it "nameが記載されていればバリデーションが通る" do
    FactoryBot.create(:test_user1)
    task = Task.new(name: 'テスト！', description: '成功テスト', user_id: 1)
    expect(task).to be_valid
  end

  it "scopeのテスト" do
    FactoryBot.create(:test_user1)
    FactoryBot.create(:test_task1)
    FactoryBot.create(:test_task2)
    tasks = Task.all
    tasks_without_scope = tasks.order(created_at: :desc)
    tasks_with_scope = tasks.sorted
    expect(tasks_without_scope.first).to eq tasks_with_scope.first
    expect(tasks_without_scope.first).not_to eq tasks_with_scope.last
  end

end

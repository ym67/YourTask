require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:task_test1)
    FactoryBot.create(:task_test2)
  end

  scenario "タスク一覧のテスト" do
    visit tasks_path

    expect(page).to have_content 'テスト1:タスク名'
    expect(page).to have_content 'テスト2:タスク名'
    expect(page).to have_content 'テスト1:説明'
    expect(page).to have_content 'テスト2:説明'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'テスト3:タスク名'
    fill_in 'task_description', with: 'テスト3:説明'

    click_on '登録する'

    expect(page).to have_content 'テスト3:タスク名'
    expect(page).to have_content 'テスト3:説明'
  end

  scenario "タスク詳細のテスト" do
    visit task_path(1)
    visit task_path(2)
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path

    task = all('.task_name')
    task_first = task.first
    task_last = task.last

    expect(task_first).to have_content "テスト2:タスク名"
    expect(task_last).to have_content "テスト1:タスク名"
  end
end

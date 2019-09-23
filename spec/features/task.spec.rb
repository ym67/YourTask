require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    # テストユーザ
    FactoryBot.create(:test_user1)
    FactoryBot.create(:test_user2)
    FactoryBot.create(:test_user3)

    # テストタスク
    FactoryBot.create(:test_task1)
    FactoryBot.create(:test_task2)
    FactoryBot.create(:test_task3)

    # # ログイン処理
    visit new_session_path
    ## test_user1でログイン
    fill_in 'session_email', with: 'test1@example.com'
    fill_in 'session_password', with: 'test111'
    click_on 'ログイン' # => user_path(1)に飛ぶ
  end

  scenario "タスク一覧のテスト" do
    visit tasks_path

    expect(page).to have_content '低'
    expect(page).to have_content '完了'
    expect(page).to have_content 'テスト（タスク名）1'
    expect(page).to have_content DateTime.current.strftime("%Y年%m月%d日")
    expect(page).to have_content '×'

    # 他ユーザのタスクが表示されていないかどうか
    expect(page).not_to have_content 'テスト（タスク名）3'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in 'task_name', with: '作成テスト(タスク名)'
    fill_in 'task_description', with: '作成テスト（説明）'
    select DateTime.current.year, from: 'task_deadline_1i'
    select DateTime.current.month, from: 'task_deadline_2i'
    select DateTime.current.day, from: 'task_deadline_3i'
    select '未着手', from: 'task_status'
    select '高', from: 'task_priority'

    click_on '登録する'

    expect(page).to have_content '作成テスト(タスク名)'
    expect(page).to have_content '作成テスト（説明）'
    expect(page).to have_content DateTime.current.strftime("%Y年%m月%d日")
    expect(page).to have_content '未着手'
    expect(page).to have_content '高'
  end

  scenario "タスク詳細のテスト" do
    visit task_path(1)
    visit task_path(2)
    visit task_path(3)
  end

  scenario "タスクが作成日時順（降順）に並んでいるかのテスト" do
    visit tasks_path

    tasks = all('.task_name')
    task_first = tasks.first
    task_last = tasks.last

    expect(task_first).to have_content "テスト（タスク名）2"
    expect(task_last).to have_content "テスト（タスク名）1"
  end

  scenario "タスク検索のテスト" do
    # ステータス検索
    visit tasks_path

    select '完了'

    click_on '検索'

    expect(page).to have_content "テスト（タスク名）1"
    expect(page).not_to have_content "テスト（タスク名）2"
    expect(page).not_to have_content "テスト（タスク名）3"

    # タスク名検索
    visit tasks_path

    fill_in with: '2'

    click_on '検索'

    expect(page).not_to have_content "テスト（タスク名）1"
    expect(page).to have_content "テスト（タスク名）2"
    expect(page).not_to have_content "テスト（タスク名）3"

    # ステータス+タスク名検索
    visit tasks_path

    select '完了'
    fill_in with: '1'

    click_on '検索'

    expect(page).to have_content "テスト（タスク名）1"
    expect(page).not_to have_content "テスト（タスク名）2"
    expect(page).not_to have_content "テスト（タスク名）3"
  end

end

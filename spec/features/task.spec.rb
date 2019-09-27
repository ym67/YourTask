require 'rails_helper'

# puts Task.all.pluck(:id)
# save_and_open_page

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

    # テストコネクト（中間テーブル）
    # FactoryBot.create(:test_connect1)
    # FactoryBot.create(:test_connect2)
    # FactoryBot.create(:test_connect3)

    # テストラベル
    FactoryBot.create(:test_label1)
    FactoryBot.create(:test_label2)
    FactoryBot.create(:test_label3)
    FactoryBot.create(:test_label4)
    FactoryBot.create(:test_label5)

    # ログイン処理
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
  end

  scenario "タスク作成のテスト（ラベル込み）" do
    visit new_task_path

    fill_in 'task_name', with: '作成テスト(タスク名)'
    fill_in 'task_description', with: '作成テスト（説明）'
    select DateTime.current.year, from: 'task_deadline_1i'
    select DateTime.current.month, from: 'task_deadline_2i'
    select DateTime.current.day, from: 'task_deadline_3i'
    select '未着手', from: 'task_status'
    select '高', from: 'task_priority'
    check 'task_label_ids_1'
    check 'task_label_ids_5'

    click_on '登録する'

    expect(page).to have_content '作成テスト(タスク名)'
    expect(page).to have_content '作成テスト（説明）'
    expect(page).to have_content DateTime.current.strftime("%Y年%m月%d日")
    expect(page).to have_content '未着手'
    expect(page).to have_content '高'
    expect(page).to have_content '仕事'
    expect(page).to have_content 'その他'
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

  scenario "タスク検索のテスト：ラベル検索" do
    FactoryBot.create(:test_connect1)
    visit tasks_path

    select '仕事'

    click_on '検索'

    expect(page).to have_content "テスト（タスク名）1"
    expect(page).not_to have_content "テスト（タスク名）2"
    expect(page).not_to have_content "テスト（タスク名）3"
  end

  scenario "タスク検索のテスト：ステータス検索" do
    visit tasks_path

    select '完了'

    click_on '検索'

    expect(page).to have_content "テスト（タスク名）1"
    expect(page).not_to have_content "テスト（タスク名）2"
    expect(page).not_to have_content "テスト（タスク名）3"
  end

  scenario "タスク検索のテスト：タスク名検索" do
    visit tasks_path

    fill_in with: '2'

    click_on '検索'

    expect(page).not_to have_content "テスト（タスク名）1"
    expect(page).to have_content "テスト（タスク名）2"
    expect(page).not_to have_content "テスト（タスク名）3"
  end

  scenario "タスク検索のテスト：ラベル・ステータス・タスク名組み合わせ検索" do
    FactoryBot.create(:test_connect4)
    visit tasks_path

    select '仕事'
    select '完了'
    fill_in with: '1'

    click_on '検索'

    expect(page).to have_content "テスト（タスク名）1"
    expect(page).not_to have_content "テスト（タスク名）2"
    expect(page).not_to have_content "テスト（タスク名）3"
  end
end

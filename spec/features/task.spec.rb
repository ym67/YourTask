require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:task_test1)
    FactoryBot.create(:task_test2)
    FactoryBot.create(:task_test3)
  end

  scenario "タスク一覧のテスト" do
    visit tasks_path

    expect(page).to have_content 'タスク名カラム1'
    expect(page).to have_content '説明カラム1'
    expect(page).to have_content Time.current
    expect(page).to have_content '完了'
    expect(page).to have_content '低'
    expect(page).to have_content 'タスク名カラム2'
    expect(page).to have_content '説明カラム2'
    expect(page).to have_content Time.current + 3.days
    expect(page).to have_content '着手中'
    expect(page).to have_content '高'
    expect(page).to have_content 'タスク名カラム3'
    expect(page).to have_content '説明カラム3'
    expect(page).to have_content Time.current + 4.days
    expect(page).to have_content '未着手'
    expect(page).to have_content '中'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'タスク名カラム：作成テスト'
    fill_in 'task_description', with: '説明カラム：作成テスト'
    fill_in 'task_deadline', with: Time.current + 3.days
    select '未着手', from: 'ステータス'
    select '高', from: '優先順位'

    click_on '登録する'

    expect(page).to have_content 'タスク名カラム：作成テスト'
    expect(page).to have_content '説明カラム：作成テスト'
    expect(page).to have_content Time.current + 3.days
    expect(page).to have_content '未着手'
    expect(page).to have_content '高'
  end

  scenario "タスク詳細のテスト" do
    visit task_path(1)
    visit task_path(2)
    visit task_path(3)
  end

  scenario "タスクが作成日時順（降順）に並んでいるかのテスト" do
    # 優先順位検索
    visit tasks_path

    task = all('.task_name')
    task_first = task.first
    task_last = task.last

    expect(task_first).to have_content "タスク名カラム3"
    expect(task_last).to have_content "タスク名カラム1"
  end

  scenario "タスク検索のテスト" do
    # ステータス検索
    visit tasks_path

    select '中'

    click_on '検索'

    expect(page).not_to have_content "タスク名カラム1"
    expect(page).to have_content "タスク名カラム2"
    expect(page).not_to have_content "タスク名カラム3"

    # ステータス検索
    visit tasks_path

    select '未着手'

    click_on '検索'

    expect(page).not_to have_content "タスク名カラム1"
    expect(page).not_to have_content "タスク名カラム2"
    expect(page).to have_content "タスク名カラム3"

    # タスク名検索
    visit tasks_path

    fill_in with: 'カラム2'

    click_on '検索'

    expect(page).not_to have_content "タスク名カラム1"
    expect(page).to have_content "タスク名カラム2"
    expect(page).not_to have_content "タスク名カラム3"

    # 優先順位+ステータス+タスク名検索
    visit tasks_path

    select '中'
    select '未着手'
    fill_in with: 'カラム3'

    click_on '検索'

    expect(page).not_to have_content "タスク名カラム1"
    expect(page).not_to have_content "タスク名カラム2"
    expect(page).to have_content "タスク名カラム3"
  end

end

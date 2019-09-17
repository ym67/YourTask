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
    expect(page).to have_content 'タスク名カラム2'
    expect(page).to have_content '説明カラム2'
    expect(page).to have_content Time.current + 3.days
    expect(page).to have_content 'タスク名カラム3'
    expect(page).to have_content '説明カラム3'
    expect(page).to have_content Time.current + 4.days
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'タスク名カラム：作成テスト'
    fill_in 'task_description', with: '説明カラム：作成テスト'
    fill_in 'task_deadline', with: Time.current

    click_on '登録する'

    expect(page).to have_content 'タスク名カラム：作成テスト'
    expect(page).to have_content '説明カラム：作成テスト'
    expect(page).to have_content Time.current
  end

  scenario "タスク詳細のテスト" do
    visit task_path(1)
    visit task_path(2)
    visit task_path(3)
  end

  scenario "タスクが作成日時でソートできるかのテスト" do
    visit tasks_path

    task = all('.task_name')
    task_first = task.first
    task_last = task.last

    expect(task_first).to have_content "タスク名カラム3"
    expect(task_last).to have_content "タスク名カラム1"
  end

  scenario "タスクが終了期限でソートできるかのテスト" do
    visit tasks_path(sort_expired: "deadline")

    task = all('.task_name')
    task_first = task.first
    task_last = task.last

    expect(task_first).to have_content "タスク名カラム1"
    expect(task_last).to have_content "タスク名カラム3"
  end

end

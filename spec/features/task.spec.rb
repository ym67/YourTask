require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  scenario "タスク一覧のテスト" do
    Task.create!(name: 'test_task_name_01', description: 'test_task_description_01')
    Task.create!(name: 'test_task_name_02', description: 'test_task_description_02')

    visit tasks_path

    expect(page).to have_content 'test_task_name_01'
    expect(page).to have_content 'test_task_name_02'

    expect(page).to have_content 'test_task_description_01'
    expect(page).to have_content 'test_task_description_02'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_name_03'
    fill_in 'task_description', with: 'test_task_description_03'

    click_on '登録する'

    expect(page).to have_content 'test_task_name_03'
  end

  scenario "タスク詳細のテスト" do
    Task.create!(id: 4, name: 'test_task_name_04', description: 'test_task_description_04')

    visit task_path(4)
  end
end

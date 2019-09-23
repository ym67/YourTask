require 'rails_helper'

RSpec.feature "ユーザ管理機能", type: :feature do
  scenario "ユーザ新規登録・詳細確認のテスト" do
    # ユーザ登録
    visit new_user_path
    fill_in 'user_name', with: 'テストユーザ1'
    fill_in 'user_email', with: 'test1@example.com'
    fill_in 'user_password', with: 'test111'
    fill_in 'user_password_confirmation', with: 'test111'
    click_on '登録する' # => ユーザ詳細画面へ
    expect(page).to have_content 'テストユーザ1'
    expect(page).to have_content 'test1@example.com'

    visit tasks_path # => 一旦違う画面へ

    # 再度ユーザ詳細画面へ
    visit user_path(1)
    expect(page).to have_content 'テストユーザ1'
    expect(page).to have_content 'test1@example.com'
  end

  scenario "ログイン・ログアウトのテスト" do
    # ユーザ登録
    visit new_user_path
    fill_in 'user_name', with: 'テストユーザ2'
    fill_in 'user_email', with: 'test2@example.com'
    fill_in 'user_password', with: 'test222'
    fill_in 'user_password_confirmation', with: 'test222'
    click_on '登録する'
    expect(page).to have_content 'テストユーザ2'
    expect(page).to have_content 'test2@example.com'

    # ログアウト操作
    click_on 'ログアウト' # => ログイン画面へ
    expect(page).to have_content 'ログアウトしました。'

    # ログイン操作
    fill_in 'session_email', with: 'test2@example.com'
    fill_in 'session_password', with: 'test222'
    click_on 'ログイン' # => ユーザ詳細画面へ
    expect(page).to have_content 'ログインしました。'
    expect(page).to have_content 'テストユーザ2'
    expect(page).to have_content 'test2@example.com'
  end

  scenario "未ログインの場合、ログイン画面か新規登録画面のみアクセス可能になっているかのテスト" do
    visit tasks_path
    expect(page).to have_content 'ログインが必要です'
    visit task_path(1)
    expect(page).to have_content 'ログインが必要です'
    visit user_path(1)
    expect(page).to have_content 'ログインが必要です'
  end

  scenario "ログイン済みの場合、ログイン画面か新規登録画面にはアクセス不可になっているかのテスト" do
    visit new_user_path
    fill_in 'user_name', with: 'テストユーザ1'
    fill_in 'user_email', with: 'test1@example.com'
    fill_in 'user_password', with: 'test111'
    fill_in 'user_password_confirmation', with: 'test111'
    click_on '登録する'

    visit new_user_path
    expect(page).to have_content 'すでにログインしています。'
    visit new_session_path
    expect(page).to have_content 'すでにログインしています。'
  end


end

# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "タスク一覧のテスト" do
    # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
    Task.create!(name: 'test_task_name_01', description: 'test_task_description_01')
    Task.create!(name: 'test_task_name_02', description: 'test_task_description_02')

    # tasks_pathにvisitする（タスク一覧ページに遷移する）
    visit tasks_path

    # 実際の状況を確認したい場合(※ gem 'launchy'が必要)
    # 確認したい箇所にsave_and_open_pageをさし挟む。
    # この箇所の場合、「タスクが保存された後、タスク一覧ページに行くとどうなるのか」を確認できる
    # save_and_open_page

    # visitした（到着した）expect(page)に（タスク一覧ページに）「testtesttest」「samplesample」という文字列が
    # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）テストを書いている
    # => タスク名欄(nameカラム)
    expect(page).to have_content 'test_task_name_01'
    expect(page).to have_content 'test_task_name_02'
    # =>説明欄(descriptionカラム)
    expect(page).to have_content 'test_task_description_01'
    expect(page).to have_content 'test_task_description_02'

    # save_and_open_page

    # わざと間違った結果を期待するテストも実施してみる
    # =>「間違えた記載内容の場合、テストも正しく間違う」ことができるかを確認する
    # expect(page).to have_content '間違った内容その１'
    # expect(page).to have_content '間違った内容その２'

  end

  scenario "タスク作成のテスト" do
    # new_task_pathにvisitする（タスク登録ページに遷移する）
    # 1.ここにnew_task_pathにvisitする処理を書く
    visit new_task_path
    # 「name」(viewでの表示は「タスク名」)というラベル名の入力欄(nameカラム)と、
    # 「description」(viewでの表示は「説明」)というラベル名の入力欄(descriptionカラム)に
    # タスク名とタスクの説明をそれぞれfill_in（入力）する
    # 記述例：fill_in 'ラベル名', with: '入力内容'
    # 2.ここに「タスク名」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
    fill_in 'task_name', with: 'test_task_name_03'
    # 3.ここに「説明」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
    fill_in 'task_description', with: 'test_task_description_03'

    # 「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）
    # 記述例：click_on 'value（表記文字）'
    # 4.「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
    click_on '登録する'

    # save_and_open_page

    # clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
    # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
    # 5.タスク詳細ページに、テストコードで作成したはずのデータ（記述）がhave_contentされているか（含まれているか）を確認（期待）するコードを書く
    expect(page).to have_content 'test_task_name_03'

    # save_and_open_page

  end

  scenario "タスク詳細のテスト" do

    Task.create!(id: 4, name: 'test_task_name_04', description: 'test_task_description_04')

    visit task_path(4)

    # save_and_open_page

  end
end

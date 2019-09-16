* このアプリは、[株式会社万葉様](https://everyleaf.com/)が公開している[新入社員教育用カリキュラム](https://github.com/everyleaf/el-training)（および同社より正式な許諾を経た[株式会社DIVE INTO CODE](https://diveintocode.jp/)の[カリキュラム](https://diver.diveintocode.jp/curriculums/1277)）を元に作成したものです。

## 概要
* 個人向けタスク管理アプリです。
主な機能は以下の通りです。  
  ・ユーザ登録（自分が登録したタスクのみ閲覧可）  
  ・ユーザ管理機能（管理者アカウントのみ）  
  ・タスクの登録  
  ・終了期限の設定  
  ・優先順位の設定  
  ・ステータス（未着手・着手・完了）の管理  
  ・ステータスによるタスクの絞り込み  
  ・タスク名・タスクの説明文によるタスクの検索  
  ・タスクの一覧。一覧画面での（優先順位、終了期限などを元にした）ソート  
  ・ラベルを付けた分類  

## 開発環境
#### 言語・ミドルウェアなど
- Ruby 2.6.3
- Ruby on Rails 5.2.3
- PostgreSQL 11.5

## デプロイ手順（Step13）
※ 以下はローカル環境から`$ git push heroku master`を実行してHerokuにデプロイする方法では無く、GitHubとHerokuを連携させ、GitHubの該当brunchにコードがmerge（PRがmerge）される度、その内容が自動でHerokuにpush、デプロイされる方法について記載しています。

1. ローカルにて、アセットプリコンパイルを実行しておく。  
`$ rails assets:precompile RAILS_ENV=production`  

2. プリコンパイルで作成したファイルをcommitし、GitHubへPushする。
```
$ git add -A
$ git commit -m "アセットプリコンパイルを実行"
$ git push origin トピックブランチ名
```  

3. [GitHub](https://github.com/)にてpull requestを作成し、レビューをもらう。  

4. レビュワーからOKがでたら、pullrequestをデプロイしたいbrunchにmergeする。  

5. [Heroku](https://dashboard.heroku.com/apps)にアクセスし、画面右上の **［New］** をクリックし、プルダウンメニューから **［Create new app］** をクリックする（そのまま[Create new app](https://dashboard.heroku.com/new-app)画面に移行する）。  

6. **［App name］** 、 **［Choose a region］** を入力していく。
```
[App name]は、Herokuアプリケーションへアクセスするときの URLの一部になる。ここで指定したApp nameが、https://<App name>.herokuapp.comとしてアクセスできるようになる。
※ ドメイン名の一分になるので、世界中で唯一の名前であることが必須。
※ 面倒な場合は空欄にしておけば、自動的にアプリケーション名が割り振られる。
[Choose a region]は、標準のままの「United States」でOK。
```

7. ［App name］、［Choose a region］を設定し終えたら、下の **［Create app］** をクリックする（そのまま作成されたアプリのダッシュボード画面に移行する）。  

8. 画面下部にある【Deployment method】の欄で、［Heroku Git］が選択されて（四角い枠で囲まれて）いるのを確認後、そのすぐ右隣にある **［GitHub］** の項目をクリック（選択）する。  

9. しばらくすると、【Connect to GitHub】という欄が表示されるので、画面下部の **［Connect to GitHub］** をクリックする。  

10. 【Authorize application】というウィンドウが開かれ、【Authorize Heroku Dashboard】という項目（GitHubでの認可画面）が表示されているので、画面下部の **［Authorize heroku］** をクリックする。  

11. Authorizeに成功すると、「Search for a repository to connect to（接続するリポジトリを検索する）」画面に移行するので、[repo-name]欄に **デプロイしたい状態のアプリが反映されているGitHubのリポジトリ名（1~4の手順で準備したもの）** を入力し、 **［Search］** をクリックする。  

12. 検索したリポジトリ名が正しければ、すぐ下にそのリポジトリ名が表示されるので、右側にある **［Connect］** をクリックする。  

13. 【Automatic deploys】と【Manual deploy】という欄が表示されていれば接続成功。【Automatic deploys】の欄で、正しいbranchが選択されているのを確認後、 **［Enable Automatic Deploys］** をクリックする。  
※ なお、【Manual deploy】の欄で［Deploy Branch］をクリックすれば、手動でデプロイも可能。  

14. 画面右上の **［More］** をクリックし、プルダウンメニューから **［Run console］** をクリックする。
表示されるコンソールで`rails db:migrate`を入力し、［Run］をクリックする。

15. Herokuでのmigrateが完了後、画面右上の［Open app］をクリックするか、6で設定・作成したURLに直接アクセスし、アプリが正しく表示・起動していれば終了。  
以後、GitHubの接続したリポジトリの該当ブランチに新しいコミットがプッシュされるたび、自動でその内容がHerokuにプッシュ、デプロイされるようになる。  

## 仮モデル図（Step4）

<br>

**Userモデル**

| データ型 | カラム名 |
|---:|:---|
| string | :name |
| string | :email |
| string | :password_digest |
| index | :email |

**Taskモデル**

| データ型 | カラム名 |
|---:|:---|
| string | :name |
| text | :description |
| string | :status |
| date | :deadline |
| string | :priority |
| index | :user_id |

**Labelモデル**

| データ型 | カラム名 |
|---:|:---|
| integer | :user_id |
| integer | :task_id |

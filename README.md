# README

### ・Step4 モデル図(仮)

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

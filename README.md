# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|nill: false, unique: true| 
|email|string|nill: false, unique: true|
|password|string|nill: false|
### Association
- has_many :messages
- has_many :user_groups

<!-- ## user_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|nill: false, foreign_key: true|
|group_id|references|nill: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group -->

<!-- ## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|nill: false| 
### Association
- has_many :users, through: :user_groups
- has_many :messages
- has_many :user_groups -->

## emotionテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|nill: false, foreign_key: true|
|text|text|nill: false, unique: true|
|emotion|string|nill: false|
### Association
- belongs_to :user
- belongs_to :group

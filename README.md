## users テーブル

| Column               | Type     | Options                  |
| ----------           | ------   | -----------              |
| nickname             | string   | null: false              |
| encrypted_password   | string   | null: false              |
| email                | string   | null: false,unique: true |
| first_name           | string   | null: false              |
| first_name_kana      | string   | null: false              |
| last_name            | string   | null: false              |
| last_name_kana       | string   | null: false              |
| birthday             | date     | null: false              |


### Association
has_many :items
has_many :purchases


## items テーブル

| Column           | Type         | Options                         |
| ------------     | ------       | -----------------------------   |
| name             | string       | null: false                     |
| explanation      | text         | null: false                     |
| category_id      | integer      | null: false                     |
| items_status_id  | integer      | null: false                     |
| delivery_fee_id  | integer      | null: false                     |
| area_id          | integer      | null: false                     |
| prefecture_id      | integer      | null: false                     |
| price            | integer      | null: false                     |
| user             | references   | null: false,foreign_key: true   |




### Association

belongs_to :user
has_one :purchase 




## address テーブル

| Column         | Type       | Options                         |
| ----------     | ------     | -----------                     |
| postal_code    | string     | null: false                     |
| prefecture_id  | integer    | null: false                     |
| municipality   | string     | null: false                     |
| house_number   | string     | null: false                     |
| building       | string     |                                 |
| phone_number   | string     | null: false                     |
| purchase       | references | null: false,foreign_key: true   |


belongs_to :purchase



## purchase テーブル



| Column     | Type       | Options                         |
| ---------- | ------     | -----------                     |
| user       | references | null: false,foreign_key: true   |
| item       | references | null: false,foreign_key: true   |



### Association


belongs_to :item 
belongs_to :user
has_one :address












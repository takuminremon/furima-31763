## users テーブル

| Column               | Type     | Options     |
| ----------           | ------   | ----------- |
| nickname             | string   | null: false |
| encrypted_password   | string   | null: false |
| email                | string   | null: false |
| first_name           | string   | null: false |
| first_name_kana      | string   | null: false |
| last_name            | string   | null: false |
| last_name_kana       | string   | null: false |
| birthday             | datetime | null: false |


### Association
has_many :items
has_many :purchases


## items テーブル

| Column           | Type         | Options                         |
| ------------     | ------       | -----------------------------   |
| items_name       | string       | null: false                     |
| explanation      | text         | null: false                     |
| category_id      | integer      | null: false                     |
| items_status_id  | integer      | null: false                     |
| delivery_fee_id  | integer      | null: false                     |
| area_id          | integer      | null: false                     |
| shipment_id      | integer      | null: false                     |
| price            | integer      | null: false                     |
| user             | references   | null: false,foreign_key: true   |




### Association

belongs_to :user
has_one:purchase 




## address テーブル

| Column       | Type       | Options                         |
| ----------   | ------     | -----------                     |
| postal_code  | string     | null: false                     |
| prefectures  | string     | null: false                     |
| municipality | string     | null: false                     |
| house number | string     | null: false                     |
| building     | text       |                                 |
| number       | integer    | null: false                     |
| purchase     | references | null: false,foreign_key: true   |


belongs_to :purchase



## purchase テーブル



| Column     | Type       | Options                         |
| ---------- | ------     | -----------                     |
| user       | references | null: false,foreign_key: true   |
| item       | references | null: false,foreign_key: true   |
|            |            |                                 |
|            |            |                                 |
|            |            |                                 |
|            |            |                                 |


### Association


belongs_to:item Table
belongs_to :user
has_one:address












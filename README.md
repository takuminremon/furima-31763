## users テーブル

| Column               | Type     | Options     |
| ----------           | ------   | ----------- |
| nickname             | string   | null: false |
| encrypted_password   | string   | null: false |
| email                | string   | null: false |
| First_name           | string   | null: false |
| First_name_kana      | string   | null: false |
| last_name            | string   | null: false |
| last_name_kana       | string   | null: false |
| Birthday             | datetime | null: false |


### Association
has_many :items
has_many :purchase


## items テーブル

| Column           | Type         | Options                         |
| ------------     | ------       | -----------------------------   |
| items_name       | string       | null: false                     |
| Explanation      | text         | null: false                     |
| category_id      | integer      | null: false                     |
| items_status_id  | integer      | null: false                     |
| Delivery_fee_id  | integer      | null: false                     |
| area_id          | integer      | null: false                     |
| shipment_id      | integer      | null: false                     |
| price            | integer      | null: false                     |
| user             | references   | null: false,foreign_key: true   |
| address          | references   | null: false,foreign_key: true   |



### Association

belongs_to :user
has_one:purchase Table




## address テーブル

| Column       | Type       | Options     |
| ----------   | ------     | ----------- |
| Postal_code  | string     | null: false |
| Prefectures  | string     | null: false |
| Municipality | string     | null: false |
| house number | string     | null: false |
| Building     | text       |             |
| number       | integer    | null: false |
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












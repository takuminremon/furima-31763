## users テーブル

| Column     | Type     | Options     |
| ---------- | ------   | ----------- |
| nickname   | string   | null: false |
| password   | string   | null: false |
| email      | string   | null: false |
| full_name  | string   | null: false |
| name_	kana | string   | null: false |
| Birthday   | datetime | null: false |


### Association
has_many :items
has_many :purchase


## items テーブル

| Column        | Type         | Options                         |
| ------------  | ------       | -----------------------------   |
| items_picture | string       | null: false                     |
| items_name    | string       | null: false                     |
| Explanation   | text         | null: false                     |
| category      | boolean      | null: false                     |
| items_status  | boolean      | null: false                     |
| Delivery_fee  | integer      | null: false                     |
| area          | string       | null: false                     |
| shipment      | datetime     | null: false                     |
| price         | integer      | null: false                     |
| user          | references   | null: false,foreign_key: true   |
| address       | references   | null: false,foreign_key: true   |



### Association

belongs_to :users
belongs_to ：address
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
| items        | references | null: false,foreign_key: true   |

### Association

has_many :items


## purchase テーブル



| Column     | Type       | Options                         |
| ---------- | ------     | -----------                     |
| user       | references | null: false,foreign_key: true   |
|            |            |                                 |
|            |            |                                 |
|            |            |                                 |
|            |            |                                 |
|            |            |                                 |


### Association


belongs_to:items Table
belongs_to :users













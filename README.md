
## usersテーブル
| column              | type   | options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name_kanji    | string | null: false               |
| last_name_kanji     | string | null: false               |
| first_name_kana     | string | null: false               |
| last_name_kana      | string | null: false               |
| birthday            | date   | null: false               |

### Association
- has_many :item
- has_many :buy

## itemsテーブル
| column              | type       | options     |
| ------------------- | ---------- | ----------- |
| image               |            |             |
| product_name        | text       | null: false |
| product_description | text       | null: false |
| category            | string     | null: false |
| status              | string     | null: false |
| delivery_charge     | string     | null: false |
| shipping_area       | string     | null: false |
| shipping_days       | string     | null: false |
| product_price       | integer    | null: false |
| user_id             | references |             |


### Association
- has_one :buy
- has_one :delivery
- belongs_to :users

## buysテーブル
| column                | type       | option      |
| --------------------- | ---------- | ----------- |
| user_id               | references |             |
| item_id               | references |             |
| delivery_id           | references |             |

### Association
- belongs_to :users
- belongs_to :items
- belongs_to :deliverys

## deliverysテーブル
| column        | type       | option      |
| ------------- | ---------- | ----------- |
| postal_code   | integer    | null: false |
| prefectures   | string     | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building_name | string     | null: false |
| tell          | integer    | null: false |
| user          | references |             |

### Association
- has_one :item
- has_one :buy
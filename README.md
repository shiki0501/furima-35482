
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
- has_many :items
- has_many :buys

## itemsテーブル
| column             | type       | options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| description        | text       | null: false       |
| category_id        | integer    | null: false       |
| status_id          | integer    | null: false       |
| delivery_charge_id | integer    | null: false       |
| shipping_area_id   | integer    | null: false       |
| shipping_day_id    | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |


### Association
- has_many :buys
- has_one :delivery
- belongs_to :user

## buysテーブル
| column             | type       | option            |
| ------------------ | ---------- | ----------------- |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliverysテーブル
| column        | type       | option            |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| shipping_area | string     | null: false       |
| municipality  | string     | null: false       |
| address       | string     | null: false       |
| building_name | string     |                   |
| tell          | string     | null: false       |
| buy           | references | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :buy
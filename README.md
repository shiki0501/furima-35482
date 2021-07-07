
## usersテーブル
| column              | type   | options     |
| ------------------- | ------ | ----------- |
| email               | string | null: false |
| password            | string | null: false |
| name                | string | null: false |
| name_check_kanji    | string | null: false |
| name_check_katakana | string | null: false |
| birthday            | string | null: false |

### Association
- has_many :item
- has_many :information

## itemsテーブル
| column              | type           | options     |
| ------------------- | -------------- | ----------- |
| image               |                |             |
| product_name        | text           | null: false |
| product_description | text           | null: false |
| product_price       | integer        | null: false |
| user                | references     |             |

### Association
- has_one :information
- belongs_to :users

## informationsテーブル
| column          | type       | option      |
| --------------- | ---------- | ----------- |
| category        | string     | null: false |
| status          | string     | null: false |
| delivery_charge | string     | null: false |
| shipping_area   | string     | null: false |
| shipping_days   | string     | null: false |
| user            | references |             |

### Association
- belongs_to :users
- has_many :item
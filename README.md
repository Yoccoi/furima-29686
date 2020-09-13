# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| last_name        | string  | null: false |
| first_name_kana  | string  | null: false |
| last_name_kana   | string  | null: false |
| birth_date       | integer | null: false |

### Association

- has_many :items
- has_many :transactions

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| content             | text       | null: false                    |
| image               | string     | null: false                    |
| category            | integer    | null: false                    |
| condition           | integer    | null: false                    |
| price               | integer    | null: false                    |
| shipping_fee        | integer    | null: false                    |
| shipping_from       | integer    | null: false                    |
| days_for_shipping   | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_one :transactions

## transactions テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item

## addresses テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| postal_code     | integer  | null: false |
| prefecture      | integer  | null: false |
| city            | string   | null: false |
| addresses       | string   | null: false |
| building        | string   | null: false |
| phone_number    | integer  | null: false |

### Association

- has_one :transactions

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |


### Association

- has_many :items
- has_many :orders

 ## items テーブル

| Column              | Type       | Options                        |
| ------              | ------     | -----------                    |
| title               | string     | null: false                    |
| contents            | text       | null: false                    |
| category_id         | integer    | null: false                    |
| product_status_id   | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| shipping_address_id | integer    | null: false                    |
| shipping_date_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - has_one :order

## orders テーブル

| Column     | Type          | Options                        |
| ------     |    ---------- | ------------------------------ |
| user       | references    | null: false, foreign_key: true |
| item       | references    | null: false, foreign_key: true |



### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresss テーブル

| Column             | Type      | Options                       |
| ------------------ | ------    | -------------------------     |
| post_code          | string    | null: false                   |
| shipping_charges_id| integer   | null: false                   |
| municipality       | string    | null: false                   |
| house_number       | string    | null: false                   |
| building_name      | string    |                               |
| pohne              | string    | null: false                   |
| order              | references| null: false foreign_key: true |

### Association
 - belongs_to :order
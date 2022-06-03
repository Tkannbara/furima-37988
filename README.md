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
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| birth_date         | deat   | null: false               |


### Association

- has_many :items
- has_many :orders

 ## items テーブル

| Column          | Type       | Options                        |
| ------          | ------     | -----------                    |
| title           | string     | null: false                    |
| contents        | string     | null: false                    |
| category        | text       | null: false                    |
| product_status  | string     | null: false                    |
| shipping_charges| string     | null: false                    |
| shipping_address| string     | null: false                    |
| shipping_date   | string     | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - has_many :orders

## orders テーブル

| Column     | Type          | Options                        |
| ------     |    ---------- | ------------------------------ |
| user       | references    | null: false, foreign_key: true |
| items      | references    | null: false, foreign_key: true |


### Association

- belongs_to :items
- belongs_to :user

## address テーブル

| Column             | Type      | Options                       |
| ------------------ | ------    | -------------------------     |
| post_code          | string    | null: false                   |
| prefecutures       | string    | null: false                   |
| municipality       | string    | null: false                   |
| house_number       | string    | null: false                   |
| building name      | string    | null: false                   |
| pohne              | string    | null: false                   |
| orders             | references| null: false foreign_key: true |

### Association
 - has_one :orders
# README
# アプリケーション名
  FURIMA(フリマ)

# アプリケーション概要	
  フリマアプリの模倣サイトです。  
  - ユーザーはログイン後、出品したい商品を自由に登録することができる。
  - 商品の詳細ページから購入画面に進み、商品の購入ができる。
  - 購入済みアイテムは「sold out」と表記される。

# URL	
https://furima-32483.herokuapp.com/

# ID/Pass
- ID: admin
- Pass: 2222

# テスト用アカウント
## 購入者用
- メールアドレス: buyer@gmail.com
- パスワード: buyer0123
- 購入用カード情報
- 番号：4242424242424242
- 期限：3月　31年
- セキュリティコード：0123
## 出品者用
- メールアドレス名: seller@gmail.com
- パスワード: seller0123

# 利用方法	
## 購入者
  - 新規登録/ログインページからログイン
  - トップページのピックアップカテゴリーから閲覧したい商品を選択
  - 商品の詳細画面で「購入画面に進む」をクリック
  - 購入内容の確認ページで必要事項を入力し「購入」
## 出品者
  - 新規登録/ログインページからログイン
  - 右下の「出品する」アイコンをクリック
  - 商品の情報入力画面で必要事項を入力し「出品する」

# 洗い出した要件	
## 出品機能
  ログイン済みユーザーが自由に出品アイテムの登録を行うことができる。
  - 出品ページを実装。画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格を登録できる。
  - 配送料の負担、発送元の地域、発送までの日数は、開発者側が予め設定しているものをプルダウンで選択ができる。
  - 販売価格を入力すると販売手数料 (10%)と販売利益が計算される。
## 購入機能
 ログイン済みユーザーが商品の購入を行うことができる。
 - クレジットカード登録機能(PayJP)

# 実装した機能についてのGIFと説明	

## ジャンル、アイテムの登録機能
  Gif 商品の出品登録 https://gyazo.com/da8fc7d3833f7afc68859b715650f743   
  Gif 商品の購入 https://gyazo.com/c96099a5ab93aa5ece1900ead4cd1193   

# ローカルでの動作方法	
  git cloneしてから、ローカルで動作をさせるまでに必要なコマンド  
  % bundle install  
  % rails db:create  
  % rails db:migrate  
  Ruby on Rails のバージョン 6.0.0

# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| kana_first         | string | null: false |
| kana_family        | string | null: false |
| birth              | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | -----------                    |
| name                 | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| delivery_fee_id      | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| day_to_delivery_id   | integer    | null: false                    |
| value                | integer    | null: false                    |
| user                 | references | null: false,foreign_key: true  | 

### Association

- belongs_to :user
- has_one :purchase 
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :day_to_delivery

## addresses テーブル

| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false,foreign_key: true  | 

### Association

- belongs_to :order

# orderテーブル

| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true | 
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :addresses
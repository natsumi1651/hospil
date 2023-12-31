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


## アプリケーション名    
「Hospil」  

## アプリケーション概要   
お子さんの急な体調不良や、保護者の方の急な都合により看護等が難しい場合の、往診、カウンセリング、看護サービスの予約ができる。  

## URL  
https://hospil-production.onrender.com  

## テスト用アカウント  
* Basic認証パスワード:admin  
* Basic認証ID:2222  
* メールアドレス:bbb@bbb
* パスワード:bbbbb11111  

## 利用方法
# 目標投稿
1.トップページのヘッダーにある新規登録ボタンで遷移し、個人情報を登録します。    
2.ヘッダーの予約ボタンからサービスの予約を行います。(件名・希望日時・カテゴリー・主訴・サービスを受ける時間の長さ・住所。画像は任意です。)  
3.マイページの詳細より詳しい情報と、コメント投稿ができます。  
4.マイページのサイドバーの変更ボタンから登録情報を変更できます。  
5.予約済みの内容をヘッダーの検索機能を使って探すことができます。  

## アプリケーションを作成した背景  
社会人になってからシングルマザーのスタッフと接し、さまざまな子育ての事情を聞いておりました。子供が病気になって看護が必要でも、面倒を見る人がいなくて急遽仕事を休まないといけないなどといった状況を見てきたため、仕事により休むことが難しい、あるいは諸事情があって子供の面倒が見られない保護者の方の手助けになるようなサービスがあれば、より子育てのしやすい環境づくりの一助になるのではと思い、アプリ開発をすることにしました。  


## 洗い出した要件  
# [要件定義書](https://docs.google.com/spreadsheets/d/191b_e7Fm_0Pu0dODteV2e4GFGKP3caCX1UrU228MJBk/edit#gid=1961489116)

実装した機能についての画像やGIFおよびその説明  
[![Image from Gyazo](https://i.gyazo.com/cab501114cf1c5d92543f3b9d51557f6.gif)](https://gyazo.com/cab501114cf1c5d92543f3b9d51557f6)  

[![Image from Gyazo](https://i.gyazo.com/2c188154be7de3b94c480c3a31cb08c0.gif)](https://gyazo.com/2c188154be7de3b94c480c3a31cb08c0)  

[![Image from Gyazo](https://i.gyazo.com/2dd1a82977ce105e98a1753c3cb28d23.gif)](https://gyazo.com/2dd1a82977ce105e98a1753c3cb28d23)  


## 実装予定の機能  
削除ボタンを押した際のWarningがポップアップで表示されるように実装する予定。  


## データベース設計  
[![Image from Gyazo](https://i.gyazo.com/30e92f9d8024e73ee283b3d20c738054.png)](https://gyazo.com/30e92f9d8024e73ee283b3d20c738054)
## 画面遷移図 
[![Image from Gyazo](https://i.gyazo.com/adb6ed7c4796df2b8038c8acc7bbef60.png)](https://gyazo.com/adb6ed7c4796df2b8038c8acc7bbef60)

## 開発環境  
* フロントエンド  
* バックエンド  
* インフラ  
* テキストエディタ  
* タスク管理  

## ローカルでの動作方法  
以下のコマンドを順に実行  
% git clone https://github.com/natsumi1651/hospil.git  
% cd xxxxxx  
% bundle install  
% yarn install  

## 工夫したポイント  
見やすさ重視のため、ブラウザに表示させる色を少なめに、シンプルな見栄えにしました。  
一目で使い方がわかるようにヘッダーに各機能のボタンを表示させました。  
マイページで最新の予約が一番上にきて、一目で確認できるように配置をいたしました。  

# テーブル設計

## usersテーブル
| Column              | Type           | Options                          |
| ------------------- | -------------- | -------------------------------- |
| nickname            | string         | null: false                      |
| email               | string         | null: false, unique: true        |
| encrypted_password  | string         | null: false                      |
| sir_name            | string         | null: false                      |
| first_name          | string         | null: false                      |
| phone_number        | string         | null: false                      |
| address             | text           | null: false                      |

### Association
- has_many :requests
- has_many :likes

## requestsテーブル
| Column              | Type            | Options                          |
| ------------------- | --------------- | -------------------------------- |
| title               | string          | null: false                      |
| date                | string          | null: false                      |
| description         | text            | null: false                      |
| category_id         | integer         | null: false                      |
| expected_length     | string          | null: false                      |
| expected_place      | text            | null: false                      |
| user_id             | references      | null: false, foreign_key: true   |

### Association
- belongs_to :user
- has_many :comments
- has_many :likes

## commentsテーブル
| Column              | Type            | Options                          |
| ------------------- | --------------- | -------------------------------- |
| text                | text            | null: false                      |
| request_id          | text            | null: false, foreign_key: true   |
| user_id             | references      | null: false, foreign_key: true   |

- belongs_to :request

## likesテーブル
| Column              | Type            | Options                          |
| ------------------- | --------------- | -------------------------------- |
| request_id          | text            | null: false, foreign_key: true   |
| user_id             | references      | null: false, foreign_key: true   |

- belongs_to :user
- belongs_to :request

## questionテーブル
| Column              | Type            | Options                          |
| ------------------- | --------------- | -------------------------------- |

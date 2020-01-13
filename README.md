# Post_Movie
<img width="1431" alt="1b18d028d99502893c99199a5049bb4f" src="https://user-images.githubusercontent.com/56996571/72153377-2ccd2c00-33f1-11ea-9a55-9328f0f6e5f4.png">


・「Post_Movie」は、動画の投稿、視聴、コメント機能を搭載したアプリケーションです。

 
# Background

・スクールで学んだ知識復習も兼ねて今まで作成したアプリの機能を最大限実装したアプリケーションの作成をしたいと思った。
また、その際に何点か独学で勉強した要素を加えて知識の向上に務めた。


 
# Features
 
・スクールでは理解が不十分だったajaxを利用することによって、コメントの非同期通信可能としている。
・スクールでは画像投稿までしか学習していなかったので新たに動画投稿を取り入れた。
・勉強のためapiに触れてみたいと考え、youtube apiを利用してyoutubeの動画検索できるようにした。

# Test
・ユーザー登録、コメントの投稿、動画の投稿のバリデーションに関してテストを行なった。


例

    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end


    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
 
# Feature
・お気に入り動画のブックマーク機能
・コメントの自動更新機能

 
# Function
 ・ユーザー登録機能
 ・動画投稿機能
 ・動画視聴機能
 ・コメント投稿機能
 ・コメント非同期通信機能
 ・マイページ機能
 ・動画検索機能
 ・youtube api よるyoutube内動画検索機能
 
# DB設計

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|     
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :comments
- has_many :movies

## Moviesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|     
|descriptioin|string|null: false, unique: true|
|image|string|null: false|
|video|string|null: false|
|user_id|references|null: false, foreign_key: true|


### Association
- has_many :comments
- belongs_to :user


## Moviesテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|     
|user_id|references|null: false, foreign_key: true|
|movie_id|references|null: false, foreign_key: true|


### Association
- belongs_to :movie
- belongs_to :user







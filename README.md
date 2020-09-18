## README

# 農産物販売サイト
<img width="1439" alt="スクリーンショット 2020-08-27 11 40 31" src="https://user-images.githubusercontent.com/58016658/92447030-b0921f00-f1f1-11ea-87f3-0f0fff6b0478.png">

## 概要
全国の農家が収穫した農産物ネット上で販売し、販売された作物を消費者は当サイトから購入できる。

## コンセプト
全国の農産物と消費者をつなぐプラットフォーム

## バージョン
Ruby 2.6.5 Rails 5.2.4.3

## 機能一覧
- [ ] ユーザー、生産者登録機能
  - [ ] メールアドレス、名前、パスワードは必須
- [ ] ログイン機能
- [ ] チャット一覧表示機能
- [ ] チャット投稿機能
- [ ] プロフィール機能
- [ ] 生産品一覧表示機能
- [ ] 生産品掲載機能
- [ ] 掲載された生産品の編集、削除機能(管理者のみ)
- [ ] コメント投稿機能
- [ ] ラベル機能
- [ ] 決済機能
- [ ] お気に入り機能

## サービス構成図
![サービス構成図](https://user-images.githubusercontent.com/58016658/92571063-9b82c200-f2bd-11ea-8f37-8f94a5ff3e85.png)

## 当サービスについて

### 作成動機
昨今のコロナ禍で生じた飲食店や宿泊事業者の自粛に伴い、農家の方々が本来やりとりしていた顧客に農作物を買ってもらえない現状がありました。

そのため、もし「農家と消費者を結ぶプラットフォームサービス」があれば、農家の方が作った作物を「買ってもらえる」&「知ってもらえる」だけでなく、仲介業者&組織が入らないため、安価で品質が良い作物を消費者に届けることができると考え、作成致しました。

## ポートフォリオとしての見所
- クレジットカード登録、決済機能(RESTをベースに構成された決済APIを使用)
- お気に入り機能を用いることで自分が気になる商品を一覧化
- 誰が作った商品なのかがプロフィール画像を見てわかる。
- Rspecによるテスト
- AWSを用いたデプロイ
- docker cicleciの使用（予定)

## カタログ設計
https://docs.google.com/spreadsheets/d/1Tz_Ed3fgBlzcLpB4qteM9LdzfzXaLfVlnxdeILv1t2Q/edit#gid=0

## テーブル定義
https://docs.google.com/spreadsheets/d/1q_dwfa1uvklDVA2erMZ-tM1SEunCZUNX7UBlcs3MY04/edit#gid=0

## 画面遷移図
https://docs.google.com/spreadsheets/d/1NyCRu6jG3Vt-kRJba_fFej_veoWkOmEmKGzPIGrCtPs/edit#gid=0

## ER図
https://app.diagrams.net/?lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=ER%E5%9B%B3%20-%20%E5%8D%92%E6%A5%AD%E8%AA%B2%E9%A1%8C#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D1q1Yh5bU71LcGzU4W8DLCOJla4mpd2sxY%26export%3Ddownload

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1X4LX03Ajx_KTAyTvavfhTM_5IXZvFNf2MwNt-RiKjXc/edit#gid=0

## 使用予定Gem
- devise
- cancancan
- payjp
- kaminari
- letter_opener_web

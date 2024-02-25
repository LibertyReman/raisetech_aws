## 課題
1. 組み込みサーバーでデプロイ<br>
    起動プロセスの確認
    ![](img/lec5/1-1.png)
    RDS接続設定
    ![](img/lec5/1-2.png)
    ブラウザでアプリページアクセス確認
    ![](img/lec5/1-3.png)
1. Webサーバー(Nginx)とAPサーバー(Unicorn)でデプロイ<br>
    Nginxの設定
    ![](img/lec5/2-1.png)
    Nginxの起動
    ![](img/lec5/2-2.png)
    Unicornの起動
    ![](img/lec5/2-3.png)
    ブラウザでアプリページアクセス確認
    ![](img/lec5/2-4.png)
1. ELB (ALB)の追加<br>
    ターゲットグループの作成
    ![](img/lec5/3-1.png)
    ELB (ALB)の作成
    ![](img/lec5/3-2.png)
    ロードバランサーのDNS名でブラウザでアプリページアクセス確認
    ![](img/lec5/3-3.png)
    ロードバランサーのDNS名を追加しRailsアプリを再起動
    ![](img/lec5/3-4.png)
    ロードバランサーのDNS名でブラウザでアプリページアクセス確認
    ![](img/lec5/3-5.png)
1. S3の追加<br>
    バケットの作成
    ![](img/lec5/4-1.png)
    S3の設定
    ![](img/lec5/4-2.png)
    Unicornの再起動
    ![](img/lec5/4-3.png)
    アプリから画像を追加
    ![](img/lec5/4-4.png)
    S3にデータが追加されたことを確認
    ![](img/lec5/4-5.png)
1. 構成図<br>
    ![](img/lec5/5-1.png)
---

## 学んだこと
- ELB,RDS,S3の使い方や構成図の書き方を学んだ

## 感想
- Railsの環境構築が難しかった<br>
    具体的には`$ bundler -v`で指定したバージョンに切り替わらず手間取った<br>
    `/home/ec2-user/.rbenv/versions/3.1.2/lib/ruby/site_ruby/3.1.0/bundler/version.rb`のVERSIONを直接書き換えたら治った

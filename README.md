# Issue Maker
GitHubのIssueページを自ら作ってみることによって、様々な機能を身に付ける

## Technologies
* Vagrant 2.2.5
* PuTTY 0.70
* Linux(Centos7)
* Samba 4.8.3
* Bootstrap 4
* JSP 2.3
* Gradle 5.4.1
* Spring Boot 2.1.4
* Java 1.8.0
* MySql 5.7.27
* Mybatis 3.5.0

## General info
Issue Makerはユーザー登録、Issue作成、Label作成の機能を作る予定です

## Features
* 開発環境に関して
  * Vagrantで仮想機械を構築
  * PuTTYを活用してLinuxにSSH接続
  * Sambaでファイル共有を利用した開発環境セッティング
  * GitHubでコードのバージョンを管理
    * .gitignoreでいらないコードは挙げないようにする
    * pull request作成　そして、チーム員とのレビュー
  * Gradleでビルド自動化
* プログラミングに関して
  * ユーザー
    * Spring Boot Securityでログイン機能を動作させる
    * 暗証番号を暗号化
    * ユーザー登録をする場合、validationで文字の長さや空欄を検査
    * custom validationでメールとネームの重複チェック機能を実装
  
## Screenshots
* ユーザー登録をする時のvalidationチェック
  ![](https://github.com/crane93/YURI/blob/gif-test/gif/signUp_test1.gif)
* パスワード再入力が間違った場合
  ![](https://github.com/crane93/YURI/blob/gif-test/gif/signUp_test2.gif)
* ログイン  
  ![](https://github.com/crane93/YURI/blob/gif-test/gif/signUp_test3.gif)
* 既にあるメールとネームで登録をする場合
  ![](https://github.com/crane93/YURI/blob/gif-test/gif/signUp_test4.gif)

## Status
Project is: _作業中_

## Inspiration
GitHubのIssue部分を参考して開発している

## Contact
Created by [@Yuri KIM](https://github.com/crane93) - ご自由にご連絡ください

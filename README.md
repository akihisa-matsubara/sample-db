# sample-db
サンプルアプリで利用するDB資材です。  

## 環境情報
1. DB2
    - Version: 11.1
    - DB名: MYDB
    - スキーマ名: MYSCHEMA
1. DBAユーザー
    - db2admin

## 利用技術
| OSS/Plugin | Version |
| ------ | ------- |
| flyway | 5.2.4 |
| ERMaster | 1.0.0.v20150619-0219 |

## 環境構築
※実行にはMavenおよびEclipseが必要です

1. DBAユーザーに切り替えます  
`toold/db/00-switch-db2admin.bat` を実行
1. `MYDB` を作成します  
`toold/db/01-create-database.bat` を実行
1. `MYSCHEMA` スキーマを作成します  
`toold/db/02-create-schema.bat` を実行
1. DBを最新バージョンにマイグレーションします  
EclipseからMaven実行構成 `sample-flyway-migrate` を実行

※DBのバージョンを確認したい場合 `sample-flyway-info` を実行  
※DBを初期化したい場合 `sample-flyway-clean` を実行  

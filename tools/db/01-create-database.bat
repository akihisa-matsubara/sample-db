rem 一覧
db2 LIST DATABASE DIRECTORY ON C:

rem 再設定
rem db2 CATALOG DATABASE MYDB ON C:

rem 削除
rem db2 DROP DATABASE MYDB

rem 作成
db2 CREATE DATABASE MYDB ON C: USING CODESET UTF-8 TERRITORY JP COLLATE USING IDENTITY

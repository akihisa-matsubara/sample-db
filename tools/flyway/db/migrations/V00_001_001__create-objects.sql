
/* Drop Tables */

-- DROP TABLE M_AUTH;
-- DROP TABLE M_POST_CODE;
-- DROP TABLE M_SYSTEM_DATE;
-- DROP TABLE M_USER;
-- DROP TABLE T_CUSTOMER_FAMILY_RELATION;
-- DROP TABLE T_CUSTOMER;
-- DROP TABLE T_FAMILY;
-- DROP TABLE T_ONETIME_TOKEN;



/* Drop Sequences */

-- DROP SEQUENCE SEQ_CUSTOMER_NO;




/* Create Sequences */

CREATE SEQUENCE ${schemaName}.SEQ_CUSTOMER_NO AS INTEGER INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999 START WITH 1 CYCLE NOCACHE;



/* Create Tables */

-- 認証マスタ
CREATE TABLE ${schemaName}.M_AUTH
(
	-- ユーザー管理番号
	USER_MNG_NO varchar(18) NOT NULL,
	-- ログインパスワード
	LOGIN_PASSWORD varchar(100),
	-- ログイン失敗回数
	LOGIN_FAILED_COUNT int,
	-- アカウントロックフラグ
	ACCOUNT_LOCK_FLAG char(1),
	-- アカウントロック日時
	ACCOUNT_LOCK_DATE timestamp,
	-- パスワード前回更新日時
	PASSWORD_LAST_UPDATED_DATE timestamp,
	-- バージョン
	VERSION int DEFAULT 1 NOT NULL,
	-- 作成ユーザーID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 作成日時
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- 更新ユーザーID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 更新日時
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (USER_MNG_NO)
);


-- 郵便番号マスタ
CREATE TABLE ${schemaName}.M_POST_CODE
(
	-- 郵便番号
	POST_CODE char(7) NOT NULL,
	-- 都道府県名
	PREFECTURE_NAME varchar(60),
	-- 市区町村名
	CITY_NAME varchar(60),
	-- 町域名
	TOWN_NAME varchar(60),
	-- バージョン
	VERSION int DEFAULT 1 NOT NULL,
	-- 作成ユーザーID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 作成日時
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- 更新ユーザーID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 更新日時
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL
);


-- システム日付マスタ
CREATE TABLE ${schemaName}.M_SYSTEM_DATE
(
	-- システム日付
	SYSTEM_DATE date NOT NULL,
	-- バージョン
	VERSION int DEFAULT 1 NOT NULL,
	-- 作成ユーザーID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 作成日時
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- 更新ユーザーID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 更新日時
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL
);


-- ユーザーマスタ
CREATE TABLE ${schemaName}.M_USER
(
	-- ユーザー管理番号
	USER_MNG_NO varchar(18) NOT NULL,
	-- ユーザー登録日時
	USER_REGISTRATION_DATE date,
	-- 氏名漢字
	NAME_KANJI varchar(60),
	-- メール
	EMAIL varchar(100),
	-- バージョン
	VERSION int DEFAULT 1 NOT NULL,
	-- 作成ユーザーID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 作成日時
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- 更新ユーザーID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 更新日時
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (USER_MNG_NO)
);


-- 顧客
CREATE TABLE ${schemaName}.T_CUSTOMER
(
	-- 顧客番号
	CUSTOMER_NO char(8) NOT NULL,
	-- 氏名漢字
	NAME_KANJI varchar(60) NOT NULL,
	-- 氏名カナ
	NAME_KANA varchar(60) NOT NULL,
	-- 性別
	GENDER char(1) NOT NULL,
	-- 生年月日
	BIRTHDAY date NOT NULL,
	-- 郵便番号
	ADDRESS_ZIP varchar(7) NOT NULL,
	-- 住所
	ADDRESS varchar(200) NOT NULL,
	-- バージョン
	VERSION int DEFAULT 1 NOT NULL,
	-- 作成ユーザーID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 作成日時
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- 更新ユーザーID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 更新日時
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (CUSTOMER_NO)
);


-- 顧客家族関連
CREATE TABLE ${schemaName}.T_CUSTOMER_FAMILY_RELATION
(
	-- 顧客番号
	CUSTOMER_NO char(8) NOT NULL,
	-- 家族番号
	FAMILY_NO char(8) NOT NULL,
	-- バージョン
	VERSION int DEFAULT 1 NOT NULL,
	-- 作成ユーザーID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 作成日時
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- 更新ユーザーID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 更新日時
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (CUSTOMER_NO, FAMILY_NO)
);


-- 家族
CREATE TABLE ${schemaName}.T_FAMILY
(
	-- 家族番号
	FAMILY_NO char(8) NOT NULL,
	-- 氏名漢字
	NAME_KANJI varchar(60) NOT NULL,
	-- 氏名カナ
	NAME_KANA varchar(60) NOT NULL,
	-- 性別
	GENDER char(1) NOT NULL,
	-- 生年月日
	BIRTHDAY date NOT NULL,
	-- バージョン
	VERSION int DEFAULT 1 NOT NULL,
	-- 作成ユーザーID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 作成日時
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- 更新ユーザーID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 更新日時
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (FAMILY_NO)
);


-- ワンタイムトークン
CREATE TABLE ${schemaName}.T_ONETIME_TOKEN
(
	-- ワンタイムトークン
	ONETIME_TOKEN varchar(200) NOT NULL,
	-- ユーザー管理番号
	USER_MNG_NO varchar(18),
	-- ワンタイムトークン発行日時
	ONETIME_TOKEN_PUBLISH_DATE date,
	-- ワンタイムトークンステータス
	ONETIME_TOKEN_STATUS char(1),
	-- バージョン
	VERSION int DEFAULT 1 NOT NULL,
	-- 作成ユーザーID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 作成日時
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- 更新ユーザーID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- 更新日時
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (ONETIME_TOKEN)
);



/* Create Foreign Keys */

ALTER TABLE ${schemaName}.M_AUTH
	ADD CONSTRAINT M_AUTH_FK1 FOREIGN KEY (USER_MNG_NO)
	REFERENCES M_USER (USER_MNG_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE ${schemaName}.T_CUSTOMER_FAMILY_RELATION
	ADD CONSTRAINT T_CUSTOMER_FAMILY_RELATION_FK1 FOREIGN KEY (CUSTOMER_NO)
	REFERENCES T_CUSTOMER (CUSTOMER_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE ${schemaName}.T_CUSTOMER_FAMILY_RELATION
	ADD CONSTRAINT T_CUSTOMER_FAMILY_RELATION_FK2 FOREIGN KEY (FAMILY_NO)
	REFERENCES T_FAMILY (FAMILY_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;




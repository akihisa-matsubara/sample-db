
/* Drop Tables */

DROP TABLE M_AUTH;
DROP TABLE M_DEVICE;
DROP TABLE M_POST_CODE;
DROP TABLE M_SYSTEM_DATE;
DROP TABLE T_USER_OPERATION_LOG;
DROP TABLE M_USER;
DROP TABLE T_CUSTOMER_FAMILY_RELATION;
DROP TABLE T_CUSTOMER;
DROP TABLE T_FAMILY;
DROP TABLE T_ONETIME_TOKEN;



/* Drop Sequences */

DROP SEQUENCE SEQ_CUSTOMER_NO;




/* Create Sequences */

CREATE SEQUENCE SEQ_CUSTOMER_NO AS INTEGER INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999 START WITH 1 CYCLE NOCACHE;



/* Create Tables */

-- �F�؃}�X�^
CREATE TABLE M_AUTH
(
	-- ���[�U�[�Ǘ��ԍ�
	USER_MNG_NO varchar(18) NOT NULL,
	-- ���O�C���p�X���[�h
	LOGIN_PASSWORD varchar(100),
	-- ���O�C�����s��
	LOGIN_FAILED_COUNT int,
	-- �A�J�E���g���b�N�t���O
	ACCOUNT_LOCK_FLAG char(1),
	-- �A�J�E���g���b�N����
	ACCOUNT_LOCK_DATE timestamp,
	-- �p�X���[�h�O��X�V����
	PASSWORD_LAST_UPDATED_DATE timestamp,
	-- �o�[�W����
	VERSION int DEFAULT 1 NOT NULL,
	-- �쐬���[�U�[ID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �쐬����
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- �X�V���[�U�[ID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �X�V����
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (USER_MNG_NO)
);


-- �[���}�X�^
CREATE TABLE M_DEVICE
(
	-- ���[�U�[�Ǘ��ԍ�
	USER_MNG_NO varchar(18) NOT NULL,
	-- �[��ID
	DEVICE_ID varchar(200) NOT NULL,
	-- ���O�C���F�؃g�[�N��
	AUTH_TOKEN varchar(500),
	-- ���O�C���F�؃g�[�N�����s����
	AUTH_TOKEN_PUBLISH_DATE timestamp,
	-- �ŏI��������
	LAST_SYNC_DATE timestamp,
	-- �v�b�V���ʒm�g�[�N��
	PUSH_DEVICE_TOKEN varchar(512),
	-- �[�����b�N�t���O
	DEVICE_LOCK_FLAG char(1) DEFAULT 'N' NOT NULL,
	-- �o�[�W����
	VERSION int DEFAULT 1 NOT NULL,
	-- �쐬���[�U�[ID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �쐬����
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- �X�V���[�U�[ID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �X�V����
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (USER_MNG_NO, DEVICE_ID)
);


-- �X�֔ԍ��}�X�^
CREATE TABLE M_POST_CODE
(
	-- �X�֔ԍ�
	POST_CODE char(7) NOT NULL,
	-- �s���{����
	PREFECTURE_NAME varchar(60),
	-- �s�撬����
	CITY_NAME varchar(60),
	-- ���於
	TOWN_NAME varchar(60),
	-- �o�[�W����
	VERSION int DEFAULT 1 NOT NULL,
	-- �쐬���[�U�[ID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �쐬����
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- �X�V���[�U�[ID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �X�V����
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL
);


-- �V�X�e�����t�}�X�^
CREATE TABLE M_SYSTEM_DATE
(
	-- �V�X�e�����t
	SYSTEM_DATE date NOT NULL,
	-- �o�[�W����
	VERSION int DEFAULT 1 NOT NULL,
	-- �쐬���[�U�[ID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �쐬����
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- �X�V���[�U�[ID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �X�V����
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL
);


-- ���[�U�[�}�X�^
CREATE TABLE M_USER
(
	-- ���[�U�[�Ǘ��ԍ�
	USER_MNG_NO varchar(18) NOT NULL,
	-- ���[�U�[�o�^����
	USER_REGISTRATION_DATE date,
	-- ��������
	NAME_KANJI varchar(60),
	-- ���[��
	EMAIL varchar(100),
	-- �o�[�W����
	VERSION int DEFAULT 1 NOT NULL,
	-- �쐬���[�U�[ID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �쐬����
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- �X�V���[�U�[ID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �X�V����
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (USER_MNG_NO)
);


-- �ڋq
CREATE TABLE T_CUSTOMER
(
	-- �ڋq�ԍ�
	CUSTOMER_NO char(8) NOT NULL,
	-- ��������
	NAME_KANJI varchar(60) NOT NULL,
	-- �����J�i
	NAME_KANA varchar(60) NOT NULL,
	-- ����
	GENDER char(1) NOT NULL,
	-- ���N����
	BIRTHDAY date NOT NULL,
	-- �d�b�ԍ�
	TEL_NO varchar(11),
	-- �X�֔ԍ�
	ADDRESS_ZIP varchar(7) NOT NULL,
	-- �Z��
	ADDRESS varchar(200) NOT NULL,
	-- E���[��
	EMAIL varchar(100),
	-- �o�[�W����
	VERSION int DEFAULT 1 NOT NULL,
	-- �쐬���[�U�[ID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �쐬����
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- �X�V���[�U�[ID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �X�V����
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (CUSTOMER_NO)
);


-- �ڋq�Ƒ��֘A
CREATE TABLE T_CUSTOMER_FAMILY_RELATION
(
	-- �ڋq�ԍ�
	CUSTOMER_NO char(8) NOT NULL,
	-- �Ƒ��ԍ�
	FAMILY_NO char(8) NOT NULL,
	-- �o�[�W����
	VERSION int DEFAULT 1 NOT NULL,
	-- �쐬���[�U�[ID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �쐬����
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- �X�V���[�U�[ID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �X�V����
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (CUSTOMER_NO, FAMILY_NO)
);


-- �Ƒ�
CREATE TABLE T_FAMILY
(
	-- �Ƒ��ԍ�
	FAMILY_NO char(8) NOT NULL,
	-- ��������
	NAME_KANJI varchar(60) NOT NULL,
	-- �����J�i
	NAME_KANA varchar(60) NOT NULL,
	-- ����
	RELATIONSHIP char(1),
	-- ����
	GENDER char(1) NOT NULL,
	-- ���N����
	BIRTHDAY date NOT NULL,
	-- �o�[�W����
	VERSION int DEFAULT 1 NOT NULL,
	-- �쐬���[�U�[ID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �쐬����
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- �X�V���[�U�[ID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �X�V����
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (FAMILY_NO)
);


-- �����^�C���g�[�N��
CREATE TABLE T_ONETIME_TOKEN
(
	-- �����^�C���g�[�N��
	ONETIME_TOKEN varchar(200) NOT NULL,
	-- ���[�U�[�Ǘ��ԍ�
	USER_MNG_NO varchar(18),
	-- �����^�C���g�[�N�����s����
	ONETIME_TOKEN_PUBLISH_DATE date,
	-- �����^�C���g�[�N���X�e�[�^�X
	ONETIME_TOKEN_STATUS char(1),
	-- �o�[�W����
	VERSION int DEFAULT 1 NOT NULL,
	-- �쐬���[�U�[ID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �쐬����
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- �X�V���[�U�[ID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �X�V����
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (ONETIME_TOKEN)
);


-- ���샍�O
CREATE TABLE T_USER_OPERATION_LOG
(
	-- ���샍�OID
	OPERATION_LOG_ID int NOT NULL,
	-- ���[�U�[�Ǘ��ԍ�
	USER_MNG_NO varchar(18) NOT NULL,
	-- �[��ID
	DEVICE_ID varchar(200) NOT NULL,
	-- �L�^��
	RECORDING_DATE timestamp NOT NULL,
	-- �@�\��
	FUNCTION_NAME varchar(100) NOT NULL,
	-- ��ʖ�
	SCREEN_NAME varchar(100) NOT NULL,
	-- �I�u�W�F�N�g��
	OBJECT_NAME varchar(100),
	-- �C�x���g���
	EVENT_TYPE char(2) NOT NULL,
	-- �C�x���g�l
	EVENT_VALUE varchar(1024),
	-- �o�[�W����
	VERSION int DEFAULT 1 NOT NULL,
	-- �쐬���[�U�[ID
	CREATION_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �쐬����
	CREATION_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	-- �X�V���[�U�[ID
	UPDATED_USER_ID varchar(20) DEFAULT '' NOT NULL,
	-- �X�V����
	UPDATED_DATE timestamp DEFAULT CURRENT TIMESTAMP NOT NULL,
	PRIMARY KEY (OPERATION_LOG_ID)
);



/* Create Foreign Keys */

ALTER TABLE M_AUTH
	ADD CONSTRAINT M_AUTH_FK1 FOREIGN KEY (USER_MNG_NO)
	REFERENCES M_USER (USER_MNG_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE M_DEVICE
	ADD FOREIGN KEY (USER_MNG_NO)
	REFERENCES M_USER (USER_MNG_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE T_USER_OPERATION_LOG
	ADD FOREIGN KEY (USER_MNG_NO)
	REFERENCES M_USER (USER_MNG_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE T_CUSTOMER_FAMILY_RELATION
	ADD CONSTRAINT T_CUSTOMER_FAMILY_RELATION_FK1 FOREIGN KEY (CUSTOMER_NO)
	REFERENCES T_CUSTOMER (CUSTOMER_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE T_CUSTOMER_FAMILY_RELATION
	ADD CONSTRAINT T_CUSTOMER_FAMILY_RELATION_FK2 FOREIGN KEY (FAMILY_NO)
	REFERENCES T_FAMILY (FAMILY_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;




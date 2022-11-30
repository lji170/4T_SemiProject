-- [4] 업로드, 첨부 게시판
-- 시퀸스 테이블
DROP SEQUENCE ATTACH_SEQ;
DROP SEQUENCE UPLOAD_SEQ;
CREATE SEQUENCE UPLOAD_SEQ NOCACHE;
CREATE SEQUENCE ATTACH_SEQ NOCACHE;

DROP SEQUENCE BLOG_SEQ;
DROP SEQUENCE COMMENTS_SEQ;
CREATE SEQUENCE BLOG_SEQ NOCACHE;
CREATE SEQUENCE COMMENTS_SEQ NOCACHE;


-- 업로드 테이블
DROP TABLE UPLOAD CASCADE CONSTRAINTS;
CREATE TABLE UPLOAD (
	UPLOAD_NO	            NUMBER	            NOT NULL,
	ID	                    VARCHAR2(30 BYTE)	NOT NULL,
	UPLOAD_TITLE	        VARCHAR2(100 BYTE)	NULL,
	UPLOAD_CONTENT	        VARCHAR2(100 BYTE)	NULL,
	UPLOAD_CREATE_DATE	    DATE	            NULL,
	UPLOAD_LAST_MODIFY_DATE	DATE	            NULL,
	UPLOAD_HIT	            NUMBER	            NULL,
	IP	                    VARCHAR2(30 BYTE)	NULL
);

-- 첨부파일 테이블
DROP TABLE ATTACH CASCADE CONSTRAINTS;
CREATE TABLE ATTACH (
	ATTACH_NO	            NUMBER	            NOT NULL,
	UPLOAD_NO	            NUMBER	            NOT NULL,
	ORIGIN	                VARCHAR2(300 BYTE)	NULL,
	FILESYSTEM	            VARCHAR2(40 BYTE)	NULL,
	DOWNLOAD_CNT	            NUMBER	            NULL,
	PATH	                VARCHAR2(300 BYTE)	NULL
);

-- 기본키
-- * PK 이름 : PK_자기테이블 PRIMARY KEY(PK칼럼명);
-- 1. 업로드 pk
ALTER TABLE UPLOAD ADD CONSTRAINT PK_UPLOAD PRIMARY KEY(UPLOAD_NO);

-- 2. 첨부파일 pk
ALTER TABLE ATTACH ADD CONSTRAINT PK_ATTACH PRIMARY KEY(ATTACH_NO);

-- 외래키
-- * FK 이름 : FK_자기테이블_PK가 있는테이블 FOREIGH KEY(FK칼럼명) REFERENCES PK테이블(PK칼럼명);

-- 1. 업로드 fk 
ALTER TABLE UPLOAD ADD CONSTRAINT FK_UPLOAD_USERS FOREIGN KEY(ID)
    REFERENCES USERS(ID);
-- 2. 첨부파일 fk 
ALTER TABLE ATTACH ADD CONSTRAINT FK_ATTACH_USERS FOREIGN KEY(UPLOAD_NO)
    REFERENCES UPLOAD(UPLOAD_NO);


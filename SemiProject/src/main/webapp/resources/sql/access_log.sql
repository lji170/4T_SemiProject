DROP SEQUENCE ACCESS_LOG_SEQ;
CREATE SEQUENCE ACCESS_LOG_SEQ NOCACHE;


DROP TABLE ACCESS_LOG;

CREATE TABLE ACCESS_LOG (
    ID	VARCHAR2(45 BYTE)	NOT NULL UNIQUE,
	ACCESS_LOG_NO	NUMBER	NOT NULL,
	LAST_LOGIN_DATE	DATE	NULL
);

ALTER TABLE ACCESS_LOG ADD CONSTRAINT FK_USERS_ACCESS_LOG FOREIGN KEY (ID) REFERENCES USERS (ID) ON DELETE CASCADE;
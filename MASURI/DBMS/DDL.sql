CREATE TABLE userdata -- 일반유저정보
(
    N_NUM         INT             NOT NULL, -- 일반유저 식별번호
    N_ID          VARCHAR2(30)    NOT NULL, -- 일반유저 아이디
    N_PASSWORD    VARCHAR2(30)    NOT NULL, -- 일반유저 비밀번호
    N_NAME        VARCHAR2(20)    NOT NULL, -- 일반유저 이름
    N_PHONE       VARCHAR2(30)    NOT NULL UNIQUE, -- 일반유저 전화번호
    N_EMAIL       VARCHAR2(40)    NOT NULL UNIQUE, -- 일반유저 이메일
    N_BLACK       VARCHAR2(5)     NOT NULL, -- 일반유저 블랙리스트 여부 (true ,false)
    CONSTRAINT USERDATA_PK PRIMARY KEY (N_ID)
)


CREATE SEQUENCE userdata_SEQ -- u_num 생성 시퀸스
START WITH 1
INCREMENT BY 1;

--DROP SEQUENCE userdata_SEQ;


COMMENT ON TABLE userdata IS '일반유저정보' ;


COMMENT ON COLUMN userdata.N_NUM IS '일반회원 식별번호';


COMMENT ON COLUMN userdata.N_ID IS '일반회원 아이디';


COMMENT ON COLUMN userdata.N_PASSWORD IS '일반회원 비밀번호';


COMMENT ON COLUMN userdata.N_NAME IS '일반회원 이름';


COMMENT ON COLUMN userdata.N_PHONE IS '일반회원 전화번호';


COMMENT ON COLUMN userdata.N_EMAIL IS '일반회원 이메일';


COMMENT ON COLUMN userdata.N_BLACK IS '블랙리스트 여부';
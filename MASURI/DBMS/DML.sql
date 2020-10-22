--일반 insert문
INSERT INTO USERDATA (USERNUM, ID, PASSWORD, NAME, PHONE, EMAIL, BLACK) VALUES (USERDATA_SEQ.nextval,'test01', '1234', 'test1', '01000000000', 'masuri1021@gmail.com', 'false');
INSERT INTO USERDATA (USERNUM, ID, PASSWORD, NAME, PHONE, EMAIL, BLACK) VALUES (USERDATA_SEQ.nextval,'test02', '1234', 'test2', '01000000000', 'masuri1021-2@gmail.com', 'false');
INSERT INTO USERDATA (USERNUM, ID, PASSWORD, NAME, PHONE, EMAIL, BLACK) VALUES (USERDATA_SEQ.nextval,'test03', '1234', 'test3', '01000000000', 'masuri1021-3@gmail.com', 'false');
INSERT INTO USERDATA (USERNUM, ID, PASSWORD, NAME, PHONE, EMAIL, BLACK) VALUES (USERDATA_SEQ.nextval,'test04', '1234', 'test4', '01000000000', 'masuri1021-4@gmail.com', 'false');
INSERT INTO USERDATA (USERNUM, ID, PASSWORD, NAME, PHONE, EMAIL, BLACK) VALUES (USERDATA_SEQ.nextval,'test05', '1234', 'test5', '01000000000', 'masuri1021-5@gmail.com', 'false');

INSERT INTO FAQ (NUM, QUESTION, ANSWER) VALUES (FAQ_SEQ.nextval,'서비스의 안내는 어떻게 볼수 있나요?', '상단에 있는 네비게이션바에서 해당서비스 안내페이지로 이동할수 있습니다.');
INSERT INTO FAQ (NUM, QUESTION, ANSWER) VALUES (FAQ_SEQ.nextval,'서비스의 안내는 어떻게 볼수 있나요?-2', '상단에 있는 네비게이션바에서 해당서비스 안내페이지로 이동할수 있습니다.');
INSERT INTO FAQ (NUM, QUESTION, ANSWER) VALUES (FAQ_SEQ.nextval,'서비스의 안내는 어떻게 볼수 있나요?-3', '상단에 있는 네비게이션바에서 해당서비스 안내페이지로 이동할수 있습니다.');
INSERT INTO FAQ (NUM, QUESTION, ANSWER) VALUES (FAQ_SEQ.nextval,'서비스의 안내는 어떻게 볼수 있나요?-4', '상단에 있는 네비게이션바에서 해당서비스 안내페이지로 이동할수 있습니다.');
INSERT INTO FAQ (NUM, QUESTION, ANSWER) VALUES (FAQ_SEQ.nextval,'서비스의 안내는 어떻게 볼수 있나요?-5', '상단에 있는 네비게이션바에서 해당서비스 안내페이지로 이동할수 있습니다.');
INSERT INTO FAQ (NUM, QUESTION, ANSWER) VALUES (FAQ_SEQ.nextval,'서비스의 안내는 어떻게 볼수 있나요?-7', '상단에 있는 네비게이션바에서 해당서비스 안내페이지로 이동할수 있습니다.');

INSERT INTO NOTICE (NUM, TITLE, CONTENT, VIEWCOUNT, WRTIME) VALUES (NOTICE_SEQ.nextval, '글제목1', '집에있는데  집에 가고 싶다', 0, sysdate);

-- 스키마(계정) 생성
create user masuri IDENTIFIED by masuri1234;
-- 권한 부여
grant connect, resource , CREATE VIEW to masuri;

--drop user "MASURI" CASCADE


Insert into MASURI.ENGINEERDATA (ENGNUM,ID,PASSWORD,NAME,PHONE,EMAIL,INTRO,AREA,STATE) values (1000,'gjm92','a12345','이정민','0104413132','gjm92@gmail.com','developer한 남자 이정민입니다.','강남구','false');
Insert into MASURI.ENGINEERDATA (ENGNUM,ID,PASSWORD,NAME,PHONE,EMAIL,INTRO,AREA,STATE) values (1001,'win1','a12345','이승원','01067423478','ereswony@gmail.com','큐티한 남자 이승원입니다.','강남구','false');
Insert into MASURI.ENGINEERDATA (ENGNUM,ID,PASSWORD,NAME,PHONE,EMAIL,INTRO,AREA,STATE) values (1002,'1star','a12345','류한별','01041231231','1star@gmail.com','섹시한 남자 류한별입니다.','센터','false');
Insert into MASURI.ENGINEERDATA (ENGNUM,ID,PASSWORD,NAME,PHONE,EMAIL,INTRO,AREA,STATE) values (1003,'char2b','a12345','차윤호','01042131313','char2b@gmail.com','러블리한 여자 차윤호입니다.','강남구','false');
Insert into MASURI.ENGINEERDATA (ENGNUM,ID,PASSWORD,NAME,PHONE,EMAIL,INTRO,AREA,STATE) values (1004,'zzmi18','a12345','짜미','01041231231','zzmi18@gmail.com','냐옹','강남구','false');
Insert into MASURI.ENGINEERDATA (ENGNUM,ID,PASSWORD,NAME,PHONE,EMAIL,INTRO,AREA,STATE) values (1005,'h0nest','a12345','차진솔','01042142131','h0nest@gmail.com','멍멍','강남구','false');


Insert into MASURI.USERDATA (USERNUM,ID,PASSWORD,NAME,PHONE,EMAIL,BLACK) values (1000,'lee200','a12345','이근','01034143231','lee200@gmail.com','flase');
Insert into MASURI.USERDATA (USERNUM,ID,PASSWORD,NAME,PHONE,EMAIL,BLACK) values (1001,'sky2','a12345','김천의','01024124312','sky2@gmail.com','flase');
Insert into MASURI.USERDATA (USERNUM,ID,PASSWORD,NAME,PHONE,EMAIL,BLACK) values (1002,'4seum','a12345','이신협','01023412341','4seum@gmail.com','flase');
Insert into MASURI.USERDATA (USERNUM,ID,PASSWORD,NAME,PHONE,EMAIL,BLACK) values (1003,'gunwo1','a12345','유건우','01023213123','gunwo1@gmail.com','flase');
Insert into MASURI.USERDATA (USERNUM,ID,PASSWORD,NAME,PHONE,EMAIL,BLACK) values (1004,'egg00','a12345','김계란','01041312312','egg00@gmail.com','flase');
Insert into MASURI.USERDATA (USERNUM,ID,PASSWORD,NAME,PHONE,EMAIL,BLACK) values (1006,'agent0','a12345','에이전트에이치','01014213131','agent0@gmail.com','flase');
Insert into MASURI.USERDATA (USERNUM,ID,PASSWORD,NAME,PHONE,EMAIL,BLACK) values (1007,'m1nkyu','a12345','이민규','01045134214','m1nkyu@gmail.com','flase');
Insert into MASURI.USERDATA (USERNUM,ID,PASSWORD,NAME,PHONE,EMAIL,BLACK) values (1008,'k1tefe','a12345','성연철','01041244124','k1tefe@gmail.com','flase');
Insert into MASURI.USERDATA (USERNUM,ID,PASSWORD,NAME,PHONE,EMAIL,BLACK) values (1009,'mizzu7','a12345','이승환','01051321312','mizzu7@gmail.com','flase');


INSERT INTO "MASURI"."ADMINDATA" (ID, PASSWORD) VALUES ('admin', 'a1234');

Insert into MASURI.RESLIST (NUM,TIME,ADDRESS,USERID,ENGID,FACTORY,MODEL,FAILSIT,FAILMSG,STATE) values (1,to_timestamp('20/11/11 13:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'서울특별시 강남구 봉은사로 108 (역삼동)','sky2','char2b','LG','V50 ThinQ ','스마트폰 침수','우엥ㅇ ','수리완료');

Insert into MASURI.DAYSCHEDULE (ENGID,DAY,TIME1,TIME2,TIME3) values ('char2b',to_date('20/11/11','RR/MM/DD'),null,1,null);


Insert into MASURI.FAQ (NUM,QUESTION,ANSWER) values (1,'시간이 없어서 센터에 방문 할 수 없는데 수리 받을 수 있을까요?','- 네 가능합니다. 편하신 날짜와 시간을 선택 후 위치를 알려주시면
저희 수리기사님이 선택하신 시간과 장소에 맞게 찾아가실 겁니다.
');
Insert into MASURI.FAQ (NUM,QUESTION,ANSWER) values (2,'서울 외곽에 사는데 수리 받을 수 있나요?',' - 안타깝게도 수리기사님들이 서울 내에서만 활동하고 계십니다.
 다만 시간적 여유가 되셔서 저희 센터로 방문하시면 친절하게 상담 후
 서비스를 받으실 수 있습니다.');
Insert into MASURI.FAQ (NUM,QUESTION,ANSWER) values (3,'수리기사님이 직접 오시는데 수리에 필요한 재료들을 다 갖고 오시나요?','- 네 그렇습니다. 회원님께서 신청하실 때, 간단하게 어디가 고장났는지
선택 후 자세하게 설명해 주시면, 배테랑인 수리기사님께서 경우의 수까지 생각해서
수리 재료를 들고가십니다.');
Insert into MASURI.FAQ (NUM,QUESTION,ANSWER) values (4,'시간이 얼마 없는데 기사님이 늦으시면 어떻게 하죠?',' - 그런 걱정은 안하셔도 괜찮습니다. 저희 MASURI는 애초에 그런 상황을 방지하기위해
기사님들께서는 예약시간 10분 전 도착을 실행하고 있습니다. ');
Insert into MASURI.FAQ (NUM,QUESTION,ANSWER) values (5,'제가 외진 지역인데 기사님이 여기까지 오시나요?','- 네 걱정하지 않으셔도 됩니다. 서울 내에 있으시다면 어느 지역이든 예약장소로
기사님이 찾아가십니다.^^');
Insert into MASURI.FAQ (NUM,QUESTION,ANSWER) values (6,'예약해서 기사님 오시는게 센터로 직접 방문하는것보다 훨씬 비싸지 않나요?','- 기사님의 출장 비용(5,000원)으로 인해 비용이 조금 더 들 수 있으나, 재료나 수리 그 자체의 비용은 같습니다.
 센터로 왕복하는 교통비를 생각하고 비교하신다면 거의 같다고 보시면 됩니다.
');
Insert into MASURI.FAQ (NUM,QUESTION,ANSWER) values (7,'예약 신청 했던 기사님 말고 다른 기사님으로 나중에 바꿀 수 있나요?','- 네 가능합니다. 저희 센터(1544-1544)로 연락 주셔서 예약하신 분의 정보를 확인 후
가능한 시간에 가용할 수 있는 기사님들 중 선택하시면 변경하실 수 있습니다. ');


Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (1,'삼성','갤럭시s20');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (3,'삼성','갤럭시s20+');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (5,'삼성','갤럭시 S20 Ultra');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (6,'삼성','갤럭시 S20 FE');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (7,'삼성','갤럭시 S10 5G');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (8,'삼성','갤럭시 S10+');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (9,'삼성','갤럭시 S10');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (10,'삼성','갤럭시 S10e');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (11,'애플','아이폰11');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (12,'애플','아이폰11pro');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (16,'애플','아이폰12pro');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (14,'애플','아이폰11proMax');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (15,'애플','아이폰se2020');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (17,'애플','아이폰12');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (18,'애플','아이폰12미니');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (19,'애플','아이폰12proMax');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (23,'LG','VELVET');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (21,'애플','아이폰X');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (22,'애플','아이폰XS');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (24,'LG','WING');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (25,'LG','G8');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (26,'LG','G8 ThinQ');
Insert into MASURI.FIXLIST (NUM,FACTORY,MODEL) values (27,'LG','V50 ThinQ ');

Insert into MASURI.QNA (NUM,USERID,OPEN,TITLE,CONTENT,VIEWCOUNT,WRTIME,ANSWER,ANTIME) values (1,'lee200','true','휴대폰 침수 시 응급 조치 방법이 궁금해요','놀러갔다가 핸드폰을 찌개에 빠트렸어요 ㅠㅠ 
지금 핸드폰이 아예 켜지지도 않는데 어떡하죠 ㅠㅠ ',2,to_timestamp('20/11/09 00:19:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'안녕하세요 휴대폰 수리 전문점 MASURI 입니다
휴대폰의 전원을 꺼주세요
휴대폰을 깨끗한 물에 1~3분 정도 담근 후 흐르는 물에 헹궈 휴대폰의 이물이나, 염분을 제거해 주세요. 서비스센터 방문이 어려울 경우 MASURI 출장 예약 서비스를 이용해주세요
바닷물이나 탄산음료, 찌개 등에 침수 시 메인보드의 부식이 빠르게 진행되오니 신속한 A/S를 받으시길 바랍니다.',to_timestamp('20/11/09 00:46:54.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.QNA (NUM,USERID,OPEN,TITLE,CONTENT,VIEWCOUNT,WRTIME,ANSWER,ANTIME) values (2,'sky2','true','충전할 때 휴대폰 화면이 무지개처럼 이상하게 나타나요','휴대폰을 충전할 때 화면이 무지개처럼 변해요 
왜 그런가요 ?',1,to_timestamp('20/11/09 00:19:18.000000000','RR/MM/DD HH24:MI:SSXFF'),'안녕하세요 휴대폰 수리 전문점 MASURI 입니다.
휴대폰에 화면 보호기 기능이 설정되어 나타나는 현상입니다
환경설정 > 디스플레이 > 화면보호에서 꺼짐으로 선택하여 해제하세요
문제해결이 되지 않으셨다면 MASURI 서비스센터로 방문해주세요
감사합니다',to_timestamp('20/11/09 00:47:14.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.QNA (NUM,USERID,OPEN,TITLE,CONTENT,VIEWCOUNT,WRTIME,ANSWER,ANTIME) values (3,'4seum','false','경기지역은 MASURI 출장 서비스 안하나요?','저는 판교에 거주 중인데 업무가 너무 바빠 서비스 센터에 방문하기가 힘이 드네요
혹시 경기지역은 출장서비스 안하시나요 ?',4,to_timestamp('20/11/09 00:19:39.000000000','RR/MM/DD HH24:MI:SSXFF'),'안녕하세요 휴대폰 수리 전문점 MASURI 입니다.
문의 주신 출장 지역은 현재 MASURI 출장 서비스 지역이 아닙니다
MASURI 서비스 센터 역삼점으로 방문 해주세요
추후 가능 지역 확장 여부는 공지사항을 확인해주세요
감사합니다 
',to_timestamp('20/11/09 00:47:23.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.QNA (NUM,USERID,OPEN,TITLE,CONTENT,VIEWCOUNT,WRTIME,ANSWER,ANTIME) values (4,'sky2','true','갤럭시 A5/A7 버튼 입력이나 터치가 되지 않아요','갤럭시 A5/A7 버튼 입력이나 터치가 되지 않아요',1,to_timestamp('20/11/09 00:20:06.000000000','RR/MM/DD HH24:MI:SSXFF'),'안녕하세요 휴대폰 수리 전문점 MASURI 입니다.
제품이 동작하지 않고 아무 반응이 없으면 전원버튼과 음량 하(↓) 버튼을 
동시에 7초 동안 길게 눌러 전원을 껐다 켤 수 있습니다.
만약 동일한 문제가 계속 발생된다면 엔지니어의 정확한 점검을 받아보시기를 권유 드립니다
출장 수리 서비스로 빠른 서비스를 받으실 수 있습니다 감사합니다',to_timestamp('20/11/09 00:47:34.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.QNA (NUM,USERID,OPEN,TITLE,CONTENT,VIEWCOUNT,WRTIME,ANSWER,ANTIME) values (5,'egg00','true','갤럭시S6, 디바이스 검사 방법이 궁금합니다','디바이스 관리에서 검사하는 방법이 궁금합니다',1,to_timestamp('20/11/09 00:21:54.000000000','RR/MM/DD HH24:MI:SSXFF'),null,null);
Insert into MASURI.QNA (NUM,USERID,OPEN,TITLE,CONTENT,VIEWCOUNT,WRTIME,ANSWER,ANTIME) values (6,'sky2','true','갤럭시J7/J5 2016, 외장 메모리 카드 포맷','갤럭시J7/J5 2016, 외장 메모리 카드 포맷하는 방법이 궁금해요',4,to_timestamp('20/11/09 00:22:20.000000000','RR/MM/DD HH24:MI:SSXFF'),'안녕하세요 휴대폰 수리 전문점 MASURI 입니다
제품 홈 화면에서 오른쪽 하단의 ''앱스'' 선택 → 설정 → 저장공간 → SD카드 → 포맷 → 포맷을 선택하여 진행이 가능합니다.
메모리 카드 분리 시에는 홈화면에서 ''앱스'' → 설정 → 저장공간 → SD 카드 → 마운트 해제를 선택주세요.
문제해결이 되지 않으셨다면 MASURI 서비스 센터로 방문 해주세요
감사합니다',to_timestamp('20/11/09 00:47:47.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.QNA (NUM,USERID,OPEN,TITLE,CONTENT,VIEWCOUNT,WRTIME,ANSWER,ANTIME) values (7,'agent0','true','고속충전이 안됩니다','갤럭시 A8 2016 고속충전이 안됩니다',1,to_timestamp('20/11/09 00:22:41.000000000','RR/MM/DD HH24:MI:SSXFF'),null,null);
Insert into MASURI.QNA (NUM,USERID,OPEN,TITLE,CONTENT,VIEWCOUNT,WRTIME,ANSWER,ANTIME) values (8,'sky2','false','스마트폰 액정','안녕하세요 휴대폰 액정이 깨져서 교체하려고 하는데
교체되는 액정은 어떤 액정인가요 ?',5,to_timestamp('20/11/09 00:23:05.000000000','RR/MM/DD HH24:MI:SSXFF'),null,null);


Insert into MASURI.NOTICE (NUM,TITLE,CONTENT,VIEWCOUNT,WRTIME) values (2,'홈페이지 서버 점검 안내(5월)','홈페이지 서버 점검으로 서비스 중단 안내
MASURI를 이용해 주시는 고객님들께 감사드립니다.

보다 편리하고 안정적인 서비스 제공을 위해 서버 보안 취약점 긴급 업데이트를 실시하오며,
점검 시간 동안 1~2분 정도의 순단 현상이 발생할 수 있으니 고객님의 양해 부탁드립니다.

□ 점검 일시 : 2020년 5월 2일(토) 23:00 ~ 5월 3일(일) 02:00
□ 점검 메뉴 : 홈페이지 전 메뉴

더 좋은 모습으로 찾아뵙겠습니다.
감사합니다.',6,to_timestamp('20/05/01 08:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.NOTICE (NUM,TITLE,CONTENT,VIEWCOUNT,WRTIME) values (3,'홈페이지 서버 점검 안내(7월)','홈페이지 서버 점검으로 서비스 중단 안내
MASURI를 이용해 주시는 고객님들께 감사드립니다.

보다 편리하고 안정적인 서비스 제공을 위해 서버 보안 취약점 긴급 업데이트를 실시하오며,
점검 시간 동안 1~2분 정도의 순단 현상이 발생할 수 있으니 고객님의 양해 부탁드립니다.

□ 점검 일시 : 2020년 7월 4일(토) 23:00 ~ 7월 5일(일) 02:00
□ 점검 메뉴 : 홈페이지 전 메뉴

더 좋은 모습으로 찾아뵙겠습니다.
감사합니다.',27,to_timestamp('20/07/01 09:32:00.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.NOTICE (NUM,TITLE,CONTENT,VIEWCOUNT,WRTIME) values (4,'Masuri 신입 엔지니어 모집 (~8/31일)',' 휴대폰 수리 전문 업체 Masuri 에서 함께 일할 수리기사분을 모집합니다.
  주 5일 근무 - 탄력 근무제
  정규직 - 4대보험 가입

  학력 : 상관없음 / 경력 : 상관없음

  8월 31일까지 이력서와 함께 지원해 주세요!
  이력서 보내실 곳 - masuri-admin@gmail.com  

	
그 외 Masuri 채용에 대해 궁금한 점이 있으시다면 masuri12@gmail.com 으로 문의하세요.',27,to_timestamp('20/08/01 15:02:58.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.NOTICE (NUM,TITLE,CONTENT,VIEWCOUNT,WRTIME) values (5,'광복절 연휴 센터 및 방문 수리 휴무 안내','8월 15일~17일 마수리 이용에 대해 안내 드립니다.

- 8월 15일~17일 광복절 연휴로 인해 당일 방문 및 현장 수리가 불가합니다.
 ▶ 휴무 기간 중 홈페이지 QnA 답변은 휴무 이후 순차 답변 됩니다.
 ▶ 휴무 기간 중이라도 서비스 홈페이지를 통한 예약/접수등은 가능합니다.
',17,to_timestamp('20/08/05 20:40:25.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.NOTICE (NUM,TITLE,CONTENT,VIEWCOUNT,WRTIME) values (6,'홈페이지 서버 점검 안내(9월)','홈페이지 서버 점검으로 서비스 중단 안내
MASURI를 이용해 주시는 고객님들께 감사드립니다.

보다 편리하고 안정적인 서비스 제공을 위해 서버 보안 취약점 긴급 업데이트를 실시하오며,
점검 시간 동안 1~2분 정도의 순단 현상이 발생할 수 있으니 고객님의 양해 부탁드립니다.

□ 점검 일시 : 2020년 9월 6일(토) 23:00 ~ 9월 6일(일) 02:00
□ 점검 메뉴 : 홈페이지 전 메뉴

더 좋은 모습으로 찾아뵙겠습니다.
감사합니다.',30,to_timestamp('20/09/01 08:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.NOTICE (NUM,TITLE,CONTENT,VIEWCOUNT,WRTIME) values (7,'추석 연휴 센터 및 방문 수리 휴무 안내','9월 30일~10월 4일 마수리 이용에 대해 안내 드립니다.

- 9월 30일~10월 4일 추석 연휴로 인해 당일 방문 및 현장 수리가 불가합니다.
 ▶ 휴무 기간 중 홈페이지 QnA 답변은 휴무 이후 순차 답변 됩니다.
 ▶ 휴무 기간 중이라도 서비스 홈페이지를 통한 예약/접수등은 가능합니다.',27,to_timestamp('20/09/08 20:22:03.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.NOTICE (NUM,TITLE,CONTENT,VIEWCOUNT,WRTIME) values (8,'MASURI 센터 리뉴얼 공사 안내','MASURI 센터 리뉴얼 공사 안내
2020년 10월 31일(토) 더욱 쾌적하고 편안한 서비스 제공을 위한 리뉴얼 공사를 진행하오니, 미리 참조하시어 이용에 불편함이 없으시기를 바랍니다.

■ 공사 일시 : ''20년 10월 31일(토) 13시 업무 종료 후 ~ 12월 12일(토)

※ 리뉴얼 기간 중 공사로 인해 센터 내부가 다소 혼잡할 수 있습니다. 이점 양해 부탁드립니다.',14,to_timestamp('20/10/20 18:43:37.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.NOTICE (NUM,TITLE,CONTENT,VIEWCOUNT,WRTIME) values (9,'홈페이지 서버 점검 안내(11월)','홈페이지 서버 점검으로 서비스 중단 안내
MASURI를 이용해 주시는 고객님들께 감사드립니다.

보다 편리하고 안정적인 서비스 제공을 위해 서버 보안 취약점 긴급 업데이트를 실시하오며,
점검 시간 동안 1~2분 정도의 순단 현상이 발생할 수 있으니 고객님의 양해 부탁드립니다.

□ 점검 일시 : 2020년 11월 7일(토) 23:00 ~ 11월 8일(일) 02:00
□ 점검 메뉴 : 홈페이지 전 메뉴

더 좋은 모습으로 찾아뵙겠습니다.
감사합니다.',16,to_timestamp('20/11/01 08:22:58.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.NOTICE (NUM,TITLE,CONTENT,VIEWCOUNT,WRTIME) values (10,'코로나19 예방관리를 위한 출장 예약 안내','코로나19 예방관리를 위해 『자가격리자』 고객 댁의 방문은 제한됩니다.
※ 자가격리중이신 고객께서는 격리기간 종료 후에 출장서비스 예약/신청 바랍니다.

MASURI 서비스엔지니어는 체온 및 호흡기 질환 여부를 수시 체크하고 있으며, 방문 전 손 소독 및 마스크 착용을 의무화 하고 있습니다.

고객님과 엔지니어의 건강보호를 위해 고객님께서도 마스크 착용을 당부드리며, 고객님의 적극적인 동참 부탁 드립니다.',4,to_timestamp('20/11/01 11:12:04.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.NOTICE (NUM,TITLE,CONTENT,VIEWCOUNT,WRTIME) values (11,'11월 신규가입 이벤트!',' - 신규 등록을 하면 선물이 와르르~!
 - 이벤트 기간 내에 가입하신 분들께 스타벅스 아메리카노 tall  쿠폰을 드립니다.
 이벤트 기간 : 2020년 11월 1일 ~ 11월 20일
 당첨자 발표 : 2020년 11월 23일 (Masuri 홈페이지 내 공지사항)
 당첨자 혜택: 선착순 4명 -> 스타벅스 아메리카노 tall  쿠폰',10,to_timestamp('20/11/01 11:31:28.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.NOTICE (NUM,TITLE,CONTENT,VIEWCOUNT,WRTIME) values (12,'12월 연말 이벤트!',' - 2020년 한 해를 기분좋게 마무리 하는 의미에서 연말 이벤트를 진행합니다.
 - 이벤트 기간동안 매일 선착순으로 예약하는 12분께 30% 할인 쿠폰을 드립니다. 
▶ 이벤트 기간 (12.01 ~ 12.31)',6,to_timestamp('20/11/03 12:49:01.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MASURI.NOTICE (NUM,TITLE,CONTENT,VIEWCOUNT,WRTIME) values (13,'크리스마스 날 센터 및 방문 수리 휴무 안내','12월 25일 마수리 이용에 대해 안내 드립니다.
- 12월 25일 크리스마스 연휴로 인해 당일 방문 및 현장 수리가 불가합니다.
 ▶ 휴무 기간 중 홈페이지 QnA 답변은 휴무 이후 순차 답변 됩니다.
 ▶ 휴무 기간 중이라도 서비스 홈페이지를 통한 예약/접수등은 가능합니다.',4,to_timestamp('20/11/06 20:50:02.000000000','RR/MM/DD HH24:MI:SSXFF'));





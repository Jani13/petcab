-- CREATE USER PETCAB IDENTIFIED BY PETCAB;
-- GRANT RESOURCE, CONNECT TO PETCAB;
 
 
-- drop table REVIEW_REPLY CASCADE CONSTRAINTS;
 --================================================================
 
--데려다줄개 파이널프로젝트
CREATE TABLE MEMBER (
	USER_NO	NUMBER	NOT NULL,
	USER_NAME	VARCHAR2(20)	NOT NULL,
	USER_ID	VARCHAR2(20)	NOT NULL,
	USER_PWD	VARCHAR2(100)	NOT NULL,
	POSTCODE	NUMBER	NOT NULL,
	ADDRESS	VARCHAR2(1000)	NOT NULL,
	PHONE	VARCHAR2(20)	NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(3) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	USER_TYPE	VARCHAR2(20)	NOT NULL
);

CREATE TABLE REVIEW (
	REVIEW_NO	NUMBER	NOT NULL,
	CALL_TYPE	VARCHAR2(20)	NOT NULL,
	GROUP_NO	NUMBER	NOT NULL,
	GROUP_SEQ	NUMBER	NULL,
	DEPTH	NUMBER	NULL,
	TITLE	VARCHAR2(200)	NOT NULL,
	CONTENT	VARCHAR2(2000)	NOT NULL,
	STAR_NO	NUMBER NOT NULL,
	POST_DATE	DATE DEFAULT SYSDATE,
	EDIT_DATE	DATE DEFAULT SYSDATE,
	VIEW_NO	NUMBER NULL,
    STATUS VARCHAR2(3) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	USER_NO	NUMBER	NOT NULL,
	CALL_NO	NUMBER	NOT NULL
);

CREATE TABLE DOG (
	ANIMAL_NO	VARCHAR2(100)	NOT NULL,
	DOG_NAME	VARCHAR2(50)	NOT NULL,
	DOG_TYPE	VARCHAR2(50)	NOT NULL,
	AGE	NUMBER	NULL,
	VACC	VARCHAR2(100)	NULL,
	DISORDER	VARCHAR2(100)	NULL,
	OTHER	VARCHAR2(1000)	NULL,
	IMAGE_ORI	VARCHAR2(2000)	NULL,
	IMAGE_RE	VARCHAR2(2000)	NULL,
	USER_NO	NUMBER	NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(3) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);

CREATE TABLE PARTNER (
	USER_NO	NUMBER	NOT NULL,
	PARTNER_NAME	VARCHAR2(100)	NOT NULL,
	PARTNER_TYPE	VARCHAR2(20)	NOT NULL,
	LOCATION	VARCHAR2(1000)	NOT NULL,
	PHONE	VARCHAR2(20)	NOT NULL,
	OPEN_TIME	VARCHAR2(500)	NOT NULL,
	IMAGE_ORI	VARCHAR2(2000)	NULL,
	IMAGE_RE	VARCHAR2(2000)	NULL,
	ABOUT	VARCHAR2(3000)	NULL,
    STATUS VARCHAR2(3) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);

CREATE TABLE GEN_CALL (
	CALL_NO	NUMBER	NOT NULL,
	TIME	DATE	NOT NULL,
	FROM_WHERE	VARCHAR2(500)	NOT NULL,
	TO_WHERE	VARCHAR2(500)	NOT NULL,
	WITH_OWNER	VARCHAR2(3)	NOT NULL,
	TO_DRIVER	VARCHAR2(1000)	NOT NULL,
    STATUS VARCHAR2(3) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	CALL_TYPE	NUMBER	NOT NULL,
	USER_NO	NUMBER	NOT NULL,
	ANIMAL_NO_A	VARCHAR2(100)	NOT NULL,
	ANIMAL_NO_B	VARCHAR2(100)	NULL,
	ANIMAL_NO_C	VARCHAR2(100)	NULL,
	MERCHANT_UID	VARCHAR2(1000) NULL
);

CREATE TABLE REVIEW_REPLY (
	REPLY_NO	NUMBER	NOT NULL,
	GROUP_NO	NUMBER	NOT NULL,
	GROUP_SEQ	NUMBER	NULL,
	DEPTH	NUMBER	NULL,
	CONTENT	VARCHAR2(1000)	NULL,
	POST_DATE	DATE DEFAULT SYSDATE,
	EDIT_DATE	DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(3) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	USER_NO	NUMBER	NOT NULL,
	REVIEW_NO	NUMBER	NOT NULL
);

CREATE TABLE QUES (
	QUES_NO	NUMBER	NOT NULL,
	TITLE	VARCHAR2(200)	NOT NULL,
	CONTENT	VARCHAR2(2000)	NOT NULL,
	POST_DATE	DATE DEFAULT SYSDATE,
	EDIT_DATE	DATE DEFAULT SYSDATE,
	VIEW_NO	NUMBER NULL,
	QUES_TYPE	VARCHAR2(50)	NOT NULL,
	QUES_PWD	NUMBER	NULL,
	GROUP_NO	NUMBER	NOT NULL,
	GROUP_SEQ	NUMBER	NULL,
	DEPTH	NUMBER	NULL,
	USER_NO	NUMBER	NOT NULL
);

CREATE TABLE DRIVER (
	USER_NO	NUMBER	NOT NULL,
	CAR_TYPE	VARCHAR2(20)	NULL,
	CAR_NO	VARCHAR2(50)	NULL,
	ABOUT	VARCHAR2(2000)	NULL,
	IMAGE_ORI	VARCHAR2(2000)	NULL,
	IMAGE_RE	VARCHAR2(2000)	NULL
);

CREATE TABLE QUES_REPLY (
	QUES_NO	NUMBER	NOT NULL,
	CONTENT	VARCHAR2(2000)	NOT NULL,
	POST_DATE	DATE DEFAULT SYSDATE,
	EDIT_DATE	DATE DEFAULT SYSDATE,
	USER_NO	NUMBER	NOT NULL
);

CREATE TABLE EMERG_CALL (
	CALL_NO	NUMBER	NOT NULL,
	TO_PARTNER	VARCHAR2(1000)	NULL,
	TO_REJECT	VARCHAR2(100)	NULL,
	USER_NO	NUMBER	NOT NULL
);

CREATE TABLE PAYMENT (
	MERCHANT_UID	VARCHAR2(1000)	NOT NULL,
	PG	VARCHAR2(100)	NOT NULL,
	PAY_METHOD	VARCHAR2(100)	NOT NULL,
	NAME	VARCHAR2(100)	NOT NULL,
	AMOUNT	NUMBER	NOT NULL,
	IMP_UID	VARCHAR2(1000)	NOT NULL,
	PAID_AMOUNT	NUMBER	NOT NULL,
	APPLY_NUM	VARCHAR2(1000)	NOT NULL,
	SUCCESS	VARCHAR2(100)	NOT NULL,
	STATUS	VARCHAR2(100)	NOT NULL,
	PG_PROVIDER	VARCHAR2(100)	NOT NULL,
	PG_TID	VARCHAR2(100)	NOT NULL,
	PAID_AT	NUMBER	NOT NULL,
	RECEIPT_URL	VARCHAR2(100)	NOT NULL,
	VBANK_NUM	VARCHAR2(100)	NULL,
	VBANK_NAME	VARCHAR2(100)	NULL,
	VBANK_HOLDER	VARCHAR2(100)	NULL,
	VBANK_DATE	NUMBER	NULL,
	USER_NO	NUMBER	NOT NULL
);

ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	USER_NO
);

ALTER TABLE REVIEW ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	REVIEW_NO
);

ALTER TABLE DOG ADD CONSTRAINT PK_DOG PRIMARY KEY (
	ANIMAL_NO
);

ALTER TABLE PARTNER ADD CONSTRAINT PK_PARTNER PRIMARY KEY (
	USER_NO
);

ALTER TABLE GEN_CALL ADD CONSTRAINT PK_GEN_CALL PRIMARY KEY (
	CALL_NO
);

ALTER TABLE REVIEW_REPLY ADD CONSTRAINT PK_REVIEW_REPLY PRIMARY KEY (
	REPLY_NO
);

ALTER TABLE QUES ADD CONSTRAINT PK_QUES PRIMARY KEY (
	QUES_NO
);

ALTER TABLE DRIVER ADD CONSTRAINT PK_DRIVER PRIMARY KEY (
	USER_NO
);

ALTER TABLE QUES_REPLY ADD CONSTRAINT PK_QUES_REPLY PRIMARY KEY (
	QUES_NO
);

ALTER TABLE EMERG_CALL ADD CONSTRAINT PK_EMERG_CALL PRIMARY KEY (
	CALL_NO
);

ALTER TABLE PAYMENT ADD CONSTRAINT PK_PAYMENT PRIMARY KEY (
	MERCHANT_UID
);

ALTER TABLE REVIEW ADD CONSTRAINT FK_MEMBER_TO_REVIEW_1 FOREIGN KEY (
	USER_NO
)
REFERENCES MEMBER (
	USER_NO
);

ALTER TABLE REVIEW ADD CONSTRAINT FK_GEN_CALL_TO_REVIEW_1 FOREIGN KEY (
	CALL_NO
)
REFERENCES GEN_CALL (
	CALL_NO
);

ALTER TABLE DOG ADD CONSTRAINT FK_MEMBER_TO_DOG_1 FOREIGN KEY (
	USER_NO
)
REFERENCES MEMBER (
	USER_NO
);

ALTER TABLE PARTNER ADD CONSTRAINT FK_MEMBER_TO_PARTNER_1 FOREIGN KEY (
	USER_NO
)
REFERENCES MEMBER (
	USER_NO
);

ALTER TABLE GEN_CALL ADD CONSTRAINT FK_DRIVER_TO_GEN_CALL_1 FOREIGN KEY (
	USER_NO
)
REFERENCES DRIVER (
	USER_NO
);

ALTER TABLE GEN_CALL ADD CONSTRAINT FK_DOG_TO_GEN_CALL_1 FOREIGN KEY (
	ANIMAL_NO_A
)
REFERENCES DOG (
	ANIMAL_NO
);

ALTER TABLE GEN_CALL ADD CONSTRAINT FK_DOG_TO_GEN_CALL_2 FOREIGN KEY (
	ANIMAL_NO_B
)
REFERENCES DOG (
	ANIMAL_NO
);

ALTER TABLE GEN_CALL ADD CONSTRAINT FK_DOG_TO_GEN_CALL_3 FOREIGN KEY (
	ANIMAL_NO_C
)
REFERENCES DOG (
	ANIMAL_NO
);

ALTER TABLE GEN_CALL ADD CONSTRAINT FK_PAYMENT_TO_GEN_CALL_1 FOREIGN KEY (
	MERCHANT_UID
)
REFERENCES PAYMENT (
	MERCHANT_UID
);

ALTER TABLE REVIEW_REPLY ADD CONSTRAINT FK_MEMBER_TO_REVIEW_REPLY_1 FOREIGN KEY (
	USER_NO
)
REFERENCES MEMBER (
	USER_NO
);

ALTER TABLE REVIEW_REPLY ADD CONSTRAINT FK_REVIEW_TO_REVIEW_REPLY_1 FOREIGN KEY (
	REVIEW_NO
)
REFERENCES REVIEW (
	REVIEW_NO
);

ALTER TABLE QUES ADD CONSTRAINT FK_MEMBER_TO_QUES_1 FOREIGN KEY (
	USER_NO
)
REFERENCES MEMBER (
	USER_NO
);

ALTER TABLE DRIVER ADD CONSTRAINT FK_MEMBER_TO_DRIVER_1 FOREIGN KEY (
	USER_NO
)
REFERENCES MEMBER (
	USER_NO
);

ALTER TABLE QUES_REPLY ADD CONSTRAINT FK_QUES_TO_QUES_REPLY_1 FOREIGN KEY (
	QUES_NO
)
REFERENCES QUES (
	QUES_NO
);

ALTER TABLE QUES_REPLY ADD CONSTRAINT FK_MEMBER_TO_QUES_REPLY_1 FOREIGN KEY (
	USER_NO
)
REFERENCES MEMBER (
	USER_NO
);

ALTER TABLE EMERG_CALL ADD CONSTRAINT FK_GEN_CALL_TO_EMERG_CALL_1 FOREIGN KEY (
	CALL_NO
)
REFERENCES GEN_CALL (
	CALL_NO
);

ALTER TABLE EMERG_CALL ADD CONSTRAINT FK_PARTNER_TO_EMERG_CALL_1 FOREIGN KEY (
	USER_NO
)
REFERENCES PARTNER (
	USER_NO
);

ALTER TABLE PAYMENT ADD CONSTRAINT FK_MEMBER_TO_PAYMENT_1 FOREIGN KEY (
	USER_NO
)
REFERENCES MEMBER (
	USER_NO
);

CREATE SEQUENCE SEQ_REPLY_NO;
CREATE SEQUENCE SEQ_USER_NO;
CREATE SEQUENCE SEQ_REVIEW_NO;
CREATE SEQUENCE SEQ_ANMAL_NO;
CREATE SEQUENCE SEQ_CALL_NO;
CREATE SEQUENCE SEQ_QUES_NO;
CREATE SEQUENCE SEQ_MERCHANT_UID;


COMMENT ON COLUMN MEMBER.USER_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.USER_NAME IS '회원명';
COMMENT ON COLUMN MEMBER.USER_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.POSTCODE IS '우편번호';
COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '정보수정일';
COMMENT ON COLUMN MEMBER.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN MEMBER.USER_TYPE IS '회원타입';

COMMENT ON COLUMN DOG.ANIMAL_NO IS '동물번호';
COMMENT ON COLUMN DOG.DOG_NAME IS '애견이름';
COMMENT ON COLUMN DOG.DOG_TYPE IS '견종';
COMMENT ON COLUMN DOG.AGE IS '나이';
COMMENT ON COLUMN DOG.VACC IS '예방접종';
COMMENT ON COLUMN DOG.DISORDER IS '특이질병';
COMMENT ON COLUMN DOG.OTHER IS '기타사항';
COMMENT ON COLUMN DOG.IMAGE_ORI IS '원본이미지이름';
COMMENT ON COLUMN DOG.IMAGE_RE IS '변경이미지이름';
COMMENT ON COLUMN DOG.USER_NO IS '견주번호';
COMMENT ON COLUMN DOG.ENROLL_DATE IS '등록일자';
COMMENT ON COLUMN DOG.MODIFY_DATE IS '수정일자';
COMMENT ON COLUMN DOG.STATUS IS '상태값(Y/N)';

COMMENT ON COLUMN DRIVER.USER_NO IS '회원번호';
COMMENT ON COLUMN DRIVER.CAR_TYPE IS '보유차종';
COMMENT ON COLUMN DRIVER.CAR_NO IS '차량번호';
COMMENT ON COLUMN DRIVER.ABOUT IS '자기소개';
COMMENT ON COLUMN DRIVER.IMAGE_ORI IS '원본이미지이름';
COMMENT ON COLUMN DRIVER.IMAGE_RE IS '변경이미지이름';

COMMENT ON COLUMN EMERG_CALL.CALL_NO IS '예약번호';
COMMENT ON COLUMN EMERG_CALL.TO_PARTNER IS '요청사항';
COMMENT ON COLUMN EMERG_CALL.TO_REJECT IS '거절사유';
COMMENT ON COLUMN EMERG_CALL.USER_NO IS '제휴업체회원번호';

COMMENT ON COLUMN GEN_CALL.CALL_NO IS '예약번호';
COMMENT ON COLUMN GEN_CALL.TIME IS '예약시간';
COMMENT ON COLUMN GEN_CALL.FROM_WHERE IS '출발지';
COMMENT ON COLUMN GEN_CALL.TO_WHERE IS '도착지';
COMMENT ON COLUMN GEN_CALL.WITH_OWNER IS '보호자탑승여부';
COMMENT ON COLUMN GEN_CALL.TO_DRIVER IS '드라이버요청사항';
COMMENT ON COLUMN GEN_CALL.STATUS IS '예약상태';
COMMENT ON COLUMN GEN_CALL.CALL_TYPE IS '예약타입';
COMMENT ON COLUMN GEN_CALL.USER_NO IS '드라이버번호';
COMMENT ON COLUMN GEN_CALL.ANIMAL_NO_A IS '동물번호_1';
COMMENT ON COLUMN GEN_CALL.ANIMAL_NO_B IS '동물번호_2';
COMMENT ON COLUMN GEN_CALL.ANIMAL_NO_C IS '동물번호_3';
COMMENT ON COLUMN GEN_CALL.MERCHANT_UID IS '고유주문번호';

COMMENT ON COLUMN PAYMENT.MERCHANT_UID IS '고유주문번호';
COMMENT ON COLUMN PAYMENT.PG IS 'PG사';
COMMENT ON COLUMN PAYMENT.PAY_METHOD IS '결제수단';
COMMENT ON COLUMN PAYMENT.NAME IS '주문명';
COMMENT ON COLUMN PAYMENT.AMOUNT IS '결제할금액';
COMMENT ON COLUMN PAYMENT.IMP_UID IS '아임포트거래고유번호';
COMMENT ON COLUMN PAYMENT.PAID_AMOUNT IS '결제금액';
COMMENT ON COLUMN PAYMENT.APPLY_NUM IS '카드사승인번호';
COMMENT ON COLUMN PAYMENT.SUCCESS IS '결제처리가성공적이였는지여부';
COMMENT ON COLUMN PAYMENT.STATUS IS '결제상태';
COMMENT ON COLUMN PAYMENT.PG_PROVIDER IS '결제승인/시도된PG사';
COMMENT ON COLUMN PAYMENT.PG_TID IS 'PG사거래고유번호';
COMMENT ON COLUMN PAYMENT.PAID_AT IS '결제승인시각';
COMMENT ON COLUMN PAYMENT.RECEIPT_URL IS '카드사승인번호';
COMMENT ON COLUMN PAYMENT.VBANK_NUM IS '가상계좌입금계좌번호';
COMMENT ON COLUMN PAYMENT.VBANK_NAME IS '가상계좌은행명';
COMMENT ON COLUMN PAYMENT.VBANK_HOLDER IS '가상계좌예금주';
COMMENT ON COLUMN PAYMENT.VBANK_DATE IS '가상계좌입금기한';
COMMENT ON COLUMN PAYMENT.USER_NO IS '회원번호';

COMMENT ON COLUMN QUES.QUES_NO IS '문의글번호';
COMMENT ON COLUMN QUES.TITLE IS '제목';
COMMENT ON COLUMN QUES.CONTENT IS '내용';
COMMENT ON COLUMN QUES.POST_DATE IS '등록일자';
COMMENT ON COLUMN QUES.EDIT_DATE IS '수정일자';
COMMENT ON COLUMN QUES.VIEW_NO IS '조회수';
COMMENT ON COLUMN QUES.QUES_TYPE IS '문의분류';
COMMENT ON COLUMN QUES.QUES_PWD IS '비밀번호';
COMMENT ON COLUMN QUES.GROUP_NO IS '문의그룹번호';
COMMENT ON COLUMN QUES.GROUP_SEQ IS '문의그릅순서';
COMMENT ON COLUMN QUES.DEPTH IS '답글깊이';
COMMENT ON COLUMN QUES.USER_NO IS '회원번호';

COMMENT ON COLUMN QUES_REPLY.QUES_NO IS '문의글번호';
COMMENT ON COLUMN QUES_REPLY.CONTENT IS '댓글내용';
COMMENT ON COLUMN QUES_REPLY.POST_DATE IS '등록일자';
COMMENT ON COLUMN QUES_REPLY.EDIT_DATE IS '수정일자';
COMMENT ON COLUMN QUES_REPLY.USER_NO IS '회원번호';

COMMENT ON COLUMN REVIEW.REVIEW_NO IS '리뷰번호';
COMMENT ON COLUMN REVIEW.CALL_TYPE IS '콜종류';
COMMENT ON COLUMN REVIEW.GROUP_NO IS '리뷰그룹번호';
COMMENT ON COLUMN REVIEW.GROUP_SEQ IS '리뷰그룹순서';
COMMENT ON COLUMN REVIEW.DEPTH IS '답글깊이';
COMMENT ON COLUMN REVIEW.TITLE IS '리뷰제목';
COMMENT ON COLUMN REVIEW.CONTENT IS '내용';
COMMENT ON COLUMN REVIEW.STAR_NO IS '평점';
COMMENT ON COLUMN REVIEW.POST_DATE IS '등록일자';
COMMENT ON COLUMN REVIEW.EDIT_DATE IS '수정일자';
COMMENT ON COLUMN REVIEW.VIEW_NO IS '조회수';
COMMENT ON COLUMN REVIEW.STATUS IS '상태';
COMMENT ON COLUMN REVIEW.USER_NO IS '회원번호';
COMMENT ON COLUMN REVIEW.CALL_NO IS '예약번호';

COMMENT ON COLUMN REVIEW_REPLY.REPLY_NO IS '댓글번호';
COMMENT ON COLUMN REVIEW_REPLY.GROUP_NO IS '댓글그룹번호';
COMMENT ON COLUMN REVIEW_REPLY.GROUP_SEQ IS '댓글그룹순서';
COMMENT ON COLUMN REVIEW_REPLY.DEPTH IS '댓글깊이';
COMMENT ON COLUMN REVIEW_REPLY.CONTENT IS '댓글내용';
COMMENT ON COLUMN REVIEW_REPLY.POST_DATE IS '등록일자';
COMMENT ON COLUMN REVIEW_REPLY.EDIT_DATE IS '수정일자';
COMMENT ON COLUMN REVIEW_REPLY.STATUS IS '상태';
COMMENT ON COLUMN REVIEW_REPLY.USER_NO IS '회원번호';
COMMENT ON COLUMN REVIEW_REPLY.REVIEW_NO IS '리뷰번호';

COMMENT ON COLUMN PARTNER.USER_NO IS '회원번호';
COMMENT ON COLUMN PARTNER.PARTNER_NAME IS '제휴업체명';
COMMENT ON COLUMN PARTNER.PARTNER_TYPE IS '업종';
COMMENT ON COLUMN PARTNER.LOCATION IS '위치';
COMMENT ON COLUMN PARTNER.PHONE IS '전화번호';
COMMENT ON COLUMN PARTNER.OPEN_TIME IS '오픈시간';
COMMENT ON COLUMN PARTNER.IMAGE_ORI IS '원본이미지이름';
COMMENT ON COLUMN PARTNER.IMAGE_RE IS '변경이미지이름';
COMMENT ON COLUMN PARTNER.ABOUT IS '제휴업체소개';
COMMENT ON COLUMN PARTNER.STATUS IS '제휴상태(Y/N)';
--------------------------------------------------------------------------------
--다시하세용 ^^

ALTER TABLE MEMBER ADD UNIQUE(USER_ID);
ALTER TABLE DRIVER ADD UNIQUE(CAR_NO);

ALTER TABLE REVIEW MODIFY GROUP_SEQ NULL;
ALTER TABLE REVIEW MODIFY DEPTH NULL;
ALTER TABLE REVIEW MODIFY POST_DATE DATE DEFAULT SYSDATE; 
ALTER TABLE REVIEW MODIFY EDIT_DATE DATE DEFAULT SYSDATE;
ALTER TABLE REVIEW MODIFY VIEW_NO NULL;

ALTER TABLE GEN_CALL MODIFY MERCHANT_UID NULL;

ALTER TABLE REVIEW_REPLY MODIFY GROUP_NO NOT NULL;
ALTER TABLE REVIEW_REPLY MODIFY POST_DATE DATE DEFAULT SYSDATE; 
ALTER TABLE REVIEW_REPLY MODIFY EDIT_DATE DATE DEFAULT SYSDATE;

ALTER TABLE QUES MODIFY EDIT_DATE DATE DEFAULT SYSDATE;
ALTER TABLE QUES MODIFY POST_DATE DATE DEFAULT SYSDATE;
ALTER TABLE QUES MODIFY VIEW_NO NULL;
ALTER TABLE QUES MODIFY GROUP_SEQ NULL;
ALTER TABLE QUES MODIFY DEPTH NULL;


ALTER TABLE QUES_REPLY MODIFY POST_DATE DATE DEFAULT SYSDATE; 
ALTER TABLE QUES_REPLY MODIFY EDIT_DATE DATE DEFAULT SYSDATE;

CREATE SEQUENCE SEQ_REPLY_GROUP_NO;
CREATE SEQUENCE SEQ_REVIEW_GROUP_NO;
CREATE SEQUENCE SEQ_QUES_GROUP_NO;

ALTER TABLE MEMBER MODIFY USER_PWD VARCHAR2(100);

ALTER TABLE MEMBER MODIFY USER_TYPE VARCHAR2(20) DEFAULT 'ROLE_MEMBER';
--------------------------------------------------------------------------------


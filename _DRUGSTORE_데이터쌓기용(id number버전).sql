DROP USER drugstore CASCADE;

DROP TABLE customer;
DROP TABLE stock;


CREATE USER drugstore IDENTIFIED BY drugstore DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp PROFILE DEFAULT;

GRANT CONNECT, RESOURCE TO drugstore;
GRANT CREATE VIEW, CREATE SYNONYM TO drugstore;

ALTER USER drugstore ACCOUNT UNLOCK;

conn drugstore/drugstore;


-- 테이블 만들기(고객 / 수익 / 재고)
CREATE TABLE customer (
  CO_ID number,
  CO_LOGINID varchar2(20),
  CO_PASSWORD varchar2(20) ,
  CO_NAME varchar2(20) ,
  CO_BIRTH date ,
  CO_PHONENUM varchar2(20) ,
  CO_POINT number
);
  
CREATE TABLE income (
  IN_ID number,
  IN_MONEY number
);
  
CREATE TABLE stock (
  ST_ID number,
  ST_NAME varchar2(50),
  ST_NUM number,
  ST_PRICE number
);

-- 날짜 데이터 포맷 바꾸기
ALTER SESSION SET nls_date_format='YYYY-MM-DD';

-- 재고 테이블 부분에 기본 재고 입력하기
INSERT INTO stock VALUES (1,'kf94마스크(대형)',10,3000);
INSERT INTO stock VALUES (2,'kf80마스크(대형)',10,2500);
INSERT INTO stock VALUES (3,'3M마스크(대형)',10,10000);
INSERT INTO stock VALUES (4,'면마스크(대형)',10,1500);

INSERT INTO stock VALUES (5,'kf94마스크(소형)',10,3000);
INSERT INTO stock VALUES (6,'kf80마스크(소형)',10,2500);
INSERT INTO stock VALUES (7,'3M마스크(소형)',10,10000);
INSERT INTO stock VALUES (8,'면마스크(소형)',10,1500);

INSERT INTO stock VALUES (9,'손세정제(200ml)',10,3000);
INSERT INTO stock VALUES (10,'손세정제(500ml)',10,5000);

INSERT INTO stock VALUES (11,'소독제(1L)',10,2000);

INSERT INTO stock VALUES (12,'체온계(전자)',10,10000);

INSERT INTO stock VALUES (13,'라텍스장갑(소)',10,11000);
INSERT INTO stock VALUES (14,'라텍스장갑(중)',10,12000);
INSERT INTO stock VALUES (15,'라텍스장갑(대)',10,13000);

COMMIT;


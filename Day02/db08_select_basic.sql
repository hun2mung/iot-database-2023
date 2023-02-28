-- Active: 1677474334039@@127.0.0.1@3306@employees
-- 사용 데이터베이스 변경
USE homeplus;

-- 한 문장 끝은 ; 으로 마침
-- 아래 두 문장은 같다
SELECT * FROM indextbl;
SELECT * FROM homeplus.indextbl;

-- 현재 위치가 root 이기에 가능한 것. 만약 homeplus만의 DB에서 사용 시 employees의 DB 권한에 접근 불가하여 사용 불가.
SELECT * FROM employees.titles;

-- 필요한 컬럼만 가져오겠다
SELECT first_name, last_name FROM indextbl;

-- sqldb를 사용
USE sqldb;

-- 조건절 검색
SELECT userID
     , name
     , birthYear
     , height
  FROM usertbl 
 WHERE name = '김경호';
 
 -- 관계 연산자
 SELECT *
   FROM usertbl
  WHERE birthYear >= 1970
    AND height >= 182;

-- 사이의 값을 조회
SELECT *
  FROM usertbl
 WHERE height BETWEEN 180 and 183;
 
-- IN 연산자
 SELECT *
   FROM usertbl
  WHERE addr IN ('경남', '경북', '전남');
  
-- 문자열 검색 - 뉴스 본문 안에서 일정 단어 검색
SELECT *
  FROM usertbl
 WHERE name LIKE '%김%';
 
-- Subquery(서브쿼리) 사용위치
-- 1. 컬럼위치
-- 2. 테이블 위치
-- 3. 조건절 위치
-- WHERE절에 서브쿼리가 컬럼이 한개 이상이거나 결과가 한개 이상이면 조건연산자로 조회할 수 없음
SELECT name
     , height
  FROM usertbl
 WHERE height IN (SELECT height FROM usertbl WHERE name LIKE '김%');
 
-- 가상 테이블
SELECT u.userID
     , u.name
     , (2023 - birthYear) AS '나이'
  FROM (
		SELECT userID, name, birthYear, addr
          FROM usertbl
        ) AS u
 WHERE u.birthYear > 1969;
SELECT userID, name, birthYear, addr
  FROM usertbl;

-- 컬럼에 쓰는 서브쿼리
SELECT b.userID AS '아이디'
     , (SELECT name FROM usertbl WHERE userID = b.userID) AS '이름'
     , b.prodName
     , b.price * b.amount AS '판매액'
  FROM buytbl AS b;

-- 정렬 ORDER BY : default ASC (안적어도 오름차순)
-- 내림차순 : DESC

SELECT name
     , birthYear
     , height
  FROM usertbl
 WHERE birthYear > 1069
 ORDER BY height ASC, birthYear DESC;
 
-- 중복제거 / 중복제거할 컬럼만
SELECT DISTINCT addr
  FROM usertbl;
   
-- LIMIT 갯수 제한
USE homeplus;

SELECT * FROM indexTbl
 LIMIT 5;
 
USE sqlDB;
-- 조회하면서 새로운 테이블 생성
-- PK / FK 제약조건은 복사안됨
-- 일부 컬럼(열)만 복사 테이블 생성 가능
CREATE TABLE elec_buytbl_new
SELECT num
     , prodName
     , price
  FROM buytbl
 WHERE groupName = '전자';

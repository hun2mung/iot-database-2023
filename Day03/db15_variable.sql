-- 변수 사용
USE sqldb;

SET @myVar1 = 5;
SELECT @myVar;
SET @myVar2 = '이름 ==> ';

SELECT @myVar2, name
  FROM usertbl
 WHERE height > 170;

SELECT name, height + @myVar1
  FROM usertbl;
  
-- 형변환
SELECT CAST(birthYear AS CHAR) FROM usertbl;
SELECT CAST(CONVERT(birthYear, CHAR) AS SIGNED INTEGER) FROM usertbl;

SELECT CAST(addr AS decimal) FROM usertbl;		-- 문자이므로 숫자 변경 불가
SELECT CONVERT(addr, decimal) FROM usertbl;		-- 문자이므로 숫자 변경 불가

SELECT CAST('1000' AS decimal) FROM usertbl;	-- 문자 1000을 숫자로 변경

-- 암시적 형변환
SELECT 200 +300;	-- -> 500

SELECT CONCAT('Hello' , 'World');		-- CONCAT : 문자열 합치기

SELECT '200' + '300';		-- MySQL 이외에서는 '200300'출력
SELECT CONCAT(200, '300');	-- -> 200300

/* 내장함수 리스트 */
-- 흐름함수
-- (100 > 200 ? '참' : '거짓')
SELECT IF(100>200, '참', '거짓');

-- NULL은 계산이 오류(결과도 NULL)
SELECT IFNULL(NULL, 0) + 100;	-- DB는 NULL값이 계산에 들어있을 경우 NULL 출력

SELECT NULL + 100;

-- NULLIF는 많이 사용x(값이 같으면 NULL 나옴)
SELECT NULLIF(100, 100);

-- 쿼리작성할 때 많이 사용
SELECT name
     , birthYear
     , addr
     , CASE addr
       WHEN '서울' THEN '수도권'
       WHEN '경기' THEN '수도권'
       WHEN '부산' THEN '광역권'
       WHEN '한양' THEN '조선권'
       ELSE '지역권' END AS '권역'
  FROM usertbl;
  
-- 문자열함수
SELECT ASCII('A'), CHAR(65), ASCII('a');
SELECT ASCII('안'), CHAR(236);		-- 다르게 나옴.한글 사용x
-- CHAR_LENGTH(글자길이), LENGTH(byte크기)
SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
SELECT CHAR_LENGTH('가나다'), LENGTH('가나다');		-- 한글은 한글자 당 3byte

SELECT REPLACE('Hello World', 'Hello', 'Byebye');
-- DB는 인덱스를 1부터 시작
SELECT INSTR('안녕하세요, 여러분', '여');
-- LEFT, RIGHT
SELECT LEFT('ABCDEFGHIJKLMN', 3), RIGHT('ABCDEFGHIJKLMN', 3);
-- UPPER, LOWER
SELECT UPPER('Hello World'), LOWER('Hello World');

-- LTRIM, RTRIM, TRIM
SELECT LTRIM('          Hello World!          ') AS 'ltrim'
	 , RTRIM('          Hello World!          ') AS 'rtrim'
     , TRIM('          Hello World!          ') AS 'trim';
     
-- 'Hello' * 3
SELECT REPEAT('Hello', 3);

-- substring
SELECT SUBSTRING('대한민국만세', 5, 2);

-- 수학함수
SELECT ABS(-10);
-- 올림, 내림, 반올림
SELECT CEILING(4.3), FLOOR(4.9), ROUND(4.4);

SELECT MOD(157, 10);

-- RANDOM
SELECT RAND(), FLOOR(1 + (RAND() * (6)));	-- 주사위 놀이

-- 날짜 및 시간함수
SELECT NOW();
SELECT ADDDATE('2023-03-02', INTERVAL -10 DAY);

SELECT YEAR(NOW());
SELECT DATE(NOW());
SELECT TIME(NOW());
SELECT DAYOFWEEK(NOW());	# 일요일(1) ~ 토요일(7)
SELECT LAST_DAY('2023-02-01');

-- 시스템 함수
SELECT USER();

SELECT DATABASE();

-- ROW_COUNT()
USE sqldb;
UPDATE buytbl SET price = price * 2;
SELECT ROW_COUNT();

SELECT VERSION();








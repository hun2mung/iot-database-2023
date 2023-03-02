-- 집계함수를 사용하기 위해서 / 그룹핑
USE sqldb;

-- GROUP BY에 작성된 컬럼명만 SELECT에 사용 가능
SELECT userID AS '아이디'
     , SUM(amount) AS '구매 갯수'		-- 함수 사용
  FROM buytbl
 GROUP BY userID;
 
SELECT userID AS '아이디'
     , AVG(amount) AS '평균 구매 갯수'		-- 함수 사용
  FROM buytbl
 GROUP BY userID;

-- HAVING은 집계함수 등의 결과값을 필터링하기 위해서
SELECT userID
     , sum(price * amount)		-- 컴럼이 아닌 함수라 WHERE절 사용 불가.(WHERE '합산' >= 1000;)와 같이 사용불가. !!!따라서 HAVING 사용
  FROM buytbl
 GROUP BY userID
 HAVING SUM(price * amount) >= 1000; 
 
-- Rollup
SELECT userID
     , sum(price * amount)		-- 컴럼이 아닌 함수라 WHERE절 사용 불가.(WHERE '합산' >= 1000;)와 같이 사용불가. !!!따라서 HAVING 사용
  FROM buytbl
 GROUP BY userID
  WITH ROLLUP;
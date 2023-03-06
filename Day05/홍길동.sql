USE bookrentalshop;

-- 1번 문제
SELECT CONCAT(LEFT(Names,1),',',RIGHT(Names,2)) AS '회원명'
     , SUBSTRING_INDEX(Addr,' ',-1) AS '주소'
     , Mobile AS '폰번호'
     , UPPER(Email) AS '이메일'
  FROM membertbl
 ORDER BY Email DESC;

-- 2번 문제
SELECT d.Names AS '장르'
     , b.Author AS '작가'
     , b.Names AS '책제목'
  FROM divtbl AS d
 INNER JOIN bookstbl AS b
    ON d.Division = b.Division
 ORDER BY 장르, 작가;

-- 3번 문제
INSERT INTO divtbl
(Division, Names)
VALUES
('I002', '네트워크');

-- 4번 문제
UPDATE membertbl
SET levels = 'D'
  , Mobile = '010-9839-9999'
WHERE Names = '성명건';


-- 5번 문제
SELECT CASE WHEN IFNULL(d.Names,'') = '' THEN '--합계--' ELSE d.Names END AS '장르'
     , CONCAT(FORMAT(SUM(b.Price), 0,000), '원') AS '장르별 총합계'
  FROM bookstbl AS b
 INNER JOIN divtbl AS d
    ON b.Division=d.Division
 GROUP BY d.Names 
  WITH ROLLUP

  
  
-- 그냥 테이블 접근
SELECT *
 FROM `member tbl`;
    
-- 뷰 생성
CREATE VIEW uv_memberTBL
	AS
     SELECT memberName, memberAddress
		FROM `member tbl`;
        
-- 뷰로 조회
SELECT *
	FROM uv_membertbl;
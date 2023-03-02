-- UPDATE & TRANSACTION
START TRANSACTION;

-- 경고! UPDATE 구문에는 WHERE절 빼면 안됨!!!
UPDATE usertbl_bak
   SET mobile1 = '010'
     , mobile2 = '25635444'
     , addr = '부산'
 WHERE userID = 'LDH';
 
COMMIT;
ROLLBACK;

-- DELETE
DELETE FROM usertbl
 WHERE userID = 'SJW';
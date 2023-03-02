/* OUTER JOIN */
-- stdtbl
CREATE TABLE stdtbl (		-- 학생 정보
	stdName NVARCHAR(10) NOT NULL PRIMARY KEY,
    addr	NCHAR(4) NOT NULL
);
CREATE TABLE clubtbl (		-- 동아리 정보
	clubName NVARCHAR(10) NOT NULL PRIMARY KEY,
    roomNo NCHAR(4) NOT NULL
);
CREATE TABLE stdclubtbl(	-- 학생의 동아리 가입 정보
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    stdName NVARCHAR(10) NOT NULL,
    clubName NVARCHAR(10) NOT NULL,
    FOREIGN KEY(stdName) REFERENCES stdtbl(stdName),
    FOREIGN KEY(clubName) REFERENCES clubtbl(clubName)
);
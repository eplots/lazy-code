/*
Hur man skapar en temptabell i minnet på databasen.
*/

--visible only to me, in memory (SQL 2000 and above only)
declare @test table (
    FOL_RSN bigint,
    FOL_ID bigint,
    FOL_BESK VARCHAR(50),
    FOL_VISAS CHAR(1)
);

INSERT INTO @test (FOL_RSN, FOL_ID, FOL_BESK, FOL_VISAS) --VALUES (1,1,'asdf',1)

SELECT * FROM FU_ORIGIN_LIST AS a


SELECT * FROM @test
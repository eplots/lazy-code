USE FAST2;

SELECT f.FU_FELRADNR    AS 'ao_nr',
       f.FU_REGDAT      AS 'reg_datum',
       s.SPIN_SOKNAMN   AS 'spin_rubrik',
       s.SPIN_DATESTAMP_NY AS 'spin_tid',
       s.SPIN_IDSTAMP_NY AS 'spin_id',
       REPLACE(REPLACE(s.SPIN_TEXT, CHAR(13), ''), CHAR(10), '') AS 'spin_text',
  FROM FU f
 INNER JOIN SPIN s ON f.FU_FELRADNR = s.SPIN_PARENT_KEY
 WHERE f.FU_RESURS = 'BUNECO'
   AND f.FU_REGDAT BETWEEN '20230401' AND '20240111'
   AND s.SPIN_TYP NOT IN ('AOEPOSTPKU', 'AOSMSPKU', 'AOSENT')
   AND s.SPIN_TEXT NOT IN ('Registrerad')
   AND s.SPIN_TEXT NOT LIKE '%Föregående utförare: %'
   AND s.SPIN_TEXT NOT LIKE '%Ny utförare: %'
 ORDER BY ao_nr ASC

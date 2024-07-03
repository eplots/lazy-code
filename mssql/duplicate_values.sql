USE FAST2;

--real_estate:
SELECT ft_fastnr,
       COUNT(*)
  FROM ft
 GROUP BY ft_fastnr
HAVING COUNT(*) > 1

--building:
SELECT bg_bygnr,
       COUNT(*)
  FROM bg
 GROUP BY bg_bygnr
HAVING COUNT(*) > 1

--object:
SELECT obj_objnr,
       COUNT(*)
  FROM obj
 GROUP BY obj_objnr
HAVING COUNT(*) > 1
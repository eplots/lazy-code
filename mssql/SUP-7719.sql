/*
    Control code that should be run after the year.
    This control goes against case SUP-7719.
    Probably need to check the dates below before running it.

    Save this file for future questions, especially when updating.
*/

USE FAST2;

DECLARE @fomdat VARCHAR(8)
DECLARE @tomdat VARCHAR(8)
DECLARE @uppldat VARCHAR(8)

SET @fomdat = '20220101'
SET @tomdat = '20220401'
SET @uppldat = '20221201'

SELECT DISTINCT *
  FROM ((((avr a
 INNER JOIN pr p
    ON a.avr_avtnr = p.pr_avtnr)
 INNER JOIN obj o
    ON a.avr_objnr = o.obj_objnr)
 INNER JOIN pr pr_hg1
    ON a.avr_avtnr = pr_hg1.pr_avtnr)
 INNER JOIN pku u
    ON p.pr_kundnr = u.pku_kundnr)
 INNER JOIN pku pku_hg1
    ON pr_hg1.pr_kundnr = pku_hg1.pku_kundnr
 INNER JOIN spin s
    ON p.pr_avtnr       = s.spin_parent_key
 WHERE (a.avr_fomdat BETWEEN @fomdat AND @tomdat)
   AND (   o.obj_obotyp LIKE 'P%'
      OR   o.obj_obotyp LIKE 'G%')
   AND a.avr_tomdat  = 'TV'
   AND a.avr_uppldat >= @uppldat

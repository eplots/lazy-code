/*
Hur man tar bort alla andra tecken förutom siffror i en query.
*/
(
  SELECT 
    (
      SELECT 
        CAST(
          CAST(
            (
              SELECT 
                SUBSTRING(PKU_TFNOVR, Number, 1) 
              FROM 
                master..spt_values 
              WHERE 
                Type = 'p' 
                AND Number <= LEN(PKU_TFNOVR)
                AND SUBSTRING(PKU_TFNOVR, Number, 1) LIKE '[0-9]' FOR XML PATH('')
            ) AS xml
          ) AS VARCHAR(MAX)
        )
    ) 
  FROM 
    PKU
)
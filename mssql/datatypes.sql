SELECT 
  [Name]         = c.[name]
, [Type]         = 
    CASE 
      WHEN tp.[name] IN ('varchar', 'char', 'varbinary') THEN tp.[name] + '(' + IIF(c.max_length = -1, 'max', CAST(c.max_length AS VARCHAR(25))) + ')' 
      WHEN tp.[name] IN ('nvarchar','nchar') THEN tp.[name] + '(' + IIF(c.max_length = -1, 'max', CAST(c.max_length / 2 AS VARCHAR(25)))+ ')'      
      WHEN tp.[name] IN ('decimal', 'numeric') THEN tp.[name] + '(' + CAST(c.[precision] AS VARCHAR(25)) + ', ' + CAST(c.[scale] AS VARCHAR(25)) + ')'
      WHEN tp.[name] IN ('datetime2') THEN tp.[name] + '(' + CAST(c.[scale] AS VARCHAR(25)) + ')'
      ELSE tp.[name]
    END
, [RawType]      = tp.[name]
, [MaxLength]    = c.max_length
, [Precision]    = c.[precision]
, [Scale]        = c.scale
, [IsNullable]   = c.is_nullable
FROM sys.tables t 
JOIN sys.schemas s ON t.schema_id = s.schema_id
JOIN sys.columns c ON t.object_id = c.object_id
JOIN sys.types tp ON c.user_type_id = tp.user_type_id
WHERE s.[name] = 'dbo' AND t.[name] = 'FN'
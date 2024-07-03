SELECT CONVERT(INT, ISNULL(value, value_in_use)) AS config_value
FROM  sys.configurations
WHERE  name = 'xp_cmdshell' ;
# Production-server:
$datum = Get-Date -Format "yyyy-MM-dd"; $path = "\\appsrv31\Rapport"; $outputFile = "C:\Users\patsto\Desktop\produktions-jasper-$datum.md"; "| Filename | Last Modified Time |", "| --- | --- |" | Set-Content $outputFile; Get-ChildItem -Path $path -Filter *.jasper | Sort-Object LastWriteTime -Descending | ForEach-Object { "| $($_.Name) | $($_.LastWriteTime) |" | Add-Content $outputFile }

# Testing-server:
$datum = Get-Date -Format "yyyy-MM-dd"; $path = "\\tst-appsrv31\Rapport"; $outputFile = "C:\Users\patsto\Desktop\produktions-jasper-$datum.md"; "| Filename | Last Modified Time |", "| --- | --- |" | Set-Content $outputFile; Get-ChildItem -Path $path -Filter *.jasper | Sort-Object LastWriteTime -Descending | ForEach-Object { "| $($_.Name) | $($_.LastWriteTime) |" | Add-Content $outputFile }

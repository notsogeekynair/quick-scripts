Get-ChildItem -Path $env:TEMP -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
Get-ChildItem -Path "C:\Windows\Temp" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue

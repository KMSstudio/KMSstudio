@echo off
setlocal

for /f "tokens=2 delims==" %%I in ('wmic OS Get localdatetime /value ^| find "="') do set datetime=%%I
set commit_time=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2% %datetime:~8,2%:%datetime:~10,2%:%datetime:~12,2%

git add .
git commit -m "automated commit - %commit_time%"
git push
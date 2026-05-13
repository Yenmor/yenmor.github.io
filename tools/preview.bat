@echo off
cd /d "%~dp0.."
npx hexo clean
if %errorlevel% neq 0 (
  echo clean failed
  pause
  exit /b 1
)
npx hexo generate
if %errorlevel% neq 0 (
  echo generate failed
  pause
  exit /b 1
)
npx hexo server
echo http://localhost:4000
pause

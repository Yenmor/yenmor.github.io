@echo off
cd /d "%~dp0.."
set /p MSG="Commit message (leave empty for 'update blog'): "
if "%MSG%"=="" set MSG=update blog
git add .
if %errorlevel% neq 0 (
  echo git add failed
  pause
  exit /b 1
)
git commit -m "%MSG%"
if %errorlevel% neq 0 (
  echo git commit failed
  pause
  exit /b 1
)
git push origin main
if %errorlevel% neq 0 (
  echo git push failed
  pause
  exit /b 1
)
echo Pushed. Actions deploying...
pause

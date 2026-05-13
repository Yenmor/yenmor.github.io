@echo off
set /p TITLE="Post title: "
if "%TITLE%"=="" (
  echo Title cannot be empty
  pause
  exit /b 1
)
npx hexo new "%TITLE%"
if %errorlevel% neq 0 (
  echo Failed to create post
  pause
  exit /b 1
)
echo Post created in source/_posts/
pause

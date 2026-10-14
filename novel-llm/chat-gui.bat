@echo off
setlocal
rem ---- Novel Chat GUI launcher ----
rem Starts Ollama (with OLLAMA_ORIGINS=*) if it is not running, then opens chat.html.

set "OLLAMA_EXE=%LOCALAPPDATA%\Programs\Ollama-portable\ollama.exe"
set "OLLAMA_ORIGINS=*"

curl -s -o nul http://localhost:11434/api/version >nul 2>&1
if %errorlevel%==0 (
  echo Ollama is already running.
) else (
  if not exist "%OLLAMA_EXE%" (
    echo ollama.exe not found: "%OLLAMA_EXE%"
    pause
    exit /b 1
  )
  echo Starting Ollama...
  start "Ollama" /min "%OLLAMA_EXE%" serve
  rem wait up to ~20 seconds for the API
  for /l %%i in (1,1,20) do (
    curl -s -o nul http://localhost:11434/api/version >nul 2>&1 && goto :ready
    timeout /t 1 /nobreak >nul
  )
  echo Ollama did not respond yet. Opening the page anyway.
)
:ready
start "" "%~dp0chat.html"
endlocal

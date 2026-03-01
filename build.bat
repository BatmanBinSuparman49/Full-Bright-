@echo off

set PLATFORM=%1
if "%PLATFORM%"=="" set PLATFORM=merged

lazurite build ./src -p %PLATFORM%

if not exist "build\%PLATFORM%" (
    mkdir "build\%PLATFORM%"
)

dir /b *.material.bin >nul 2>&1
if %errorlevel% == 0 (
    move /y *.material.bin "build\%PLATFORM%\"
    echo [SUCCESS] Moved %PLATFORM% materials to build/%PLATFORM%/
) else (
    echo [ERROR] No files found for platform: %PLATFORM%
)
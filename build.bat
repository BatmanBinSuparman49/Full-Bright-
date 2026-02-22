@echo off

:: 1. Set the platform variable (defaults to 'merged' if you type nothing)
set PLATFORM=%1
if "%PLATFORM%"=="" set PLATFORM=merged

:: 2. Run the build using that platform
lazurite build ./src -p %PLATFORM%

:: 3. Create the platform-specific subfolder
if not exist "build\%PLATFORM%" (
    mkdir "build\%PLATFORM%"
)

:: 4. Move the materials into the specific folder
dir /b *.material.bin >nul 2>&1
if %errorlevel% == 0 (
    move /y *.material.bin "build\%PLATFORM%\"
    echo [SUCCESS] Moved %PLATFORM% materials to build/%PLATFORM%/
) else (
    echo [ERROR] No files found for platform: %PLATFORM%
)
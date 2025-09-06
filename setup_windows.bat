@echo off
:: Setup Script for Nova Act (Windows)
echo === Nova Act Setup (Windows) ===

:: 1. Check python
where python >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Python not found.
    echo Install Python 3.10+ from https://www.python.org/downloads/windows/
    exit /b 1
)

:: 2. Check version
for /f "tokens=2 delims= " %%v in ('python -V') do set PYVER=%%v
echo Detected Python %PYVER%

for /f "tokens=1,2 delims=." %%a in ("%PYVER%") do (
    if %%a LSS 3 (
        echo Python version too old. Need 3.10+
        exit /b 1
    )
    if %%a==3 if %%b LSS 10 (
        echo Python version too old. Need 3.10+
        exit /b 1
    )
)

echo Python version OK

:: 3. Ensure pip
python -m ensurepip >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Failed to install pip automatically.
    echo Please reinstall Python with "Add pip to PATH" enabled.
    exit /b 1
)

:: 4. Install Nova Act
echo Installing Nova Act...
python -m pip install --upgrade nova-act
if %ERRORLEVEL% EQU 0 (
    echo Nova Act installed successfully
) else (
    echo Installation failed
)

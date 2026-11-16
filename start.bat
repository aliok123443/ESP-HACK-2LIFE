@echo off
title esp-hack-2life v0.1 Flasher
color 0A
set "BIN_NAME=esp-hack-2life_v0.1-sh.bin"

:LANG_SELECT
cls
echo.
echo   would you like to switch to russian lang? (y or n)
set "LANG_CHOICE="
set /p "LANG_CHOICE=> "
if /i "%LANG_CHOICE%"=="y" goto MAIN_RU
if /i "%LANG_CHOICE%"=="n" goto MAIN_EN
goto LANG_SELECT

:MAIN_RU
cls
echo ============================================================================
echo                         _                _            ____  _ _  __      
echo    ___  ___ _ __      ^| ^|__   __ _  ___^| ^| __       ^|___ \^| (_)/ _^| ___ 
echo   / _ \/ __^| '_ \ ____^| '_ \ / _` ^|/ __^| ^|/ /_____    __) ^| ^| ^| ^|_ / _ \
echo  ^|  __/\__ \ ^|_) ^|____^| ^| ^| ^| (_^| ^| (__^|   ^<^|_____^|  / __/^| ^| ^|  _^|  __/
echo   \___^|^|___/ .__/     ^|_^| ^|_^|\__,_^|\___^|_^|\_\       ^|_____^|_^|_^|_^|  \___^|
echo             ^|_^|                                            v0.1
echo ============================================================================
echo   Proshivalshchik dlya ESP32 (Tolko ekran SH1106) ^| Versiya 0.1
echo ============================================================================
echo.
echo   [!] OTKAZ OT OTVETSTVENNOSTI I SOGLASIE [!]
echo   Dannoe PO predostavlyaetsya isklyuchitelno v obrazovatelnyh celyah
echo   i dlya testirovaniya bezopasnosti sobstvennyh setey i ustroystv.
echo   Avtor ne neset otvetstvennosti za lyuboe nepravomernoe ispolzovanie.
echo   Licenziya: GNU AGPL v3.0
echo.

:CONSENT_RU
set "AGREE="
set /p "AGREE=Vy prinimaete usloviya i podtverzhdaete pravo na testirovanie? (y/n): "
if /i "%AGREE%"=="y" goto TIP_RU
if /i "%AGREE%"=="n" goto ABORT_RU
goto CONSENT_RU

:ABORT_RU
color 0E
echo.
echo   Operaciya otmenena polzovatelem.
goto END_RU

:TIP_RU
echo.
echo ----------------------------------------------------------------------------
echo   [TIP - KAK PEREVESTI V REZHIM PROSHIVKI]
echo   1. Zazhmite i uderzhivayte knopku BOOT na plate ESP32 DO podklyucheniya.
echo   2. Ne otpuskaya BOOT, podklyuchite kabel USB k kompyuteru.
echo   3. Derzhite knopku, poka ne zamigaet svetodiod ili ne poyavitsya FLASHING.....
echo ----------------------------------------------------------------------------
echo.

if not exist "%~dp0%BIN_NAME%" goto NO_BIN_RU

set "COM_PORT="
set /p "COM_PORT=Vvedite COM-port (naprimer, COM3): "
if "%COM_PORT%"=="" goto TIP_RU

echo.
echo   FLASHING..... Ne otklyuchayte ustroystvo ot PK!
echo.

if exist "%~dp0esptool.exe" goto FLASH_EXE_RU
if exist "%~dp0esptool.py" goto FLASH_PY_RU
goto NO_TOOL_RU

:FLASH_EXE_RU
"%~dp0esptool.exe" --port %COM_PORT% --baud 921600 write_flash -z 0x0 "%~dp0%BIN_NAME%"
if %errorlevel% neq 0 goto ERR_RU
goto DONE_RU

:FLASH_PY_RU
python "%~dp0esptool.py" --port %COM_PORT% --baud 921600 write_flash -z 0x0 "%~dp0%BIN_NAME%"
if %errorlevel% neq 0 goto ERR_RU
goto DONE_RU

:DONE_RU
color 0A
echo.
echo   [GOTOVO] Proshivka esp-hack-2life v0.1 uspeshno zavershena!
goto END_RU

:NO_BIN_RU
color 0C
echo   [OSHIBKA] Fayl %BIN_NAME% ne nayden v papke so skriptom!
goto END_RU

:NO_TOOL_RU
color 0C
echo   [OSHIBKA] esptool.exe ili esptool.py ne nayden v papke so skriptom!
goto END_RU

:ERR_RU
color 0C
echo.
echo   [OSHIBKA] Sboy pri proshivke. Proverte kabel, drayvery i knopku BOOT.
goto END_RU

:END_RU
echo.
echo   Nazhmite lyubuyu klavishu, chtoby zakryt okno...
pause >nul
exit /b

:MAIN_EN
cls
echo ============================================================================
echo                         _                _            ____  _ _  __      
echo    ___  ___ _ __      ^| ^|__   __ _  ___^| ^| __       ^|___ \^| (_)/ _^| ___ 
echo   / _ \/ __^| '_ \ ____^| '_ \ / _` ^|/ __^| ^|/ /_____    __) ^| ^| ^| ^|_ / _ \
echo  ^|  __/\__ \ ^|_) ^|____^| ^| ^| ^| (_^| ^| (__^|   ^<^|_____^|  / __/^| ^| ^|  _^|  __/
echo   \___^|^|___/ .__/     ^|_^| ^|_^|\__,_^|\___^|_^|\_\       ^|_____^|_^|_^|_^|  \___^|
echo             ^|_^|                                            v0.1
echo ============================================================================
echo   ESP32 Firmware Flasher (ONLY SH1106) ^| Version 0.1
echo ============================================================================
echo.
echo   [!] DISCLAIMER AND USER AGREEMENT [!]
echo   This software is provided strictly for educational purposes
echo   and authorized security testing of your own networks and devices.
echo   The author is not responsible for any misuse or damage.
echo   License: GNU AGPL v3.0
echo.

:CONSENT_EN
set "AGREE="
set /p "AGREE=Do you agree to these terms and confirm authorization? (y/n): "
if /i "%AGREE%"=="y" goto TIP_EN
if /i "%AGREE%"=="n" goto ABORT_EN
goto CONSENT_EN

:ABORT_EN
color 0E
echo.
echo   Operation aborted by user.
goto END_EN

:TIP_EN
echo.
echo ----------------------------------------------------------------------------
echo   [TIP - HOW TO ENTER FLASH MODE]
echo   1. Press and hold the BOOT button on your ESP32 BEFORE plugging it in.
echo   2. While holding BOOT, connect the USB cable to your computer.
echo   3. Keep holding until the LED starts blinking or FLASHING..... appears.
echo ----------------------------------------------------------------------------
echo.

if not exist "%~dp0%BIN_NAME%" goto NO_BIN_EN

set "COM_PORT="
set /p "COM_PORT=Enter COM port (e.g., COM3): "
if "%COM_PORT%"=="" goto TIP_EN

echo.
echo   FLASHING..... Do not disconnect the device!
echo.

if exist "%~dp0esptool.exe" goto FLASH_EXE_EN
if exist "%~dp0esptool.py" goto FLASH_PY_EN
goto NO_TOOL_EN

:FLASH_EXE_EN
"%~dp0esptool.exe" --port %COM_PORT% --baud 921600 write_flash -z 0x0 "%~dp0%BIN_NAME%"
if %errorlevel% neq 0 goto ERR_EN
goto DONE_EN

:FLASH_PY_EN
python "%~dp0esptool.py" --port %COM_PORT% --baud 921600 write_flash -z 0x0 "%~dp0%BIN_NAME%"
if %errorlevel% neq 0 goto ERR_EN
goto DONE_EN

:DONE_EN
color 0A
echo.
echo   [SUCCESS] esp-hack-2life v0.1 flashed successfully!
goto END_EN

:NO_BIN_EN
color 0C
echo   [ERROR] File %BIN_NAME% not found in script folder!
goto END_EN

:NO_TOOL_EN
color 0C
echo   [ERROR] esptool.exe or esptool.py not found in script folder!
goto END_EN

:ERR_EN
color 0C
echo.
echo   [ERROR] Flashing failed. Check USB cable, drivers, and BOOT button.
goto END_EN

:END_EN
echo.
echo   Press any key to close this window...
pause >nul
exit /b
@echo off
title 18362 WIS 2 RP
:: script             : abbodi1406
:: unattend stage idea: whatever127
reg query "HKU\S-1-5-19" 1>nul 2>nul || (
echo.
echo ERROR: Run the script as administrator
echo Press any key to exit.
pause >nul
goto :QUIT
)
if not exist "%systemroot%\servicing\Packages\Package_for_RollupFix*18362.10022.*.mum" (
echo.
echo ERROR: WIS update 18362.10022 not detected
echo Press any key to exit.
pause >nul
goto :QUIT
)
cd /d "%~dp0"
if not exist "Windows10*KB*.cab" (
echo.
echo ERROR: Windows10.0-KB*.cab file not detected
echo Press any key to exit.
pause >nul
goto :QUIT
)

if exist Servicing*.xml del /f /q Servicing*.xml

(
echo.^<?xml version="1.0" encoding="utf-8"?^>
echo.^<unattend xmlns="urn:schemas-microsoft-com:unattend"^>
echo.    ^<servicing^>
echo.        ^<package action="stage"^>
echo.            ^<assemblyIdentity name="Package_for_RollupFix" version="18362.10022.1.30" processorArchitecture="%PROCESSOR_ARCHITECTURE%" publicKeyToken="31bf3856ad364e35" language="neutral" /^>
echo.        ^</package^>
)>Servicing.xml

for /f "delims=" %%# in ('dir /b /os "*Windows10*KB*.cab"') do (set "pack=%%#"&call :MUM)

if not defined LCU (
if exist Servicing*.xml del /f /q Servicing*.xml
echo.
echo ERROR: No LCU update detected
echo Press any key to exit.
pause >nul
goto :QUIT
)

(
echo.     ^</servicing^>
echo.^</unattend^>
)>>Servicing.xml

dism /online /norestart /apply-unattend:Servicing.xml
if %errorlevel% neq 0 if %errorlevel% neq 3010 (
echo.
echo ERROR: Installing %LCU% failed
echo Press any key to exit.
pause >nul
goto :QUIT
)

dism /online /norestart /remove-Package /PackageName:Package_for_RollupFix~31bf3856ad364e35~%PROCESSOR_ARCHITECTURE%~~18362.10022.1.30
if %errorlevel% neq 0 if %errorlevel% neq 3010 (
echo.
echo ERROR: Removing WIS update 18362.10022 failed
echo Press any key to exit.
pause >nul
goto :QUIT
)

if exist "%systemroot%\winsxs\pending.xml" (
echo.
echo System restart is required.
)
if exist Servicing*.xml del /f /q Servicing*.xml
echo.
echo Done
echo Press any key to exit.
pause >nul
goto :QUIT

:MUM
expand.exe -f:update.mum %pack% .\ >nul 2>&1
if not exist update.mum exit /b
findstr /i "Package_for_RollupFix" update.mum >nul && (goto :LCU)
del /f /q *.mum >nul 2>&1
exit /b

:LCU
set LCU=%pack%
call :XML Servicing.xml
del /f /q *.mum >nul 2>&1
exit /b

:XML
(
echo.        ^<package action="install"^>
)>>%1
findstr /i "Package_for_*" update.mum>>%1
(
echo.            ^<source location="%%configsetroot%%\%pack%" /^>
echo.        ^</package^>
)>>%1
exit /b

:QUIT
del /f /q *.mum >nul 2>&1
exit /b

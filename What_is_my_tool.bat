@echo off
Title What Is My v1.0
color 0A
:start
cls
echo.
echo.
echo					#####################################
echo						What Is My? Tool v1.0.1
echo.
echo						By Regifyzer
echo					#####################################
echo.
echo						Menu
echo.
echo						1 - IP
echo						2 - Computer Name
echo						3 - MAC Adress
echo						4 - All
echo.
echo.

set /P A=Answer:
if %A%==1 goto 1
if %A%==2 goto 2
if %A%==3 goto 3
if %A%==4 goto 4

:1
cls
setlocal
setlocal enabledelayedexpansion
for /f "usebackq tokens=2 delims=:" %%a in (`ipconfig ^| findstr /r "[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*"`) do (
  set _temp=%%a
  set _ipAddress=!_temp:~1!
  echo Your IP Address is: !_ipAddress!
echo.
echo.
echo Press r to return to the menu or press any other key to exit
goto :choice
  )
endlocal
echo.

:Choice
set /p C=Answer:
if %c%==r (goto start
) else (
goto :exit
)
pause>null
goto :eof

:2
cls
hostname
echo.
echo Press r to return to the menu or press any other key to exit
set /p C=Answer:
if %c%==r (goto start
) else (
goto :exit
)
pause>null
goto :eof

:3
cls
getmac
echo.
echo Press r to return to the menu or press any other key to exit
set /p C=Answer:
if %c%==r (goto start
) else (
goto :exit
)
pause>null


:4
cls
start /b ipconfig
start /b hostname
echo.
echo Press r to return to the menu or press any other key to exit
set /p C=Answer:
if %c%==r (goto start
) else (
goto :exit
)
pause>null

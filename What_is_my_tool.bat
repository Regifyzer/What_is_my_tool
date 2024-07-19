@echo off
Title What Is My V1.0
color 0A
:start
cls
echo.
echo.
echo					#####################################
echo						What Is My? Tool
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
if %A%==2 goto 3
if %A%==2 goto 4

:1
cls
ipconfig
echo.
echo Press r to return to the menu or press any other key to exit
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
ipconfig && hostname && getmac
echo.
echo Press r to return to the menu or press any other key to exit
set /p C=Answer:
if %c%==r (goto start
) else (
goto :exit
)
pause>null

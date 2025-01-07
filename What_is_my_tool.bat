@echo off
Title What Is My v1.0
color 0A
:start
:: After each choice, if r for return is selected the set a= will clear the previous variable.
set "A="
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
echo						3 - MAC Address
echo						4 - All
echo.
echo.

set /P A=Answer:
if %A%==1 goto 1
if %A%==2 goto 2
if %A%==3 goto 3
if %A%==4 goto 4
if %A%==""
goto exit

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
for /f %%i in ('hostname') do set computerName=%%i
echo Your Computer Name Is: %computerName%
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
:: Will only display wifi mac, need to add ethernet.
for /f "tokens=3 delims=," %%a in  ('getmac /v /fo csv ^| findstr /i wi-fi') do set wirelessmac=%%a
set wirelessmac=%wirelessmac:"=%
echo Your MAC Address is: %wirelessmac%
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
goto 5


:5
setlocal
setlocal enabledelayedexpansion
rem throw away everything except the IPv4 address line 
for /f "usebackq tokens=*" %%a in (`ipconfig ^| findstr IPv4`) do (
  rem we have for example "IPv4 Address. . . . . . . . . . . : 192.168.42.78"
  rem split on ':' and get 2nd token
  for /f delims^=^:^ tokens^=2 %%b in ('echo %%a') do (
    rem we have " 192.168.42.78"
    rem split on '.' and get 4 tokens (octets)
    for /f "tokens=1-4 delims=." %%c in ("%%b") do (
      set _o1=%%c
      set _o2=%%d
      set _o3=%%e
      set _o4=%%f
      rem strip leading space from first octet
      set _4octet=!_o1:~1!.!_o2!.!_o3!.!_o4!
      echo Your IP Address is: !_4octet!
      )
    )
  )
endlocal
echo.
goto 6

:6
for /f %%i in ('hostname') do set computerName=%%i
echo Your Computer Name is: %computerName%
echo.
goto 7

:7
for /f "tokens=3 delims=," %%a in  ('getmac /v /fo csv ^| findstr /i wi-fi') do set wirelessmac=%%a
set wirelessmac=%wirelessmac:"=%
echo Your MAC Address is: %wirelessmac%
echo.
echo Press r to return to the menu or press any other key to exit
set /p C=Answer:
if %c%==r (goto start
) else (
goto :exit
)
pause>null

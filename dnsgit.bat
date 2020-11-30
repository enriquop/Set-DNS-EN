@echo off
REM Created by: Enriquop
REM SET DNS
netsh interface ip show config
pause > nul
set /p Adaptador="Name of adapter: "
set /p DNS="IP of DNS: "
netsh interface ipv4 add dnsserver "%Adaptador%" address=%DNS% index=1
echo listo!
pause
:start
SET choice=
SET /p choice=Do you wish to set the alternative dns? [Y/N]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
ECHO "%choice%" is not valid
ECHO.
GOTO start

:no
cls
ECHO you are going to exit the menu
timeout 2 > nul
echo exiting...
timeout 1 > nul
EXIT

:yes
set /p Adaptador1="Name of adapter: "
set /p DNS2="IP of DNS: "
netsh interface ipv4 add dnsserver "%Adaptador1%" address=%DNS2% index=2
echo Alternative ip set correctly!!!
timeout 2 > nul
EXIT

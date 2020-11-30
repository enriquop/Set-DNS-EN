@echo off
REM Created by: Enriquop
REM SET DNS
netsh interface ip show config
pause > nul
set /p Adaptador="Nombre de adapador: "
set /p DNS="IP de DNS: "
netsh interface ipv4 add dnsserver "%Adaptador%" address=%DNS% index=1
echo listo!
pause
:start
SET choice=
SET /p choice=Deseas poner la dns alternativa? [Y/N]: 
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
ECHO vas a salir del menu
timeout 2 > nul
echo saliendo...
timeout 1 > nul
EXIT

:yes
set /p Adaptador1="Nombre de adapador: "
set /p DNS2="IP de DNS: "
netsh interface ipv4 add dnsserver "%Adaptador1%" address=%DNS2% index=2
echo Ip alternativa asignada correctamente
timeout 2 > nul
EXIT
@echo off
SET pathXampp="%CD%\mysql"
SET oldfolder="%pathXampp%\data-0"
cd %pathXampp%


:menu
cls
echo.
color 07
echo XAMPP MYSQL FIXER by ElayRodriguez
ECHO ===================================
echo.
color 0A
echo Options:
echo 1 - Basic Fix (recommended)
echo 2 - Full Fix (don't wipe databases)
echo 3 - Exit
echo.
color 07
echo =====================================
echo.
set /p InputChoices=Enter Option:
cls
color 09 
if %InputChoices%==1 goto :basicrest
if %InputChoices%==2 goto :fullrest
if %InputChoices%==3 goto :quit

:fullrest
echo Renombrando data como data-0
echo.
ren data data-0
echo Creando Data
echo.
mkdir data
echo Copiando Archivos originales
echo.
xcopy backup data /E /H /C 
echo borrando directorios innecesarios
echo.
rmdir data-0\mysql /S /Q
rmdir data-0\performance_schema /S /Q
rmdir data-0\phpmyadmin /S /Q
echo Restaurando Archivos y base de datos
echo.
xcopy data-0 data /E /H /C /Y
echo Listo.
echo.
goto :menu

:basicrest
echo Copiando Archivos originales
echo.
xcopy backup\mysql data\mysql /E /H /C /Y
xcopy backup\performance_schema data\performance_schema /E /H /C /Y
xcopy backup\phpmyadmin data\phpmyadmin /E /H /C /Y
echo Listo.
echo.
goto :menu

:quit
exit
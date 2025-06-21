@echo off
setlocal EnableDelayedExpansion
chcp 1252 >nul

:inicio
color 0A
cls
echo.
echo ********************************************
echo *                                          *
echo *    Bem-vindo ao Morppheus Cleaner DELUXE *
echo *                                          *
echo ********************************************
echo.
echo 1 - Limpar Arquivos Temporários
echo 2 - Renovar Conexão de Internet
echo 3 - Liberar Memória RAM
echo 4 - Verificar e Reparar Arquivos do Sistema
echo 5 - Desfragmentar Disco C:
echo 6 - Executar Tudo (com reparo)
echo 7 - Executar Tudo (sem reparo)
echo 8 - Executar Turbo (com barra animada)
echo 9 - Executar Ultra Turbo (execução fantasma)
echo C - Executar Modo Clássico (com barra animada)
echo 0 - Sair
echo.

set /p opcao=Escolha uma opção: 
echo.

if /i "%opcao%"=="1" call :limpar_temp
if /i "%opcao%"=="2" call :internet
if /i "%opcao%"=="3" call :liberar_ram
if /i "%opcao%"=="4" call :reparar_sistema
if /i "%opcao%"=="5" call :desfragmentar
if /i "%opcao%"=="6" call :tudo
if /i "%opcao%"=="7" call :tudo_menos_reparar
if /i "%opcao%"=="8" call :turbo
if /i "%opcao%"=="9" call :ultra_turbo
if /i "%opcao%"=="C" call :modo_classico
if "%opcao%"=="0" exit

cls
echo.
echo Opção inválida. Tente novamente.
echo.
pause
goto inicio

:limpar_temp
cls
echo.
echo Limpando arquivos temporários...
echo.
del /f /s /q %temp%\* 
echo.
echo Módulo concluído com sucesso.
echo.
pause
goto conclusao

:internet
cls
echo.
echo Renovando conexão de internet...
echo.
ipconfig /release
ipconfig /renew
ipconfig /flushdns
echo.
echo Módulo concluído com sucesso.
echo.
pause
goto conclusao

:liberar_ram
cls
echo.
echo Liberando memória RAM...
echo.
start /min "" cmd.exe /c "echo off | clip"
echo.
echo Módulo concluído com sucesso.
echo.
pause
goto conclusao

:reparar_sistema
cls
echo.
echo Verificando e reparando arquivos do sistema...
echo.
sfc /scannow
echo.
echo Módulo concluído com sucesso.
echo.
pause
goto conclusao

:desfragmentar
cls
echo.
echo Desfragmentando o Disco C:...
echo.
defrag C: /U /V
echo.
echo Módulo concluído com sucesso.
echo.
pause
goto conclusao

:tudo
call :progresso_animado 20 "Limpando arquivos temporários"
del /f /s /q %temp%\* >nul

call :progresso_animado 40 "Renovando conexão de internet"
ipconfig /release >nul
ipconfig /renew >nul
ipconfig /flushdns >nul

call :progresso_animado 60 "Liberando memória RAM"
start /min "" cmd.exe /c "echo off | clip"

call :progresso_animado 80 "Verificando arquivos do sistema"
sfc /scannow >nul

call :progresso_animado 100 "Desfragmentando Disco C:"
defrag C: /U /V >nul

goto conclusao

:tudo_menos_reparar
call :progresso_animado 25 "Limpando arquivos temporários"
del /f /s /q %temp%\* >nul

call :progresso_animado 50 "Renovando conexão de internet"
ipconfig /release >nul
ipconfig /renew >nul
ipconfig /flushdns >nul

call :progresso_animado 75 "Liberando memória RAM"
start /min "" cmd.exe /c "echo off | clip"

call :progresso_animado 100 "Desfragmentando Disco C:"
defrag C: /U /V >nul

goto conclusao

:turbo
call :progresso_animado 20 "Limpando arquivos temporários"
del /f /s /q %temp%\* >nul

call :progresso_animado 40 "Renovando conexão de internet"
ipconfig /release >nul
ipconfig /renew >nul
ipconfig /flushdns >nul

call :progresso_animado 60 "Liberando memória RAM"
start /min "" cmd.exe /c "echo off | clip"

call :progresso_animado 100 "Desfragmentando Disco C:"
defrag C: /U /V >nul

goto conclusao

:ultra_turbo
call :progresso_animado 25 "Executando limpeza fantasma"
del /f /s /q %temp%\* >nul 2>&1
ipconfig /release >nul
ipconfig /renew >nul
ipconfig /flushdns >nul
start /min "" cmd.exe /c "echo off | clip"
defrag C: /U /V >nul 2>&1

call :progresso_animado 100 "Finalizando..."
goto conclusao

:modo_classico
call :progresso_animado 33 "Limpando arquivos temporários"
del /f /s /q %temp%\* >nul

call :progresso_animado 66 "Renovando conexão de internet"
ipconfig /release >nul
ipconfig /renew >nul
ipconfig /flushdns >nul

call :progresso_animado 100 "Liberando memória RAM"
start /min "" cmd.exe /c "echo off | clip"

goto conclusao

:progresso_animado
setlocal EnableDelayedExpansion
set "target=%~1"
set "etapa=%~2"
set "barra="

set /a max=20
set /a filled=(%target% * max) / 100

for /L %%i in (1,1,!filled!) do set "barra=!barra!=="
for /L %%i in (!filled!,1,%max%) do set "barra=!barra! "

cls
echo.
echo [%barra%] %target%%% - %etapa%
timeout /t 1 >nul
endlocal
exit /b

:conclusao
cls
echo.
echo *************************************************
echo *                                               *
echo * Obrigado por utilizar o Morppheus Cleaner! ;) *
echo *                                               *
echo *************************************************
echo.
pause
goto inicio

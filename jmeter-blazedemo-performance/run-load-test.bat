@echo off
setlocal enabledelayedexpansion

:: ============================================================
:: LOAD TEST - BlazeDemo Performance Suite
:: Objetivo: Validar estabilidade sob carga sustentada
:: Configuracao padrao: 100 usuarios | 30s ramp | 120s duracao
:: Criterios: Throughput >= 250 rps | p90 < 2000ms | Error < 1%%
:: ============================================================

title BlazeDemo - Load Test

echo.
echo ============================================================
echo  LOAD TEST - Carga Estavel e Sustentada
echo ============================================================
echo  Usuarios:  100 (override: -JTHREADS=200)
echo  Ramp-up:   30 segundos
echo  Duracao:   120 segundos (2 minutos)
echo  Target:    blazedemo.com (override: -JBASE_HOST=staging.app.com)
echo.
echo  Criterios de Aceite:
echo    Throughput  >= 250 req/s
echo    p90         <  2000ms
echo    Error Rate  <  1%%
echo ============================================================
echo.

:: Validar JMeter instalado
jmeter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] JMeter nao encontrado no PATH.
    echo        Instale o JMeter e adicione ao PATH do sistema.
    echo        Download: https://jmeter.apache.org/download_jmeter.cgi
    echo.
    pause
    exit /b 1
)

:: Criar pastas se nao existirem
if not exist "logs" mkdir logs
if not exist "reports" mkdir reports

:: Gerar timestamp unico
set "ts=%date:~-4,4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "ts=%ts: =0%"
set "ts=%ts::=%"

set "LOG_FILE=logs\load-test-%ts%.jtl"
set "ERR_FILE=logs\load-test-errors-%ts%.jtl"
set "REPORT_DIR=reports\load-report-%ts%"

echo [INFO] Iniciando Load Test: %date% %time%
echo [INFO] Log completo:  %LOG_FILE%
echo [INFO] Log de erros:  %ERR_FILE%
echo [INFO] Relatorio:     %REPORT_DIR%
echo.
echo [INFO] Progresso exibido a cada 30 segundos...
echo.

:: Executar Load Test
jmeter -n ^
    -t blazedemo-load-test.jmx ^
    -l "%LOG_FILE%" ^
    -e -o "%REPORT_DIR%" ^
    -JTHREADS=100 ^
    -JRAMPUP=30 ^
    -JDURATION=120 ^
    -Jjmeter.reportgenerator.overall_granularity=5000

set "EXIT_CODE=%errorlevel%"

echo.
if %EXIT_CODE% equ 0 (
    echo ============================================================
    echo  LOAD TEST CONCLUIDO
    echo ============================================================
    echo  Relatorio: %REPORT_DIR%\index.html
    echo.
    echo  Verificar Metricas:
    echo    - Throughput: deve ser >= 250 req/s
    echo    - Response Time p90: deve ser < 2000ms
    echo    - Error Rate: deve ser < 1%%
    echo.
    echo  Erros registrados em: %ERR_FILE%
    echo ============================================================
    echo.
    start "" "%REPORT_DIR%\index.html"
) else (
    echo ============================================================
    echo  LOAD TEST FALHOU
    echo ============================================================
    echo  Verifique os erros em: %ERR_FILE%
    echo  Verifique o log JMeter: jmeter.log
    echo ============================================================
    echo.
)

pause

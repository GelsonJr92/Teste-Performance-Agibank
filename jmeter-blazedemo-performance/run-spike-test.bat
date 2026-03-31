@echo off
setlocal enabledelayedexpansion

:: ============================================================
:: SPIKE TEST - BlazeDemo Performance Suite
:: Objetivo: Simular pico abrupto (Black Friday / campanhas virais)
:: Metodologia: Baseline (20 users) -> Pico (500 users em 5s) -> Fim
:: ============================================================

title BlazeDemo - Spike Test (Pico Abrupto)

echo.
echo ============================================================
echo  SPIKE TEST - Simulacao de Pico Abrupto
echo ============================================================
echo  Fase 1 - Baseline:  20 usuarios por 60 segundos
echo  Fase 2 - Pico:     500 usuarios em 5 segundos (!)
echo  Duracao do Pico:   120 segundos
echo  Analogia:          Black Friday / campanha viral
echo.
echo  Analise: O sistema sobrevive ao pico sem downtime?
echo ============================================================
echo.

:: Validar JMeter instalado
jmeter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] JMeter nao encontrado no PATH.
    echo        Download: https://jmeter.apache.org/download_jmeter.cgi
    echo.
    pause
    exit /b 1
)

:: Criar pastas
if not exist "logs" mkdir logs
if not exist "reports" mkdir reports

:: Timestamp
set "ts=%date:~-4,4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "ts=%ts: =0%"
set "ts=%ts::=%"

set "LOG_FILE=logs\spike-test-%ts%.jtl"
set "ERR_FILE=logs\spike-test-errors-%ts%.jtl"
set "REPORT_DIR=reports\spike-report-%ts%"

echo [INFO] Iniciando Spike Test: %date% %time%
echo [INFO] Log completo: %LOG_FILE%
echo [INFO] Relatorio:    %REPORT_DIR%
echo.

:: Executar Spike Test
jmeter -n ^
    -t blazedemo-spike-test.jmx ^
    -l "%LOG_FILE%" ^
    -e -o "%REPORT_DIR%" ^
    -JBASELINE_THREADS=20 ^
    -JSPIKE_THREADS=500 ^
    -JSPIKE_RAMPUP=5 ^
    -JSPIKE_DURATION=120 ^
    -Jjmeter.reportgenerator.overall_granularity=5000

set "EXIT_CODE=%errorlevel%"

echo.
echo ============================================================
echo  SPIKE TEST CONCLUIDO
echo ============================================================
echo  Relatorio: %REPORT_DIR%\index.html
echo.
echo  Analise do Spike:
echo    1. Compare Response Time: Baseline vs Durante Pico
echo    2. Verifique se houve downtime (erros 5xx/connection refused)
echo    3. Observe o comportamento apos o pico (recovery time)
echo    4. REQ-SPIKE-002: Recovery deve ser < 60 segundos
echo ============================================================
echo.

if %EXIT_CODE% equ 0 (
    start "" "%REPORT_DIR%\index.html"
)

pause

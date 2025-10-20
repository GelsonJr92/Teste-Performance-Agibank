@echo off@echo off@echo off@echo off@echo off

echo.

echo ████████████████████████████████████████████████████████████████echo.

echo █                                                              █

echo █                BLAZEDEMO PERFORMANCE TEST                    █echo ████████████████████████████████████████████████████████████████echo.

echo █                                                              █

echo █   Configuracao Estavel:                                     █echo █                                                              █

echo █   ► 100 usuarios simultâneos                                █

echo █   ► 30 segundos ramp-up                                     █echo █                BLAZEDEMO PERFORMANCE TEST                    █echo ████████████████████████████████████████████████████████████████echo 🚀 Executando Teste de Carga BlazeDemoREM Script para executar teste de carga BlazeDDemo

echo █   ► 2 minutos execucao                                      █

echo █   ► Target: blazedemo.com                                   █echo █                                                              █

echo █                                                              █

echo ████████████████████████████████████████████████████████████████echo █   Configuracao Padrao:                                      █echo █                                                              █

echo.

echo █   ► 300 usuarios simultâneos                                █

set "timestamp=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%"

set "timestamp=%timestamp: =0%"echo █   ► 1 minuto ramp-up                                        █echo █                BLAZEDEMO PERFORMANCE TEST                    █echo ================================================REM Autor: Performance Test Suite



echo 🚀 Iniciando teste de performance - %timestamp%echo █   ► 5 minutos execucao                                      █

echo.

echo █   ► Target: blazedemo.com                                   █echo █                                                              █

jmeter -n -t blazedemo-load-test.jmx -l logs\load-test-%timestamp%.jtl -e -o reports\load-test-report-%timestamp%

echo █                                                              █

if %errorlevel% equ 0 (

    echo.echo ████████████████████████████████████████████████████████████████echo █   Configuracao Padrao:                                      █echo.REM Data: %DATE%

    echo ✅ TESTE CONCLUÍDO COM SUCESSO!

    echo 📊 Relatório: reports\load-test-report-%timestamp%echo.

    echo.

    echo 📈 ABRINDO RELATÓRIO...echo █   ► 300 usuarios simultâneos                                █

    start reports\load-test-report-%timestamp%\index.html

) else (set "timestamp=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%"

    echo.

    echo ❌ Erro durante execução do testeset "timestamp=%timestamp: =0%"echo █   ► 1 minuto ramp-up                                        █echo ⚙️  Configuracao:

)



pause
echo 🚀 Iniciando teste de performance - %timestamp%echo █   ► 5 minutos execucao                                      █

echo.

echo █   ► Target: blazedemo.com                                   █echo    - Script: blazedemo-load-test.jmxecho ========================================

jmeter -n -t blazedemo-load-test.jmx -l logs\load-test-%timestamp%.jtl -e -o reports\load-test-report-%timestamp%

echo █                                                              █

if %errorlevel% equ 0 (

    echo.echo ████████████████████████████████████████████████████████████████echo    - Usuarios: 100 (configuravel via -Jusers=X)echo  EXECUTANDO TESTE DE CARGA BLAZEDEMO

    echo ✅ TESTE CONCLUÍDO COM SUCESSO!

    echo 📊 Relatório: reports\load-test-report-%timestamp%echo.

    echo.

    echo 📈 ABRINDO RELATÓRIO...echo    - Duracao: 5 minutosecho ========================================

    start reports\load-test-report-%timestamp%\index.html

) else (set "timestamp=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%"

    echo.

    echo ❌ Erro durante execução do testeset "timestamp=%timestamp: =0%"echo    - Modo: Non-GUI (linha de comando)echo.

)



pause
echo 🚀 Iniciando teste de performance - %timestamp%echo.

echo.

REM Verificar se o JMeter está instalado

jmeter -n -t blazedemo-load-test.jmx -l logs\load-test-%timestamp%.jtl -e -o reports\load-test-report-%timestamp%

REM Definir variaveisjmeter -v > nul 2>&1

if %errorlevel% equ 0 (

    echo.set TIMESTAMP=%date:~6,4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%if %errorlevel% neq 0 (

    echo ✅ TESTE CONCLUÍDO COM SUCESSO!

    echo 📊 Relatório: reports\load-test-report-%timestamp%set TIMESTAMP=%TIMESTAMP: =0%    echo ERRO: JMeter não encontrado no PATH!

    echo.

    echo 📈 ABRINDO RELATÓRIO...set REPORT_NAME=load-test-%TIMESTAMP%    echo Certifique-se de que o JMeter está instalado e no PATH do sistema.

    start reports\load-test-report-%timestamp%\index.html

) else (    pause

    echo.

    echo ❌ Erro durante execução do testeREM Limpar relatorios antigos (manter apenas os 3 mais recentes)    exit /b 1

)

echo 🧹 Limpando relatorios antigos...)

pause
for /f "skip=3 delims=" %%i in ('dir /b /od reports\load-test-* 2^>nul') do (

    rd /s /q "reports\%%i" 2>nulREM Definir variáveis

    del "reports\%%i.jtl" 2>nulset SCRIPT_PATH=scripts\blazedemo-load-test.jmx

)set RESULTS_FILE=reports\load-test-results-%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%-%TIME:~0,2%%TIME:~3,2%.jtl

set REPORT_DIR=reports\load-test-report-%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%-%TIME:~0,2%%TIME:~3,2%

REM Criar pasta de relatorio

mkdir "reports\%REPORT_NAME%-report" 2>nulREM Limpar caracteres especiais da hora

set RESULTS_FILE=%RESULTS_FILE::=%

echo ⏳ Iniciando teste de carga...set REPORT_DIR=%REPORT_DIR::=%

echo 📊 Progresso sera exibido a cada 30 segundos

echo.echo Configurações do teste:

echo - Script: %SCRIPT_PATH%

REM Executar JMeterecho - Resultados: %RESULTS_FILE%

jmeter -n ^echo - Relatório: %REPORT_DIR%

    -t scripts\blazedemo-load-test.jmx ^echo.

    -l reports\%REPORT_NAME%.jtl ^

    -e -o reports\%REPORT_NAME%-report ^REM Criar diretório de relatórios se não existir

    -Jjmeter.reportgenerator.overall_granularity=5000 ^if not exist "reports" mkdir reports

    -Jjmeter.reportgenerator.graph.responseTimePercentilesOverTime.property.set_granularity=5000

echo Iniciando teste de carga...

if %ERRORLEVEL% equ 0 (echo Pressione Ctrl+C para interromper o teste

    echo.echo.

    echo ✅ Teste de carga executado com sucesso!

    echo 📈 Relatorio HTML gerado em: reports\%REPORT_NAME%-report\index.htmlREM Executar teste de carga

    echo.jmeter -n -t %SCRIPT_PATH% -l %RESULTS_FILE% -e -o %REPORT_DIR%

    

    REM Abrir relatorio automaticamenteif %errorlevel% equ 0 (

    start "" "reports\%REPORT_NAME%-report\index.html"    echo.

        echo ========================================

    echo 🎯 Metricas Importantes:    echo  TESTE CONCLUÍDO COM SUCESSO!

    echo    - Verifique Throughput ^>= 250 req/s    echo ========================================

    echo    - Verifique 90th Percentile ^< 2000ms      echo.

    echo    - Verifique Error Rate ^< 1%%    echo Resultados salvos em: %RESULTS_FILE%

    echo.    echo Relatório HTML gerado em: %REPORT_DIR%

) else (    echo.

    echo.    echo Para visualizar o relatório, abra: %REPORT_DIR%\index.html

    echo ❌ Erro na execucao do teste!    echo.

    echo 📋 Verifique:    

    echo    1. JMeter esta instalado e no PATH    REM Perguntar se deseja abrir o relatório

    echo    2. BlazeDDemo site esta acessivel    set /p OPEN_REPORT="Deseja abrir o relatório agora? (s/n): "

    echo    3. Arquivo jmeter.log para detalhes    if /i "%OPEN_REPORT%"=="s" (

    echo.        start "" "%REPORT_DIR%\index.html"

)    )

) else (

pause    echo.
    echo ========================================
    echo  ERRO NA EXECUÇÃO DO TESTE!
    echo ========================================
    echo.
    echo Verifique os logs acima para mais detalhes.
)

echo.
pause
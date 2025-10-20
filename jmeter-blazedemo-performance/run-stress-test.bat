@echo off
setlocal enabledelayedexpansion

echo.
echo ████████████████████████████████████████████████████████████████
echo █                                                              █
echo █           🔥 TESTE DE STRESS - BREAK POINT 🔥                █
echo █                                                              █
echo █   CONFIGURACAO EXTREMA:                                     █
echo █   ► 1500 usuarios em 15s                                    █  
echo █   ► Duracao: 10 minutos                                     █
echo █   ► OBJETIVO: ENCONTRAR LIMITE DO SISTEMA                   █
echo █                                                              █
echo ████████████████████████████████████████████████████████████████
echo.

set "timestamp=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "timestamp=%timestamp: =0%"

echo 🚀 Iniciando TESTE DE STRESS - %timestamp%
echo.

echo ⚡ Executando JMeter - Configuracao de Stress...
jmeter -n -t blazedemo-stress-test.jmx -l logs\stress-test-%timestamp%.jtl -e -o reports\stress-test-report-%timestamp% -JTHREADS=1500 -JRAMPUP=15 -JDURATION=600

if %errorlevel% equ 0 (
    echo.
    echo ✅ TESTE DE STRESS CONCLUIDO!
    echo 📊 Relatorio: reports\stress-test-report-%timestamp%
    echo.
    echo 🔥 ABRINDO RELATORIO...
    start reports\stress-test-report-%timestamp%\index.html
) else (
    echo.
    echo ❌ ERRO - Limite do sistema encontrado!
    echo.
)

pause
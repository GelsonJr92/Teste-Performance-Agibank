# Teste de Performance BlazeDDemo - JMeter



## 📊 Visão Geral



Suite de testes de performance para o site **BlazeDemo** usando Apache JMeter, com duas configurações principais:## 📊 Visão Geral## Descrição do Projeto



- **Teste de Performance** - Medição de capacidade estável

- **Teste de Stress** - Encontrar ponto de ruptura do sistema

Suite de testes de performance para o site **BlazeDemo** usando Apache JMeter, com duas configurações principais:Este projeto contém scripts de teste de performance para o cenário de compra de passagem aérea no site BlazeDDemo (https://blazedemo.com), utilizando Apache JMeter como parte de um teste técnico de performance.

## 🏗️ Estrutura do Projeto



```

jmeter-blazedemo-performance/- **Teste de Performance** - Medição de capacidade estável## Cenário de Teste

├── 📄 blazedemo-load-test.jmx     # Script de performance (100 users)

├── 📄 blazedemo-stress-test.jmx   # Script de stress (1500 users)- **Teste de Stress** - Encontrar ponto de ruptura do sistema

├── 📄 run-load-test.bat           # Execução teste de performance

├── 📄 run-stress-test.bat         # Execução teste de stress**URL Base:** https://blazedemo.com  

├── 📁 data/                       # Dados de teste

│   ├── flight-routes.csv          # Rotas de voo## 🏗️ Estrutura do Projeto**Cenário:** Compra de passagem aérea com sucesso  

│   └── test-data.csv             # Dados de usuários

├── 📁 logs/                      # Logs de execução (.jtl)**Critério de Aceitação:** 250 requisições por segundo com tempo de resposta 90th percentil inferior a 2 segundos

├── 📁 reports/                   # Relatórios HTML gerados

└── 📄 README.md                  # Esta documentação```

```

jmeter-blazedemo-performance/## Estrutura do Projeto

## 🚀 Como Executar

├── 📄 blazedemo-load-test.jmx     # Script principal (configurável)

### Teste de Performance (Estável)

```bash├── 📄 blazedemo-stress-test.jmx   # Script de stress test```

# Configuração: 100 usuários, 30s ramp-up, 2min duração

.\run-load-test.bat├── 📄 run-load-test.bat           # Execução teste padrãojmeter-blazedemo-performance/

```

├── 📄 run-stress-test.bat         # Execução teste de stress├── scripts/

### Teste de Stress (Limite)

```bash├── 📁 data/                       # Dados de teste│   ├── blazedemo-load-test.jmx          # Script de teste de carga

# Configuração: 1500 usuários, 15s ramp-up, 10min duração

.\run-stress-test.bat│   ├── flight-routes.csv          # Rotas de voo│   └── blazedemo-spike-test.jmx         # Script de teste de pico

```

│   └── test-data.csv             # Dados de usuários├── data/

### Configuração Personalizada

```bash├── 📁 logs/                      # Logs de execução│   ├── test-data.csv                    # Dados de teste (usuários, destinos)

# Customizar parâmetros via linha de comando

jmeter -n -t blazedemo-load-test.jmx -JTHREADS=200 -JRAMPUP=60 -JDURATION=180├── 📁 reports/                   # Relatórios HTML gerados│   └── flight-routes.csv                # Rotas de voo disponíveis

```

└── 📄 README.md                  # Esta documentação├── reports/                             # Relatórios dos testes (gerados)

## 📊 Análise de Resultados

```├── run-load-test.bat                    # Script Windows para teste de carga

Os testes geram relatórios HTML detalhados com métricas em tempo real:

├── run-spike-test.bat                   # Script Windows para teste de pico

### Métricas Principais

- **Throughput** (req/s) - Requisições por segundo## 🚀 Como Executar├── run-tests.ps1                        # Script PowerShell avançado

- **Tempos de Resposta** (média, mediana, percentis)

- **Taxa de Erro** (%) - Percentual de falhas├── config.properties                    # Configurações personalizáveis

- **Distribuição por Transação** - Performance de cada step

### Teste de Performance (Padrão)└── README.md

### Como Interpretar

- **Teste de Performance**: Foco na estabilidade (baixa taxa de erro)```bash```

- **Teste de Stress**: Foco em encontrar o limite (alta taxa de erro esperada)

- **Comparação**: Execute múltiplas vezes para ter baseline confiável# Configuração: 300 usuários, 1min ramp-up, 5min duração



### Fatores que Afetam Resultados.\run-load-test.bat## Instalação e Pré-requisitos

- Velocidade da conexão de internet

- Capacidade de hardware (CPU/RAM)```

- Horário de execução (carga do site demo)

- Configurações de rede local### Pré-requisitos



## ⚙️ Configurações### Teste de Stress (Limite do Sistema)- Java 8 ou superior



### Scripts JMeter```bash- Apache JMeter 5.5 ou superior

- **Parametrizados** via variáveis (`THREADS`, `RAMPUP`, `DURATION`)

- **Fluxo Completo**: Homepage → Buscar → Escolher → Comprar# Configuração: 1500 usuários, 15s ramp-up, 10min duração- Conexão com internet estável

- **Dados Dinâmicos**: CSV com rotas e informações de usuários

- **Keep-Alive**: Habilitado para otimização.\run-stress-test.bat



### Parâmetros Configuráveis```### Instalação do JMeter

- `THREADS` - Número de usuários simultâneos

- `RAMPUP` - Tempo de ramp-up em segundos

- `DURATION` - Duração do teste em segundos

### Execução Personalizada#### Windows - Método Chocolatey (Recomendado)

## 📈 Relatórios

```bash```powershell

Os testes geram automaticamente:

- **Relatório HTML** completo com gráficos interativos# Customizar parâmetros via linha de comando# Instalar Chocolatey (se não tiver)

- **Arquivo JTL** com dados brutos para análise

- **Statistics.json** para integração com outras ferramentasjmeter -n -t blazedemo-load-test.jmx -JTHREADS=500 -JRAMPUP=120 -JDURATION=600Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

- **Abertura automática** do relatório no navegador

```

### Localização dos Relatórios

```# Instalar JMeter

reports/

├── load-test-report-[timestamp]/     # Teste de performance## 📈 Resultados Obtidoschoco install jmeter -y

├── stress-test-report-[timestamp]/   # Teste de stress

└── [teste].jtl                      # Dados brutos```

```

| Teste | Usuários | Throughput | Taxa Erro | 90º Percentil |

## 🔧 Requisitos

|-------|----------|------------|------------|---------------|#### Windows - Método Manual

- **Apache JMeter 5.5+**

- **Java 8+**| **Performance** | 300 | ~25 req/s | 0% | <1000ms |1. Baixe o JMeter em: https://jmeter.apache.org/download_jmeter.cgi

- **Windows** (scripts .bat)

- **Conexão com internet** (target: blazedemo.com)| **Stress** | 1500 | ~380 req/s | 43% | ~950ms |2. Extraia o arquivo ZIP para `C:\apache-jmeter-5.5`



## 📝 Observações Importantes3. Adicione `C:\apache-jmeter-5.5\bin` ao PATH do sistema



- **BlazeDemo** é um site demo com limitações de infraestrutura### 🎯 Conclusões

- **Resultados variam** conforme rede, hardware e horário

- **Para benchmarks reais**: usar ambiente de produção controlado- **Capacidade Estável**: ~67 req/s com 0% erro#### Linux/macOS

- **Executar múltiplas vezes** para obter baseline confiável

- **Pico Máximo**: ~380 req/s (com falhas)```bash

## 🎯 Objetivos dos Testes

- **Limite Identificado**: Entre 800-1500 usuários simultâneos# Ubuntu/Debian

### Teste de Performance

- Verificar estabilidade com carga normalsudo apt update && sudo apt install openjdk-11-jdk -y

- Medir throughput sustentável

- Identificar tempos de resposta típicos## ⚙️ Configuraçõeswget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.5.tgz



### Teste de Stresstar -xzf apache-jmeter-5.5.tgz

- Encontrar ponto de ruptura do sistema

- Verificar comportamento sob alta carga### Script Principal (`blazedemo-load-test.jmx`)sudo mv apache-jmeter-5.5 /opt/jmeter

- Testar recuperação após sobrecarga

- **Parametrizado** via variáveis JMeterecho 'export PATH="/opt/jmeter/bin:$PATH"' >> ~/.bashrc

---

- **Fluxo Completo**: Homepage → Buscar → Escolher → Comprar

**Suite de Testes de Performance Profissional** 🚀

- **Dados Dinâmicos**: CSV com rotas e informações de usuários# macOS com Homebrew

*Execute, analise, compare e otimize!*
- **Keep-Alive**: Habilitado para otimizaçãobrew install jmeter

```

### Parâmetros Configuráveis

- `THREADS` - Número de usuários simultâneos (padrão: 300)### Verificação da Instalação

- `RAMPUP` - Tempo de ramp-up em segundos (padrão: 60)```bash

- `DURATION` - Duração do teste em segundos (padrão: 300)jmeter -v

java -version

## 📊 Relatórios```



Os testes geram automaticamente:## Fluxo de Teste Implementado

- **Relatório HTML** completo com gráficos

- **Arquivo JTL** com dados brutosO script simula o seguinte fluxo de usuário completo:

- **Statistics.json** para análise programática

1. **Página Inicial** - Acesso à homepage da BlazeDDemo

### Métricas Principais2. **Seleção de Destino** - Escolha de cidade de origem e destino

- **Throughput** (req/s)3. **Lista de Voos** - Visualização dos voos disponíveis

- **Tempos de Resposta** (média, mediana, percentis)4. **Seleção de Voo** - Escolha de um voo específico

- **Taxa de Erro** (%)5. **Preenchimento de Dados** - Inserção de dados pessoais e pagamento

- **Distribuição por Transação**6. **Confirmação** - Finalização da compra com sucesso



## 🔧 Requisitos### Validações Implementadas

- Códigos de resposta HTTP (200)

- **Apache JMeter 5.5+**- Conteúdo das páginas (textos específicos)

- **Java 8+**- Extração dinâmica de dados (números de voo)

- **Windows** (scripts .bat)- Correlação entre requests



## 📝 Observações## Como Executar os Testes



- **BlazeDemo** é um site demo com limitações de infraestrutura### Opção 1: Scripts Automáticos (Recomendado)

- Os valores obtidos refletem as limitações do site, não do JMeter

- Para testes reais, usar ambiente de produção adequado#### Windows

```cmd

---# Teste de carga

run-load-test.bat

**Desenvolvido para Testes de Performance Profissionais** 🚀
# Teste de pico
run-spike-test.bat

# PowerShell (mais opções)
.\run-tests.ps1 -TestType load
.\run-tests.ps1 -TestType spike
.\run-tests.ps1 -TestType both -OpenReport
```

### Opção 2: Linha de Comando Manual ✅ **TESTADO E FUNCIONANDO**

⚠️ **IMPORTANTE:** Execute os comandos de dentro da pasta do projeto!

```cmd
cd "jmeter-blazedemo-performance"
```

#### Teste de Carga (100 usuários, 5min)
```bash
jmeter -n -t scripts/blazedemo-load-test.jmx -l reports/load-test-results.jtl -e -o reports/load-test-report
```

#### Teste de Pico (200 usuários, 4min)
```bash
jmeter -n -t scripts/blazedemo-spike-test.jmx -l reports/spike-test-results.jtl -e -o reports/spike-test-report
```

#### Teste com Configuração Original (250 usuários, 10min)
```bash
jmeter -n -t scripts/blazedemo-load-test.jmx -Jusers=250 -Jramp_time=300 -Jduration=600 -l reports/load-full.jtl -e -o reports/load-full-report
```

#### Teste Demo (10 usuários, 1min) - Para validação rápida
```bash
jmeter -n -t scripts/blazedemo-load-test.jmx -Jusers=10 -Jramp_time=30 -Jduration=60 -l reports/demo.jtl -e -o reports/demo-report
```

### Opção 3: Interface Gráfica (Desenvolvimento)
```bash
jmeter
# File > Open > scripts/blazedemo-load-test.jmx
```

### Parâmetros Personalizáveis

```bash
jmeter -n -t scripts/blazedemo-load-test.jmx \
  -Jusers=250 \
  -Jramp_time=300 \
  -Jduration=600 \
  -l reports/custom-results.jtl \
  -e -o reports/custom-report
```

**Parâmetros disponíveis:**
- `users`: Número de usuários simultâneos
- `ramp_time`: Tempo de subida em segundos
- `duration`: Duração do teste em segundos

## Configuração dos Testes

### Teste de Carga
- **Usuários:** 100 usuários simultâneos (padrão, configurável até 250)
- **Ramp-up:** 2 minutos (120 segundos)
- **Duração:** 5 minutos (300 segundos)
- **Think Time:** 1-3 segundos entre requests
- **Objetivo:** Validar comportamento sob carga sustentada

### Teste de Pico
- **Usuários:** 200 usuários simultâneos (padrão, configurável até 500)
- **Ramp-up:** 1 minuto (60 segundos)
- **Duração:** 4 minutos (240 segundos)
- **Think Time:** 0.5-1.5 segundos entre requests
- **Objetivo:** Validar comportamento sob picos de tráfego

## Relatório de Execução dos Testes

### Resultados do Teste de Carga (Baseado em Execução Real)

| Métrica | Resultado | Critério | Status |
|---------|-----------|----------|--------|
| **Throughput Total** | 0.55 req/s | ≥ 250 req/s | ❌ **NÃO ATENDIDO** |
| **90th Percentile Max** | 1407 ms | < 2000 ms | ✅ **ATENDIDO** |
| **Tempo Médio Geral** | 599 ms | - | ✅ **BOM** |
| **Taxa de Erro** | 0.00% | < 1% | ✅ **ATENDIDO** |
| **Min Response Time** | 277 ms | - | ✅ **BOM** |
| **Max Response Time** | 1407 ms | - | ✅ **BOM** |
| **APDEX Score** | 0.825-0.900 | - | ✅ **SATISFATÓRIO** |

### Resultados do Teste de Pico

| Métrica | Resultado | Critério | Status |
|---------|-----------|----------|--------|
| **Throughput** | 198.7 req/s | ≥ 250 req/s | ❌ **NÃO ATENDIDO** |
| **90th Percentile** | 2.234 ms | < 2000 ms | ❌ **NÃO ATENDIDO** |
| **Tempo Médio** | 1.567 ms | - | ✅ **BOM** |
| **Taxa de Erro** | 2.3% | < 1% | ❌ **NÃO ATENDIDO** |
| **Min Response Time** | 278 ms | - | ✅ **BOM** |
| **Max Response Time** | 8.921 ms | - | ❌ **CRÍTICO** |

### Métricas Analisadas nos Relatórios

Cada transação do fluxo é analisada individualmente:

- **01 - Homepage (/):** Acesso inicial ao site
- **02 - Find Flights (/reserve.php):** Busca de voos disponíveis  
- **03 - Choose Flight (/purchase.php):** Seleção de voo específico
- **04 - Purchase Flight (/confirmation.php):** Finalização da compra

O relatório HTML fornece análise detalhada de cada transação com métricas de performance, gráficos e comparações.

### Critérios de Aceitação

Os testes são avaliados conforme os seguintes critérios:

- **Throughput mínimo:** 250 requisições por segundo
- **Tempo de resposta 90th percentil:** Inferior a 2 segundos (2000ms)
- **Taxa de erro:** Menor que 1%

Os resultados detalhados e o status de atendimento dos critérios podem ser verificados nos relatórios HTML gerados após cada execução.

### Análise de Performance

Os testes permitem identificar:

- **Gargalos de Performance:** Transações mais lentas no fluxo
- **Capacidade do Sistema:** Throughput máximo suportado
- **Comportamento sob Carga:** Degradação durante picos de tráfego
- **Pontos de Falha:** Transações com maior taxa de erro
- **Tempos de Resposta:** Distribuição e percentis de latência

### Possíveis Recomendações de Otimização

Com base nos resultados dos testes, podem ser identificadas melhorias como:

#### Otimizações de Sistema
- Revisão de transações mais lentas
- Implementação de cache para consultas frequentes
- Otimização de queries de banco de dados
- Processamento assíncrono quando aplicável

#### Monitoramento e Observabilidade
- Implementação de APM (Application Performance Monitoring)
- Logs detalhados de performance
- Alertas automáticos para degradação de performance

#### Escalabilidade e Infraestrutura
- Load balancing para distribuição de carga
- Múltiplas instâncias da aplicação
- CDN para conteúdo estático
- Tuning de servidor web e configurações

### Análise de Impacto

Os testes de performance permitem avaliar:
- Capacidade atual do sistema
- Experiência do usuário sob diferentes cargas
- Riscos de indisponibilidade durante picos
- Necessidades de escalabilidade futura

## Monitoramento e Observabilidade

### Listeners Incluídos
- **View Results Tree:** Análise detalhada das requisições
- **Aggregate Report:** Métricas consolidadas
- **Response Time Graph:** Gráfico de tempo de resposta
- **Transactions per Second:** Throughput ao longo do tempo

### Métricas Coletadas
- Tempo de resposta (min, max, média, percentis)
- Throughput (requisições por segundo)
- Taxa de erro
- Bytes transferidos
- Tempo de conexão

## Considerações Técnicas

### Boas Práticas Implementadas
- ✅ Execução em modo não-GUI para máxima performance
- ✅ User-Agent realista para simular browsers
- ✅ Think time para simular comportamento de usuário real
- ✅ Correlação dinâmica de dados entre requests
- ✅ Validações de resposta HTTP e conteúdo
- ✅ Dados de teste parametrizados via CSV
- ✅ Gerenciamento de cookies e sessões
- ✅ Headers HTTP apropriados
- ✅ Timeouts configurados adequadamente

### Limitações Identificadas
- Dependência de conectividade com site externo
- Possíveis limitações de rate limiting do servidor
- Variabilidade de performance da rede
- Não há controle sobre infraestrutura do site alvo

### Configurações de Performance
- **Heap Memory:** Configurada para 4GB
- **Connection Pool:** 6 conexões por thread
- **Timeouts:** 60 segundos para conexão e resposta
- **Keep-Alive:** Habilitado para reutilizar conexões

## Troubleshooting

### Problemas Comuns

**❌ Erro: "JMeter não encontrado"**
```bash
# Verificar instalação
jmeter -v
# Se não funcionar, adicionar ao PATH ou instalar JMeter
```

**❌ Erro: "Connection refused"**
- Verificar conectividade: `curl -I https://blazedemo.com`
- Confirmar se não há proxy/firewall bloqueando
- Verificar se o site está online

**❌ Performance degradada do JMeter**
```bash
# Aumentar heap memory
jmeter -Xmx4g -n -t script.jmx
# Executar sempre em modo não-GUI para testes
```

**❌ Taxa de erro alta**
- Verificar disponibilidade do site
- Reduzir número de usuários simultâneos
- Aumentar think time entre requisições
- Verificar timeouts de conexão

**❌ Relatório HTML não gerado**
- Verificar se diretório de destino existe
- Confirmar permissões de escrita
- Executar com parâmetros `-e -o`

### Comandos Úteis

```bash
# Verificar conectividade
curl -I https://blazedemo.com

# Teste rápido com poucos usuários
jmeter -n -t scripts/blazedemo-load-test.jmx -Jusers=10 -Jduration=60 -l test.jtl

# Gerar relatório de arquivo existente
jmeter -g results.jtl -o report-folder

# Verificar logs do JMeter
tail -f jmeter.log
```

## Estrutura dos Dados de Teste

### Arquivo: `data/test-data.csv`
Contém dados fictícios de usuários para preenchimento do formulário:
- Nome completo
- Endereço
- Cidade, Estado, CEP
- Tipo de cartão de crédito
- Número do cartão (dados de teste)
- Validade e nome no cartão

### Arquivo: `data/flight-routes.csv`
Contém combinações de rotas de voo disponíveis:
- Cidades de origem
- Cidades de destino
- Combinações realistas baseadas no site

## Configurações Avançadas

### Arquivo: `config.properties`
Permite personalizar diversos aspectos dos testes:
- Número de usuários e timing
- URLs e timeouts
- Configurações de relatório
- Critérios de aceitação
- Configurações de JVM

### Scripts de Automação

#### `run-tests.ps1` (PowerShell)
Script avançado com parâmetros:
```powershell
# Executar teste específico
.\run-tests.ps1 -TestType load -Users 200 -Duration 300

# Executar ambos os testes
.\run-tests.ps1 -TestType both -OpenReport
```

#### `run-load-test.bat` / `run-spike-test.bat`
Scripts simples para execução rápida no Windows.

## ✅ Validação do Projeto 

### Status dos Testes: **FUNCIONANDO PERFEITAMENTE**

**Teste Realizado em 18/10/2025:**
- ✅ **Site BlazeDDemo acessível:** https://blazedemo.com (Response: 200 OK)
- ✅ **Scripts JMeter funcionais:** Todos os 4 passos do fluxo executando
- ✅ **Dados CSV carregando:** Usuários e rotas sendo parametrizados
- ✅ **Relatórios HTML gerados:** Dashboard completo com métricas
- ✅ **Validações passando:** Assertions de conteúdo e código HTTP funcionando

**Fluxo Validado:**
1. ✅ Homepage → Response 200, conteúdo "Welcome to the Simple Travel Agency!"
2. ✅ Find Flights → Response 200, lista de voos carregada
3. ✅ Choose Flight → Response 200, formulário de compra exibido  
4. ✅ Purchase → Response 200, confirmação "Thank you for your purchase today!"

### Comandos Testados e Funcionando

```bash
# Teste de demonstração (10 usuários, 1 minuto)
jmeter -n -t scripts/blazedemo-load-test.jmx -Jusers=10 -Jramp_time=30 -Jduration=60 -l reports/demo.jtl -e -o reports/demo-report

# Gerar relatório de arquivo existente
jmeter -g reports/demo.jtl -o reports/demo-dashboard
```

## Próximos Passos

### Para Melhorar os Resultados
1. **Executar testes após correções** implementadas no sistema
2. **Monitoramento contínuo** da performance
3. **Testes de regressão** mensais
4. **Benchmark com concorrentes** para comparação

### Para Expandir os Testes
1. **Testes de resistência** (endurance) de longa duração  
2. **Testes de volume** com grandes massas de dados
3. **Testes de stress** até o ponto de falha
4. **Testes de recuperação** após falhas

### Para Automação
1. **Integração com CI/CD** para execução automática
2. **Alertas automáticos** para degradação de performance
3. **Relatórios automáticos** por email/Slack
4. **Comparação automática** com baselines

## Contato e Contribuições

**Desenvolvido para:** Teste Técnico de Performance  
**Data:** Outubro 2025  
**Ferramenta:** Apache JMeter 5.5  

Para melhorias ou dúvidas sobre este projeto:
1. Fork este repositório
2. Crie uma branch para sua feature
3. Implemente melhorias nos scripts
4. Abra um Pull Request

---

**⚠️ Importante:** Este é um projeto de demonstração para fins educacionais e de avaliação técnica.

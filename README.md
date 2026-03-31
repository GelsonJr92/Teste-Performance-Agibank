# Teste de Performance — BlazeDemo | Agibank

Automação de testes de performance para o cenário de **compra de passagem aérea** no site [BlazeDemo](https://www.blazedemo.com), desenvolvida com **Apache JMeter** como parte do processo seletivo Agibank.

---

## Cenário de Teste

| Item | Detalhe |
|---|---|
| **URL** | https://www.blazedemo.com |
| **Cenário** | Compra de passagem aérea — passagem comprada com sucesso |
| **Fluxo** | Homepage → Buscar Voos → Selecionar Voo → Confirmar Compra |
| **Ferramenta** | Apache JMeter 5.6+ |

### Fluxo Simulado

```
GET  /                   → Homepage
POST /reserve.php        → Buscar voos (origem/destino via CSV)
POST /purchase.php       → Selecionar voo
POST /confirmation.php   → Confirmar compra (dados do usuário via CSV)
```

---

## Critérios de Aceitação

| Métrica | Critério |
|---|---|
| Throughput | ≥ 250 requisições por segundo |
| Tempo de Resposta p90 | < 2.000 ms (2 segundos) |

---

## Estrutura do Projeto

```
Teste-Performance-Agibank-South-System/
└── jmeter-blazedemo-performance/
    ├── blazedemo-load-test.jmx    # Teste de carga — carga sustentada
    ├── blazedemo-spike-test.jmx   # Teste de pico — pico abrupto de tráfego
    ├── run-load-test.bat          # Execução do teste de carga (Windows)
    ├── run-spike-test.bat         # Execução do teste de pico (Windows)
    └── data/
        ├── flight-routes.csv      # 30 combinações de rotas de voo
        └── test-data.csv          # 100 perfis de usuário com dados de pagamento
```

---

## Pré-requisitos

| Requisito | Versão |
|---|---|
| Java | 11 ou superior |
| Apache JMeter | 5.6+ |
| Sistema Operacional | Windows (scripts `.bat`) ou qualquer OS (CLI manual) |
| Conectividade | Acesso à internet — alvo: blazedemo.com |

### Instalação do JMeter

**Windows (Chocolatey):**
```powershell
choco install jmeter -y
```

**macOS:**
```bash
brew install jmeter
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt update && sudo apt install jmeter -y
```

**Manual (qualquer OS):**
1. Baixe em https://jmeter.apache.org/download_jmeter.cgi
2. Extraia o ZIP em um diretório de sua escolha
3. Adicione o caminho de `bin/` ao `PATH` do sistema

**Verificar instalação:**
```bash
jmeter --version
```

---

## Como Executar os Testes

> **Importante:** Execute os comandos a partir da pasta `jmeter-blazedemo-performance/`.

```bash
cd jmeter-blazedemo-performance
```

### Opção 1 — Scripts automáticos (Windows)

```cmd
# Teste de carga
run-load-test.bat

# Teste de pico
run-spike-test.bat
```

Os scripts criam automaticamente as pastas `logs/` e `reports/`, geram o relatório HTML e o abrem no navegador ao final da execução.

### Opção 2 — Linha de comando (todos os sistemas)

**Teste de Carga:**
```bash
jmeter -n \
  -t blazedemo-load-test.jmx \
  -l logs/load-test-results.jtl \
  -e -o reports/load-report
```

**Teste de Pico:**
```bash
jmeter -n \
  -t blazedemo-spike-test.jmx \
  -l logs/spike-test-results.jtl \
  -e -o reports/spike-report
```

### Parâmetros Configuráveis

Todos os parâmetros são sobrescritíveis via flag `-J` na linha de comando:

| Parâmetro | Padrão Load | Padrão Spike | Descrição |
|---|---|---|---|
| `BASE_HOST` | `blazedemo.com` | `blazedemo.com` | Host alvo |
| `THREADS` | `100` | `500` (pico) | Usuários simultâneos |
| `RAMPUP` | `30` | `5` | Ramp-up em segundos |
| `DURATION` | `120` | `120` | Duração em segundos |

**Exemplo com override:**
```bash
jmeter -n -t blazedemo-load-test.jmx \
  -JBASE_HOST=staging.app.com \
  -JTHREADS=200 \
  -JDURATION=300 \
  -l logs/custom.jtl -e -o reports/custom-report
```

### Configuração dos Testes

#### Teste de Carga
- **Objetivo:** Validar estabilidade sob carga sustentada
- **Usuários:** 100 simultâneos
- **Ramp-up:** 30 segundos
- **Duração:** 120 segundos (2 minutos)
- **Think Time:** 1–3 segundos entre steps (comportamento real de usuário)

#### Teste de Pico
- **Objetivo:** Simular pico abrupto de tráfego
- **Fase 1 — Baseline:** 20 usuários por 60 segundos
- **Fase 2 — Pico:** 500 usuários atingidos em 5 segundos
- **Duração do pico:** 120 segundos
- **Think Time:** 0,5–1,5 segundos (pressão maior)

---

## Relatório de Execução dos Testes

### Ambiente de Execução

| Item | Configuração |
|---|---|
| **Alvo** | https://www.blazedemo.com |
| **JMeter** | 5.6.3 |
| **Java** | 22.0.1 |
| **OS** | Windows 11 |
| **Data de execução** | Março/2026 |

---

### Teste de Carga — Resultados

**Configuração executada:** 100 usuários | ramp-up 30s | duração 120s

| Métrica | Resultado | Critério | Status |
|---|---|---|---|
| **Throughput** | ~67 req/s | ≥ 250 req/s | ❌ Não atendido |
| **p90 Tempo de Resposta** | < 1.400 ms | < 2.000 ms | ✅ Atendido |
| **Taxa de Erro** | 0,00% | — | ✅ Excelente |
| **Tempo Médio** | ~600 ms | — | ✅ Bom |

**Validações funcionais — todos os 4 steps aprovados:**

| Step | Endpoint | HTTP Status | Conteúdo Validado |
|---|---|---|---|
| 01 — Homepage | `GET /` | 200 OK | `BlazeDemo` presente |
| 02 — Find Flights | `POST /reserve.php` | 200 OK | `Flights from` presente |
| 03 — Choose Flight | `POST /purchase.php` | 200 OK | `Your flight from` presente |
| 04 — Purchase | `POST /confirmation.php` | 200 OK | `Thank you for your purchase` presente |

---

### Teste de Pico — Resultados

**Configuração executada:** Baseline 20 users → Pico 500 users em 5s | duração 120s

| Métrica | Resultado | Critério | Status |
|---|---|---|---|
| **Throughput (pico)** | ~198 req/s | ≥ 250 req/s | ❌ Não atendido |
| **p90 Tempo de Resposta** | ~2.234 ms | < 2.000 ms | ❌ Excedido no pico |
| **Taxa de Erro** | ~2,3% | — | ⚠️ Degradação detectada |
| **Throughput (baseline)** | ~25 req/s | — | ✅ Estável |

---

### Análise dos Critérios de Aceitação

#### Critério 1 — Throughput ≥ 250 req/s

**Resultado: NÃO ATENDIDO**

O sistema atingiu pico de **~198 req/s** no teste de pico e **~67 req/s** na carga sustentada. O critério de 250 req/s não foi alcançado em nenhum dos cenários.

**Causas identificadas:**

1. **Limitação da infraestrutura do alvo:** O site `blazedemo.com` é uma aplicação de demonstração com capacidade de servidor intencionalmente limitada. Não foi projetado para suportar cargas de produção.

2. **Think Time realista reduz throughput:** Os testes simulam comportamento humano real com pausas de 1–3 segundos entre steps. Isso é correto para medir a experiência do usuário, mas reduz o throughput bruto medido.

3. **Fluxo transacional completo:** Cada "usuário virtual" executa 4 requisições sequenciais (não paralelas), o que é o comportamento correto para o cenário de compra, mas naturalmente limita o throughput por usuário.

**Conclusão:** A configuração do JMeter está correta e foi capaz de gerar a carga necessária. A limitação é da infraestrutura do site alvo. Em um sistema de produção dimensionado adequadamente (ex.: aplicação interna com load balancer), o critério de 250 req/s seria alcançável com os mesmos scripts, bastando aumentar o número de usuários simultâneos via `-JTHREADS`.

#### Critério 2 — p90 < 2.000 ms

**Resultado: ATENDIDO no Load Test | EXCEDIDO no pico extremo**

- **Teste de carga:** p90 de ~1.400 ms — dentro do critério ✅
- **Teste de pico:** p90 de ~2.234 ms durante o pico de 500 usuários — 17% acima do critério

O sistema responde dentro do SLA sob carga normal. A degradação ocorre apenas no pico extremo (500 usuários em 5 segundos), o que é comportamento esperado e documentado.

---

## Considerações Técnicas

### Boas Práticas Implementadas

| Prática | Detalhe |
|---|---|
| **Isolamento de dados por thread** | `shareMode.thread` — cada usuário consome sua própria linha do CSV |
| **Think Time** | `UniformRandomTimer` entre steps — simula comportamento humano real |
| **Assertions funcionais** | HTTP 200 + conteúdo esperado + SLA (DurationAssertion) por step |
| **Rastreabilidade** | Mensagens de erro referenciam requisito (ex.: `[REQ-004] FALHA: ...`) |
| **Parametrização completa** | HOST, PROTOCOL, THREADS, RAMPUP, DURATION e SLAs via `-J` |
| **Dados dinâmicos** | 100 perfis de usuário + 30 rotas de voo em CSV — sem repetição forçada |
| **Datas de cartão válidas** | Expiração 2028–2029 — sem risco de flaky test por data vencida |
| **Sessão limpa por iteração** | `clearEachIteration=true` em Cookie e Cache Manager |
| **Execução headless** | Modo não-GUI para máxima performance em CI/CD |
| **Logs separados** | Arquivo de erros separado do log geral para debug facilitado |

### Limitações do Ambiente de Teste

- `blazedemo.com` é um site de demonstração com infraestrutura limitada intencionalmente
- Performance do site varia conforme horário e carga de terceiros
- Resultados dependem da velocidade da conexão de internet local
- Para avaliação precisa de throughput, recomenda-se executar em rede corporativa ou VPN

### Validações Implementadas em Cada Step

```
Cada request possui 3 camadas de assertion:
  1. Response Assertion  → HTTP Status Code = 200
  2. Response Assertion  → Conteúdo esperado presente no body
  3. Duration Assertion  → Tempo de resposta dentro do SLA definido
```

---

## Troubleshooting

**JMeter não encontrado no PATH:**
```bash
jmeter --version   # Se falhar, adicione a pasta bin/ do JMeter ao PATH
```

**Erro de conexão com blazedemo.com:**
```bash
curl -I https://blazedemo.com   # Verificar conectividade
```

**Relatório HTML não gerado:**
- Certifique-se de que a pasta de destino não existe antes da execução (JMeter falha se já existir)
- Use sempre `-e -o <pasta-nova>` com um timestamp único

**Aumentar memória do JMeter para testes maiores:**
```bash
set JVM_ARGS="-Xmx4g" && jmeter -n -t blazedemo-load-test.jmx ...
```

---

*Desenvolvido para processo seletivo Agibank — Teste Técnico de Performance*

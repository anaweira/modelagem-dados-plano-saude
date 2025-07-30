# Desafio Técnico – DBA Voluntária | Lacrei Saúde

Este repositório contém a resolução do desafio técnico proposto pela Lacrei Saúde para a vaga de voluntariado em Administração de Banco de Dados (DBA). A proposta inclui a modelagem e implementação de uma estrutura de banco de dados para organizar os planos de saúde aceitos pelos profissionais cadastrados na plataforma.

---

## Objetivo

Desenvolver um modelo de dados que garanta:

- Integridade referencial
- Eficiência em consultas
- Flexibilidade para expansão futura
- Conformidade com a LGPD
- Boas práticas de normalização (até 3FN)

---

## Propostas Técnicas

### 🔹 Proposta 1: Modelo Relacional com Tabela de Domínio

- Utiliza uma estrutura tradicional com tabelas normalizadas.
- Inclui uma tabela associativa `profissional_plano` para representar o relacionamento N:N.
- Vantagens:
  - Alta integridade relacional
  - Facilidade para análises e relatórios
  - Totalmente normalizado
- Desvantagens:
  - Requer junções em consultas
  - Mais tabelas para manter

📁 Arquivos:
- `/modelagem/DER_Proposta_1.png`
- `/modelagem/dicionario_dados_proposta1.xlsx`
- `/scripts/proposta1_create.sql`

---

### 🔸 Proposta 2: Modelo com ENUM e Campo JSONB

- Os planos aceitos são armazenados em um campo `jsonb`.
- Um `enum` com os principais planos pode ser usado como referência.
- Vantagens:
  - Flexível e leve para uso em APIs
  - Menos junções
- Desvantagens:
  - Perde integridade referencial
  - Dificuldade para consultas avançadas
  - Baixa manutenibilidade em grande escala

📁 Arquivos:
- `/modelagem/DER_Proposta_2.png`
- `/modelagem/dicionario_dados_proposta2.xlsx`
- `/scripts/proposta2_create.sql`

---

## Enum vs Tabela de Domínio

| Critério         | Enum                                  | Tabela de Domínio                         |
|------------------|----------------------------------------|-------------------------------------------|
| Performance      | Leve e rápido para leitura simples     | Requer junções, mas altamente estruturado |
| Flexibilidade    | Limitado à lista pré-definida          | Fácil de expandir sem impacto             |
| Manutenção       | Precisa de migração ao alterar         | Basta inserir/editar registros            |
| Relatórios       | Pouco amigável                         | Excelente para BI e SQL                   |

---

## Sobre o uso de `jsonb`

**Quando usar**:
- Estruturas semi-estruturadas e flexíveis
- Campos que podem variar de profissional para profissional
- APIs que consomem dados diretamente

**Quando evitar**:
- Necessidade de integridade e relacionamento entre dados
- Consultas complexas, filtragens e agregações
- Casos com dados altamente estruturados

---

## Como executar

1. Use o PostgreSQL 13+
2. Execute os scripts em `/scripts/` na ordem desejada
3. Visualize os modelos no diretório `/modelagem/`

---

## 💚 Por que contribuir com a Lacrei Saúde?

A missão da Lacrei me inspira profundamente: promover uma saúde inclusiva, segura e representativa por meio da tecnologia. Como Engenheira de Produção e Analista de Dados, acredito no poder dos dados como instrumento de transformação social. Estou animada para somar forças com um time que une técnica, diversidade e propósito.

---

## Contato

- [LinkedIn](https://www.linkedin.com/in/anaweira)
- Email: anaweira@gmail.com

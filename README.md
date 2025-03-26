# FAPG - Banco de Dados

Este repositório contém a estrutura e os dados iniciais do banco de dados utilizado na plataforma desenvolvida para a **FAPG (Fundação de Apoio à Pesquisa de Pós-Graduandos)**.

## Conteúdo

- `scripts/00_reset.sql`: Limpa e recria o banco de dados (`DROP DATABASE` + `CREATE DATABASE`)
- `scripts/01_schema.sql`: Criação das tabelas e relacionamentos com integridade referencial
- `scripts/02_seed.sql`: Dados iniciais para testes e desenvolvimento
- `scripts/reset_fapg_database.bat`: Script para execução automatizada dos arquivos no Windows

## Banco de Dados

- **SGDB**: MySQL 8.x
- **Charset**: `utf8mb4`
- **Collation**: `utf8mb4_general_ci`

## Executando os scripts

No terminal MySQL, você pode executar os scripts manualmente:

```sql
SOURCE scripts/00_reset.sql;
SOURCE scripts/01_schema.sql;
SOURCE scripts/02_seed.sql;
```

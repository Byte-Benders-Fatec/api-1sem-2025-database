@echo off
:: Script para resetar, criar e popular o banco de dados MySQL

:: CONFIGURE AQUI SEU USUÁRIO E SENHA
set USUARIO=root
set /p SENHA="Digite sua senha MySQL: "

:: Caminho para o executável do MySQL (ajuste se necessário)
set MYSQL_BIN="C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"

:: Caminho dos arquivos SQL (ajuste conforme seu projeto)
set SCHEMA=01_schema.sql
set SEED=02_seed.sql
set RESET=00_reset.sql

echo.
echo ========================
echo Executando reset do banco
echo ========================
%MYSQL_BIN% -u %USUARIO% -p%SENHA% < %RESET%

echo.
echo ========================
echo Criando schema
echo ========================
%MYSQL_BIN% -u %USUARIO% -p%SENHA% < %SCHEMA%

echo.
echo ========================
echo Inserindo dados (seed)
echo ========================
%MYSQL_BIN% -u %USUARIO% -p%SENHA% < %SEED%

echo.
echo ========================
echo Concluido!
echo ========================
pause

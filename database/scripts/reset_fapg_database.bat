@echo off
:: Script para resetar, criar e popular o banco de dados MySQL

:: CONFIGURE AQUI SEU USUÁRIO E SENHA
set USUARIO=root
set /p SENHA="Digite sua senha MySQL: "

:: Caminho para o executável do MySQL
set MYSQL_BIN="C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"

:: Caminho dos arquivos SQL
set RESET=00_reset.sql
set SCHEMA=01_schema.sql
set TRIGGERS=02_triggers.sql
set SEED=03_seed.sql

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
echo Criando triggers
echo ========================
%MYSQL_BIN% -u %USUARIO% -p%SENHA% < %TRIGGERS%

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

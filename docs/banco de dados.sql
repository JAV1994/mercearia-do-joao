/*
Comando utilizado para verficar se o servidor pode sr criado
*/

pg_lsclusters

/* Caso apareça a msgm de down utilize o comando abaixo */
sudo system ctl start postgresql

/* Iniciar o servidor linux */
sudo -u postgres psql

/* Listar os bancos de dados existentes */
\l

/* Criar um banco de dados mercearia */
CREATE DATABASE mercearia;

/* Cria uma senha de uruario para o banco de dados (usuario padrao postgres) */
\password postgres

/* Navegar para o banco de dados mercearia 
   É esperado que o comando retorne a seguinte msgm: You are now connected to database "mercearia" as user "postgres".
*/
\c mercearia

/* Verifica as tabelas existentes */
\dt

/* Criar uma tabela de Clientes */
CREATE TABLE clientes (
   id_cliente      serial primary key,
    nome_cliente    varchar(100) not null,
    data_nascimento date,
    valor_limite    double precision default 0
);

/* Verifica a tabela Clientes */
\d clientes

/* Insere os dados na tabela Clientes */
insert into clientes (nome_cliente, data_nascimento, valor_limite) values
    ('Maria Silva',  '1990-05-12', 500.00),
    ('Carlos Souza', '1985-11-03', 300.00),
    ('Ana Pereira',  '2001-02-20', 150.00);

/* Seleciona os dados da tabela Clientes */
select * from clientes;

/* Conector da API para o banco de dados (Não esqueça de testá-lo) */
psql -h localhost -U postgres -d mercearia -c "select count(*) from clientes;"
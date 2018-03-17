.print 
.print /*------------------------------------------------------------------------*/
.print /*         SISadega1 RE-CRIACAO DO BD    (criaCargaAdega.sql)             */
.print /* uso : no Dos va para a pasta do SISadega                               */
.print /* ..\\app\\sqlite3 dados\\adega.db ".read modulos\\criaCargaAdega.sql"     */
.print /*------------------------------------------------------------------------*/
.print
drop table if exists tadega;
create table Tadega  (
	num 		integer      primary key,
	produtor	char(15),
	uva 		char(15),
         ano		integer,
         garrafas	integer,
       PRECO integer);
.header on
.mode column

-- Carga do BD
.print "Carga da Tabela Tadega:"  
.import dados\\adega.txt   TADEGA
-- Corrige os precos
.read modulos\\REGRAPRECO.SQL
.headers on
SELECT * FROM tadega  limit 20;   -- mostra  o inicio da tabela

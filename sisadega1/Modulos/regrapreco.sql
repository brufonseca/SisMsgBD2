.print 
.print /*------------------------------------------------------------------------*/
.print /*         SISadega1: regra de preco de vinho (regrapreco.sql)             */
.print /* uso : no Dos va para a pasta do SISadega                               */
.print /* ..\\app\\sqlite3 dados\\adega.db ".read modulos\\regrapreco.sql"     */
.print /*------------------------------------------------------------------------*/
.print

UPDATE TADEGA SET PRECO=
CASE WHEN ANO<1997 THEN 200
     WHEN Ano=1997 THEN 150 
     ELSE 50+(2018-ano)*20 END;
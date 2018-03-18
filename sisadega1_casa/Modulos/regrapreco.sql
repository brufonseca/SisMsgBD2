.print 
.print /*------------------------------------------------------------------------*/
.print /*         SISadega1: regra de preco de vinho (regrapreco.sql)             */
.print /* uso : no Dos va para a pasta do SISadega                               */
.print /* ..\\app\\sqlite3 dados\\adega.db ".read modulos\\regrapreco.sql"     */
.print /*------------------------------------------------------------------------*/
.print

UPDATE Tadega SET preco=
CASE WHEN uva='Cabernet Sauvignon' OR uva='Tannat' THEN
   CASE WHEN Ano<1992 THEN 350 
   ELSE 30+(2018-ano)*10 END
ELSE (2018-ano)*10 END;
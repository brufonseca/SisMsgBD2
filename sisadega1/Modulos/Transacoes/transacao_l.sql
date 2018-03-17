--.output Doc\\Transacao_l.txt
.print "/*------------------------------------------------------------------------*/"
.print "/*l) Inserir novos vinhos (com preco)-------------------------------------*/"
.print "/*------------------------------------------------------------------------*/" 
.mode column
.header on


INSERT INTO TADEGA VALUES (NULL,'Aurora','Merlot',2009,3,0);

UPDATE TADEGA SET PRECO=
CASE WHEN uva='Cabernet Sauvignon' OR uva='Tannat' THEN
   CASE WHEN Ano<1992 THEN 350 
   ELSE 30+(2018-ano)*10 END
ELSE (2018-ano)*10 END
WHERE NUM=last_insert_rowid();


--.read modulos\\REGRAPRECO.SQL
SELECT * FROM TADEGA;
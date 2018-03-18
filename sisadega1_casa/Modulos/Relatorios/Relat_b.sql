--  .output Doc\\Relat_b.txt
.print "/*------------------------------------------------------------------*/"
.print "/*------------ Vinhos e seus precos colhidos após 1994--------------*/"
.print "/*------------------------------------------------------------------*/" 
.mode column
.header on

SELECT Produtor,Uva,ANO, PRECO FROM TADEGA WHERE ANO>1994; ;
--  .output Doc\\Relat_a.txt
.print "/*------------------------------------------------------------------*/"
.print "/*------------ Vinhos e seus precos --------------------------------*/"
.print "/*------------------------------------------------------------------*/" 
.mode column
.header on

SELECT produtor, uva as Vinho, ano, preco FROM TADEGA ;
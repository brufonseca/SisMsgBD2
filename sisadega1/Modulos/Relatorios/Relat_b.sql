--  .output Doc\\Relat_b.txt
.print "/*------------------------------------------------------------------*/"
.print "/*------------ Vinhos e seus precos colhidos após 1994--------------*/"
.print "/*------------------------------------------------------------------*/" 
.mode column
.header on

SELECT produtor, uva as Vinho, ano, preco FROM TADEGA where ano>1994;
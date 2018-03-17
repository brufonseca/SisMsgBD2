--  .output Doc\\Relat_c.txt
.print "/*------------------------------------------------------------------*/"
.print "/*-Vinhos com preçÁo em torno da media geral dos vinhos +- 20 reais--*/"
.print "/*------------------------------------------------------------------*/" 
.mode column
.header on

SELECT PRODUTOR,UVA,ANO FROM TADEGA 
WHERE PRECO BETWEEN (SELECT AVG(PRECO) FROM TADEGA)-20 AND (SELECT AVG(PRECO) FROM TADEGA)+20;
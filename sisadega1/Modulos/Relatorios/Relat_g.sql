--  .output Doc\\Relat_g.txt
.print "/*--------------------------------------------------------------------------*/"
.print "/*---------Qual o menor pre��o POR tipo de uva-------------------------------*/"
.print "/*--------------------------------------------------------------------------*/" 
.mode column
.header on

SELECT PRODUTOR,UVA,ANO,MIN(PRECO) AS PrecoMin FROM TADEGA GROUP BY UVA;
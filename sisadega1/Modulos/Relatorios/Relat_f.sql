--  .output Doc\\Relat_f.txt
.print "/*--------------------------------------------------------------------------*/"
.print "/*---------Qual o vinho de maior preco POR produtor-------------------------*/"
.print "/*--------------------------------------------------------------------------*/" 
.mode column
.header on

SELECT PRODUTOR,UVA,ANO,MAX(PRECO) AS PrecoMaximo FROM TADEGA GROUP BY PRODUTOR;
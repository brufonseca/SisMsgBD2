--  .output Doc\\Relat_d.txt
.print "/*------------------------------------------------------------------*/"
.print "/*------------Quantas garrafas existem de Cabernet Sauvignon--------*/"
.print "/*------------------------------------------------------------------*/" 
.mode column
.header on

SELECT SUM(GARRAFAS) as TotalGarrafas FROM TADEGA WHERE UVA='Cabernet Sauvignon';
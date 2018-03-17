--  .output Doc\\Relat_e.txt
.print "/*------------------------------------------------------------------------------------*/"
.print "/*-Lista de vinhos(Produtor,Uva e Ano) mais caros de um certo tipo de uva (ex Tannat)-*/"
.print "/*------------------------------------------------------------------------------------*/" 
.mode column
.header on

SELECT PRODUTOR,UVA,ANO,PRECO FROM TADEGA WHERE UVA='Fume Blanc' AND PRECO=(SELECT MAX(PRECO) FROM TADEGA WHERE UVA='Fume Blanc');
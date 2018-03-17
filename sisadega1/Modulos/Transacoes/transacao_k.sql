--.output Doc\\Transacao_k.txt
.print "/*------------------------------------------------------------------------*/"
.print "/*k) Atualizar a quantidade no estoque de vinhos--------------------------*/"
.print "/*Dar baixa em 5 vinhos 'Santa Helena', 'Cabernet Sauvignon' do ano=2010)-*/"
.print "/*------------------------------------------------------------------------*/" 
.mode column
.header on


UPDATE TADEGA SET GARRAFAS=GARRAFAS-5 WHERE PRODUTOR='Santa Helena' AND UVA='Cabernet Sauvignon' AND ANO=2010;

SELECT * FROM TADEGA;

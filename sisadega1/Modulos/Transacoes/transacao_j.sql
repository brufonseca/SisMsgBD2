--.output Doc\\Transacao_j.txt
.print "/*---------------------------------------------------------------------*/"
.print "/*j) Excluir vinhos com estoque zero-----------------------------------*/"
.print "/*---------------------------------------------------------------------*/" 
.mode column
.header on


DELETE FROM TADEGA WHERE GARRAFAS = 0;

SELECT * FROM TADEGA;

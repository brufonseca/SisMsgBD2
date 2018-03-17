--.output Doc\\Transacao_m.txt
.print "/*------------------------------------------------------------------------*/"
.print "/*m) Mudar a regra dos precos---------------------------------------------*/"
.print "/*------------------------------------------------------------------------*/" 
.mode column
.header on


UPDATE TADEGA SET PRECO=
CASE WHEN ANO<1997 THEN 200
     WHEN Ano=1997 THEN 150 
     ELSE 50+(2018-ano)*20 END;

SELECT * FROM TADEGA;

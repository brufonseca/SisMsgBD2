.print /*------------------------------------------------------------------------*/
.print /*SISEMP RE-CRIACAO DO BD-------------------------------------------------*/
.print /*-a) Atualizar sal de certos empregados----------------------------------*/
.print /*------------------------------------------------------------------------*/
.mode column
.header on


UPDATE EMP SET SAL=1.15*SAL WHERE
 1.15*SAL<5000 AND EMP.EN IN
(SELECT E.EN FROM EMP E JOIN DEPTO D USING (DN)
WHERE D.NOME = "INF" AND E.EN<>D.CHF);

SELECT * FROM EMP;
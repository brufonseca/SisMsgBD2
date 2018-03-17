.output doc\\Relat_F.txt

.print /*------------------------------------------------------------------------*/
.print /*SISEMP RE-CRIACAO DO BD-------------------------------------------------*/
.print /*-f) Por depto informar o maior, menor e a media de salario--------------*/
.print /*------------------------------------------------------------------------*/
.mode column
.header on


SELECT D.NOME, MAX(E.SAL) AS MAIOR_SALARIO, MIN(E.SAL) AS MENOR_SALARIO, ROUND(AVG(E.SAL),1) AS MEDIA_SALARIAL 
FROM DEPTO D JOIN EMP E USING (DN)
GROUP BY D.DN;
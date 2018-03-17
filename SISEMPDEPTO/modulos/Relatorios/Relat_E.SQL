.output doc\\Relat_E.txt

.print /*------------------------------------------------------------------------*/
.print /*SISEMP RE-CRIACAO DO BD-------------------------------------------------*/
.print /*-e) Numero e nome de chefes de deptos  e nomes de seus subordinados-----*/
.print /*------------------------------------------------------------------------*/
.mode column
.header on


SELECT E2.EN, E2.ENOME AS CHEFE, E.ENOME AS EMPREGADO, D.NOME AS DEPTO FROM EMP E JOIN DEPTO D USING (DN)
JOIN EMP E2 ON E2.EN = D.CHF
WHERE E2.EN <> E.EN
ORDER BY E2.EN;
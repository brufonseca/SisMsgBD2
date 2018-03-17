.output doc\\Relat_C.txt

.print /*------------------------------------------------------------------------*/
.print /*SISEMP RE-CRIACAO DO BD-------------------------------------------------*/
.print /*-c) Numero e nome  dos chefes junto com os nomes e salario de seus------*/
.print /*-empregados-------------------------------------------------------------*/
.mode column
.header on


SELECT E2.EN, E2.ENOME AS CHEFE, E.ENOME AS EMPREGADO, E.SAL FROM EMP E JOIN DEPTO D USING (DN)
JOIN EMP E2 ON E2.EN = D.CHF
WHERE E2.EN <> E.EN
ORDER BY E2.EN;
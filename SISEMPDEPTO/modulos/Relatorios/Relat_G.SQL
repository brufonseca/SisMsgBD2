.output doc\\Relat_G.txt

.print /*------------------------------------------------------------------------*/
.print /*SISEMP RE-CRIACAO DO BD-------------------------------------------------*/
.print /*-g) Por chefe de depto informar seu sal e a media de sal dos seus-------*/
.print /*-empregados-------------------------------------------------------------*/
.mode column
.header on


SELECT D.NOME AS DEPTO, E2.ENOME AS CHEFIA, AVG(E2.SAL) AS SAL_CHEFIA, AVG(E.SAL) AS SAL_EMP FROM EMP E JOIN DEPTO D USING (DN)
JOIN EMP E2 ON E2.EN = D.CHF
WHERE E2.EN <> E.EN
GROUP BY D.DN;
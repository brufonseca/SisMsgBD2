.output doc\\Relat_B.txt

.print /*------------------------------------------------------------------------*/
.print /*SISEMP RE-CRIACAO DO BD-------------------------------------------------*/
.print /*-b) Nome e sal dos empregados que ganham menos da metade do sal de seus-*/
.print /*-chefes-----------------------------------------------------------------*/
.mode column
.header on


SELECT E.ENOME, E.SAL FROM EMP E JOIN DEPTO D USING (DN)
JOIN EMP E2 ON E2.EN = D.CHF
WHERE E.SAL < 0.5*E2.SAL;
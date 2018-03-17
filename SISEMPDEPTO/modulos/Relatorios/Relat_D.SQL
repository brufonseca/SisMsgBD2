.output doc\\Relat_D.txt

.print /*------------------------------------------------------------------------*/
.print /*SISEMP RE-CRIACAO DO BD-------------------------------------------------*/
.print /*-d) Numero e nome dos emps cujo telefone nao bate com o de seu depto----*/
.print /*------------------------------------------------------------------------*/
.mode column
.header on


SELECT E.EN, E.ENOME FROM DEPTO D JOIN EMP E USING (DN)
LEFT OUTER JOIN TELE T USING (EN)
WHERE T.TEL <> D.TEL
GROUP BY E.EN;
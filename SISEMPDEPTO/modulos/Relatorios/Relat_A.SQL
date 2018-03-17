.output doc\\Relat_a.txt

.print /*------------------------------------------------------------------------*/
.print /*SISEMP RE-CRIACAO DO BD-------------------------------------------------*/
.print /*-a) Dados dos departamentos e seus emps (com seus telefones se tiverem)-*/
.print /*------------------------------------------------------------------------*/
.mode column
.header on


SELECT * FROM DEPTO D JOIN EMP E USING (DN)
     	LEFT OUTER JOIN TELE T USING (EN)
	ORDER BY D.DN;
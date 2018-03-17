.print /*------------------------------------------------------------------------*/
.print /*SISEMP RE-CRIACAO DO BD-------------------------------------------------*/
.print /*-b) Trocar um certo empregado de depto----------------------------------*/
.print /*------------------------------------------------------------------------*/
.mode column
.header on


UPDATE EMP SET DN=1 WHERE EN=25;

SELECT * FROM EMP;
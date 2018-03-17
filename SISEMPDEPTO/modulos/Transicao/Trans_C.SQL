.print /*------------------------------------------------------------------------*/
.print /*SISEMP RE-CRIACAO DO BD-------------------------------------------------*/
.print /*-c) Atualizar Dn de Deptos----------------------------------------------*/
.print /*------------------------------------------------------------------------*/
.mode column
.header on


UPDATE DEPTO SET DN=10 WHERE NOME="INF";
SELECT * FROM DEPTO;
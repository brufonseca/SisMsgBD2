.print /*------------------------------------------------------------------------*/
.print /*SISEMP RE-CRIACAO DO BD-------------------------------------------------*/
.print /*-d) Excluir um emp chefe etc--------------------------------------------*/
.print /*------------------------------------------------------------------------*/
.mode column
.header on


DELETE FROM EMP WHERE EN=1;
SELECT * FROM EMP;
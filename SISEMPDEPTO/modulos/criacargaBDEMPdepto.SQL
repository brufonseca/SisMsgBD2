/*-----------------------------------------------------------------------*/
/*SISEMP RE-CRIACAO DO BD                                                */
/* uso : no dos va para a pasta SISEMP                                   */
/* chame                                                                 */
/* app\sqlite3 dados\empdepto.db ".read modulos\\criacargabdempdepto.sql" */
/*------------------------------------------------------------------------*/
DROP TABLE IF EXISTS DEPTO;
CREATE TABLE DEPTO
   (DN       INTEGER PRIMARY KEY, 
    NOME     VARCHAR(30) UNIQUE, 
    TEL      DECIMAL(8),
    CHF      INTEGER NOT NULL 
             references Emp(EN) 
             on delete cascade on update cascade
);

DROP TABLE IF EXISTS EMP;
CREATE TABLE EMP(
   EN INTEGER PRIMARY KEY, 
   ENOME VARCHAR(30), 
   SAL DECIMAL(8,2) 
       default 1000 check(sal between 500 and 5000),  
   DN  INTEGER NOT NULL
       references  Depto(DN)     
       on delete  cascade  on update cascade  
);
-- TELEFONE DO EMPREGADO
DROP TABLE IF EXISTS TELE;
CREATE TABLE TELE (EN INTEGER REFERENCES EMP(EN) 
                    on delete cascade on update cascade, 
                   TEL DECIMAL(8), 
             PRIMARY KEY(EN,TEL)
);
-- desliga foreign keys
PRAGMA FOREIGN_KEYS=OFF;
.mode column
.header off
.import dados\\DEPTO.txt depto
.import dados\\TELE.txt TELE
.import dados\\EMP.txt emp
.header off
.print ==========================================
.header on
select * from EMP limit 20; 
.print ----------------------
select * from tele;
.print ----------------------
select * from DEPTO;


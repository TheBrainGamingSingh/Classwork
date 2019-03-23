CREATE TABLE DEPT 
(DEPTNO NUMERIC(2,0),
DNAME VARCHAR(14),
VENUE VARCHAR(14),
CONSTRAINT PK_DEPTNO PRIMARY KEY(DEPTNO)
);
SELECT * FROM DEPT
CREATE TABLE EMP(
EMPID NUMERIC(4,0),
ENAME VARCHAR(10),
DSGN VARCHAR(9),
MGR NUMERIC(4,0),
HIREDATE DATE,
SAL DECIMAL(7,2),
COMM DECIMAL(7,2),
DEPTNO NUMERIC(2,0),
CONSTRAINT PK_EMPID PRIMARY KEY(EMPID),
CONSTRAINT UQ_DEPTNO UNIQUE(ENAME),
CONSTRAINT CK_SAL CHECK(SAL > 0),
CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
SELECT * FROM EMP




INSERT INTO DEPT VALUES
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON'),
(50,'COMPUTER','AMERICA');

SELECT * FROM DEPT

INSERT INTO EMP VALUES 
(7369,'WATSON','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-01-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-01-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
(7876,'PATEL','CLERK',7788,'1996-08-23',1100,NULL,20),
(7900,'JAMES','CLERK',7698,'1981-08-03',950,NULL,30);

SELECT * FROM EMP

UPDATE EMP SET SAL=SAL+SAL*(0.15) WHERE DSGN='CLERK' AND (DEPTNO=10 OR DEPTNO=20);
SELECT * FROM EMP

UPDATE EMP SET SAL=SAL+SAL*(0.05) WHERE DSGN='MANAGER';
SELECT * FROM EMP

UPDATE EMP SET DSGN='SALES OFF' WHERE DSGN='SALESMAN' AND (SAL+COMM)>1100;
SELECT * FROM EMP

UPDATE EMP SET COMM=COMM+300 WHERE SAL<2000;
SELECT * FROM EMP

UPDATE EMP SET COMM=300 WHERE SAL<2000 AND COMM IS NULL;
SELECT * FROM EMP

UPDATE EMP SET DEPTNO=10 WHERE ENAME='JAMES';
SELECT * FROM EMP

SELECT ENAME, ISNULL((SAL+COMM),SAL) AS TOTAL_SALARY FROM EMP;

ALTER TABLE EMP ALTER COLUMN DSGN VARCHAR(15);
SELECT * FROM EMP


SP_RENAME 'EMP.EMPID', 'EMPLOYEE_NUMBER', 'COLUMN';
SELECT * FROM EMP

DELETE FROM EMP WHERE EMPLOYEE_NUMBER=7369;
SELECT * FROM EMP

DELETE FROM EMP WHERE COMM=0 OR COMM IS NULL;
SELECT * FROM EMP


TRUNCATE TABLE EMP
SELECT * FROM EMP
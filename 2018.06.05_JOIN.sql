--1. 조인---------------------------------------------------------------------
--INNER JOIN-------------------------------------------------------------------
--서로 키의 데이터 값이 있는 경우에만 데이터를 살림
select count(*)
from(
    select 
    A.*,
    b.CUSTNAME
    FROM CUSTOMERDATA A 
    INNER JOIN CUSTOMER_NAME B
    ON A.CUSTID = B.CUSTID);
--------------------------------------------------------------------------------

--LEFT JOIN---------------------------------------------------------------------
--키의 데이터 값이 NULL이여도 NULL로 채우고 모든 데이터를 살린다
select
   A.*,
   B.CUSTNAME
 FROM CUSTOMERDATA A 
LEFT JOIN CUSTOMER_NAME B
ON A.CUSTID = B.CUSTID
where 1 = 1
and CUSTNAME is NULL;
--문자열의 null 값을 구할때는 is 나머지는 = '값'
--------------------------------------------------------------------------------

--RIGHT JOIN--------------------------------------------------------------------
select 
    A.*,
    B.CUSTNAME
 FROM CUSTOMERDATA A 
RIGHT JOIN CUSTOMER_NAME B
ON A.CUSTID = B.CUSTID;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


--PIVOT , UNPIVOT---------------------------------------------------------------

SELECT 
    *
    FROM (
       SELECT  *
       FROM DT_RESULT_FINAL2
)
PIVOT( 
    SUM(SALES)
    FOR MEASURE IN ('REAL-QTY' AS REAL_QTY,'PREDICTION-QTY' AS PREDICTION_QTY)
)


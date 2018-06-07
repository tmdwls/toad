--1. ����---------------------------------------------------------------------
--INNER JOIN-------------------------------------------------------------------
--���� Ű�� ������ ���� �ִ� ��쿡�� �����͸� �츲
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
--Ű�� ������ ���� NULL�̿��� NULL�� ä��� ��� �����͸� �츰��
select
   A.*,
   B.CUSTNAME
 FROM CUSTOMERDATA A 
LEFT JOIN CUSTOMER_NAME B
ON A.CUSTID = B.CUSTID
where 1 = 1
and CUSTNAME is NULL;
--���ڿ��� null ���� ���Ҷ��� is �������� = '��'
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


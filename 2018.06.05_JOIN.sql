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


--PIVOT---------------------------------------------------------------

--SELECT * 
--FROM(
-- SELECT * FROM {������̺��}
--) PIVOT(
--   SUM(SALES) SALES--> �� ���� �������� ����
--   FOR {���� ���� �ٲ� �÷���} IN (���� ǥ���� �� ����Ʈ)
--)
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
ORDER BY PRODUCTGROUP, PRODUCT, ITEM, YEARWEEK;

--����--------------------------------------------------------------------------
--KOPO_CHANNEL_SEASONALITY_NEW
--���̺��� ����/��ǰ���� ����Ǹŷ��� �Ҽ�������
--��Ÿ���� W01~W53�� �׸��� ����
--PIVOT ���·� ǥ���ϼ���

select * from KOPO_CHANNEL_SEASONALITY_NEW;

create table KOPO_CHANNEL_SEASONALITY_NEW_PIVOT�ڽ���_1 as(
select
*
from (
select 
    REGIONID,                                                           
    PRODUCT,
    SUBSTR(YEARWEEK,5,6) as WEEK,
    ROUND(AVG(QTY),0)as QTY 
    from KOPO_CHANNEL_SEASONALITY_NEW
    GROUP BY REGIONID, PRODUCT, SUBSTR(YEARWEEK,5,6)                                          
    ORDER BY REGIONID, PRODUCT, SUBSTR(YEARWEEK,5,6)
)
PIVOT( 
    SUM(QTY)
    FOR WEEK IN ('01'as w01,'02'as w02, '03' as w03, '52' as w52, '53'as w53)
)

);
--------------------------------------------------------------------------------

--UNPIVOT-----------------------------------------------------------------------
SELECT * FROM KOPO_CHANNEL_SEASONALITY_NEW_PIVOT�ڽ���_1;

WITH T AS( 
    SELECT * FROM KOPO_CHANNEL_SEASONALITY_NEW_PIVOT�ڽ���_1
)
SELECT 
    REGIONID,                                                           
    PRODUCT,
    WEEK,
    QTY
    FROM T
UNPIVOT(QTY FOR WEEK IN(w01,w02,w03,w52,w53));

-------------------------------------------------------------------------------

select a.*
    -- partition by equal 
    ,row_number() over (order by qty desc) as qty_desc_order
    ,row_number() over (partition by regionid, product order by qty desc) as re_pd_desc_order
    ,avg(qty) over(partition by regionid) as avg_qty_region
    , sum(qty) over(partition by regionid, product) as sum_qty
from kopo_channel_seasonality_new a
order by regionid, product, qty desc;
--------------------------------------------------------------------------------
---����-------------------------------------------------------------------------
select a.*, b.qty
from kopo_channel_seasonality_new a,
(select regionid
    , product
    , sum(qty) as qty
from kopo_channel_seasonality_new a
group by regionid, product)b
where 1=1
and a.regionid = b.regionid(+)
and a.product = b.product(+);



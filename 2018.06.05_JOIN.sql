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


--PIVOT---------------------------------------------------------------

--SELECT * 
--FROM(
-- SELECT * FROM {대상테이블명}
--) PIVOT(
--   SUM(SALES) SALES--> 이 값을 기준으로 나눔
--   FOR {행을 열로 바꿀 컬럼명} IN (열로 표현할 값 리스트)
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

--예제--------------------------------------------------------------------------
--KOPO_CHANNEL_SEASONALITY_NEW
--테이블을 지역/상품별로 평균판매량을 소수점없이
--나타내고 W01~W53을 그림과 같은
--PIVOT 형태로 표현하세요

select * from KOPO_CHANNEL_SEASONALITY_NEW;

create table KOPO_CHANNEL_SEASONALITY_NEW_PIVOT박승진_1 as(
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
SELECT * FROM KOPO_CHANNEL_SEASONALITY_NEW_PIVOT박승진_1;

WITH T AS( 
    SELECT * FROM KOPO_CHANNEL_SEASONALITY_NEW_PIVOT박승진_1
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
---단점-------------------------------------------------------------------------
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



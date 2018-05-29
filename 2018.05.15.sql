
--1. �ֿ��Լ�-----------------------------------------------------------------

-- ��/�ҹ��� �����ϱ�  UPPER(�ҹ��� -> �빮��),  LOWER(�빮�� -> �ҹ���)
SELECT 
   UPPER(PRODUCT) AS CASE1,
   LOWER(PRODUCT) AS CASE2
FROM KOPO_CHANNEL_SEASONALITY_NEW;
-------------------------------------------------------------------------------
-- �÷� �� ��ġ�� CONCAT(�÷���,�÷���)-----------------------------------------
SELECT 
    CONCAT(REGIONID,CONCAT('_',PRODUCT)) AS KEYCOL1,
    REGIONID||'_'||PRODUCT AS KEYCOL2
FROM KOPO_CHANNEL_SEASONALITY_NEW;
--------------------------------------------------------------------------------
-- �÷� �� �����ϱ� SUBSTR(�����ڿ��� OR �÷���, �����ε���, �����ε���)----------
SELECT 
    PRODUCT,
    SUBSTR(PRODUCT,1,7)
FROM KOPO_CHANNEL_SEASONALITY_NEW;
-------------------------------------------------------------------------------
-- �÷� �� ä��� LPAD(�÷���, �ڸ���, �����Ϲ��ڡ�)-----------------------------
SELECT 
LPAD(PRODUCT, 10, ��0��)
FROM KOPO_CHANNEL_SEASONALITY_NEW;
-------------------------------------------------------------------------------
select * from KOPO_CUSTOMERDATA;
select
    LPAD(CUSTOMERCODE, 10, '0'),
    SUBSTR(LPAD(CUSTOMERCODE, 10, '0'), -4),
    REPLACE(LPAD(CUSTOMERCODE, 10, '0')
                ,SUBSTR(LPAD(CUSTOMERCODE, 10, '0'), -4)
                ,'****')
from KOPO_CUSTOMERDATA;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


select 
     FIRST_NUMBER
    ,SECOND_NUMBER
    ,FIRST_NUMBER/SECOND_NUMBER as AVG
    ,ROUND(FIRST_NUMBER/SECOND_NUMBER,2)as ROUND
    ,CEIL(FIRST_NUMBER/SECOND_NUMBER)as CEIL
    ,FLOOR(FIRST_NUMBER/SECOND_NUMBER)as FLOOR
    ,MOD(FIRST_NUMBER,SECOND_NUMBER)as MOD
    ,POWER(FIRST_NUMBER,SECOND_NUMBER)as POW
from NUMBER_EXAMPLE;

--��Ȯ�� ����----------------------------------------------------------
select 
    YEARWEEK,
    -- ������
    ACTUAL,
    --������
    FCST,
   --��Ȯ��
    ROUND(1-ABS((FCST-ACTUAL)/FCST),4)*100 as ACCURACY
from RMSE_MAE_EXAMPLE2;
    

select *
FROM
(
Select
    YEARWEEK
    
    -- ������
    ,ACTUAL
    
    --������
    ,FCST
    
    --��Ȯ��
    ,ROUND(1-ABS((FCST-ACTUAL)/FCST),4)*100 as ACCURACY
    FROM RMSE_MAE_EXAMPLE2
) 
WHERE 1=1
AND ACCURACY < 50;
------------------------------------------------------------------

select
    sysdate
    ,next_day(sysdate,2)
    ,last_day(sysdate)
from dual;
   

SELECT TO_CHAR(SYSDATE-7, 'YYYYWW') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYYWW') FROM DUAL;

SELECT TO_CHAR(SYSDATE-30, 'YYYYMMDD') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYYMMdd') FROM DUAL;

SELECT TO_CHAR(SYSDATE-1, 'YYYYMMDD') FROM DUAL;


select 
    a.*,
    case when a.gender = 'Female' then 0
         when a.gender = 'Male' then 1
    else 2 end as sort_key 
from kopo_customerdata a
order by sort_key;



SELECT 
    YEARWEEK,
    CASE WHEN QTY<1000 THEN 1000
         WHEN QTY>1000 AND QTY <10000 THEN 10000
         ELSE 30000 END AS QTY
FROM KOPO_CHANNEL_SEASONALITY_NEW;

SELECT * FROM CUSTOMERDATA ;



CREATE TABLE 
RMSE_MAE_ST_PSJ as
    Select
    ROUND(1-ABS((FCST-ACTUAL)/FCST),4)*100 as ACCURACY
    FROM RMSE_MAE_EXAMPLE2;
    
    
SELECT a.*,
case when substr(CUSTID,1,1)='A' then 1
     when substr(CUSTID,1,1)='B' then 0
     when substr(CUSTID,1,1)='C' then 2
     else 3 end as newOrder
     from CUSTOMERDATA a
     order by newOrder;
     


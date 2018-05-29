select * from KOPO_CUSTOMERDATA;

select
    LPAD(CUSTOMERCODE, 10, '0'),
    SUBSTR(LPAD(CUSTOMERCODE, 10, '0'), -4),
    REPLACE(LPAD(CUSTOMERCODE, 10, '0')
                ,SUBSTR(LPAD(CUSTOMERCODE, 10, '0'), -4)
                ,'****')
from KOPO_CUSTOMERDATA;


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

--정확도 산출----------------------------------------------------------
select 
    YEARWEEK,
    -- 실제값
    ACTUAL,
    --예측값
    FCST,
   --정확도
    ROUND(1-ABS((FCST-ACTUAL)/FCST),4)*100 as ACCURACY
from RMSE_MAE_EXAMPLE2;
    

select *
FROM
(
Select
    YEARWEEK
    
    -- 실제값
    ,ACTUAL
    
    --예측값
    ,FCST
    
    --정확도
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
 


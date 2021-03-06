
--1. 주요함수-----------------------------------------------------------------

-- 대/소문자 변경하기  UPPER(소문자 -> 대문자),  LOWER(대문자 -> 소문자)
SELECT 
   UPPER(PRODUCT) AS CASE1,
   LOWER(PRODUCT) AS CASE2
FROM KOPO_CHANNEL_SEASONALITY_NEW;
-------------------------------------------------------------------------------
-- 컬럼 값 합치기 CONCAT(컬럼명,컬럼명)-----------------------------------------
SELECT 
    CONCAT(REGIONID,CONCAT('_',PRODUCT)) AS KEYCOL1,
    REGIONID||'_'||PRODUCT AS KEYCOL2
FROM KOPO_CHANNEL_SEASONALITY_NEW;
--------------------------------------------------------------------------------

-- 컬럼 값 추출하기 SUBSTR(‘문자열’ OR 컬럼명, 시작인덱스, 종료인덱스)----------
SELECT 
    PRODUCT,
    SUBSTR(PRODUCT,1,7)
FROM KOPO_CHANNEL_SEASONALITY_NEW;
-------------------------------------------------------------------------------

-- 컬럼 값 채우기 LPAD(컬럼명, 자릿수, ‘붙일문자‘)-----------------------------
SELECT 
LPAD(PRODUCT, 10, '0')
FROM KOPO_CHANNEL_SEASONALITY_NEW;
-------------------------------------------------------------------------------

--예제 : KOPO_CUSTOMERDATA 테이블 에서 CUSTOMERCODE를 12자리로 조회하세요
--       단, 12자리가 안될경우 앞에 ‘*’로 채우세요
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

--2. 숫자 함수 -----------------------------------------------------------------
--ROUND 주어진 숫자를 반올림 한 후 출력함            -----------------------------
--CEIL 주어진 숫자와 가장 근접한 큰 정수 출력함      -----------------------------
--FLOOR 주어진 숫자와 가장 근접한 작은 정수 출력함   -----------------------------
--MOD 주어진 숫자를 나누기 한 후 나머지 값 출력함    -----------------------------
--POWER 주어진 숫자1의 숫자2 승을 출력함             -----------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--예제 : NUMBER_EXAMPLE 테이블 에서 FIRST/SECOND NUMBER를 활용하여 아래와 같은
 --      결과를 출력하세요
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
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

--정확도 산출------------------------------------------------------------------
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
    
--CASE : 조건에 맞는경우 WHEN절 값으로 치환

-- 조건문-----------------------------------------------------------------------
--CASE 조건 WHEN 결과1 THEN 출력1
--              WHEN 결과2 THEN 출력2
--              ELSE 출력3
--END “컬럼명＂
SELECT a.*,
case when substr(CUSTID,1,1)='A' then 1
     when substr(CUSTID,1,1)='B' then 0
     when substr(CUSTID,1,1)='C' then 2
     else 3 end as newOrder
     from CUSTOMERDATA a
     order by newOrder;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



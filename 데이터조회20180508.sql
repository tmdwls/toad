select * from KOPO_PRODUCT_VOLUME;


SELECT *
FROM KOPO_PROMOTION
WHERE 1 = 1
AND TARGETWEEK
    BETWEEN &HK_START AND &HK_END;
    
    
    SELECT
   REGIONID, PRODUCTGROUP, YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
AND YEARWEEK BETWEEN 201501 AND 201503
ORDER BY YEARWEEK DESC;


--------------------------------------------------------------
--case when
--Not Avaulable -> Male -> Female
select A.*,
       --LOWER(소문자변화) UPPER(대문자 변화)--
       CASE 
       WHEN LOWER(A.gender) = 'Not Avaulable' then 0
       when UPPER(A.gender) = 'MALE' then 1
       else 2 
       end as sort_order
from kopo_customerdata A
order by sort_order;
--뒤에 desc 내림차순 //asc 오름차순--디폴트는 오름차순
--------------------------------------------------------------



--------------------------------------------------------------
--------------------------------------------------------------
select 
       REGIONID
     , PRODUCTGROUP
     , YEARWEEK
     , volume
from KOPO_PRODUCT_VOLUME
order by YEARWEEK, PRODUCTGROUP desc, YEARWEEK;
-- yeareek 오름차순, PRODUCTGROUP desc 내림차순, YEARWEEK 오름차순 
-- 이러한 순서로 정렬할수도 있다
--order by 뒤에 정렬할 컬럼명 작성
--------------------------------------------------------------
--------------------------------------------------------------







--UNION(합집합)-------------------------
SELECT * 
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
    UNION
SELECT * 
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0002';
--컬럼의 갯수와 순서가 같아야 한다
---------------------------------------




--INTERSECT(교집합)-----------------------------------------
SELECT YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
INTERSECT
SELECT YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0002';
------------------------------------------------------------



-- MINUS (차집합)-----------------------------------------
SELECT YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
MINUS
SELECT YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0002';


SELECT *
FROM KOPO_PRODUCT_VOLUME
WHERE 1=1
AND PRODUCTGROUP = 'ST0001'
MINUS(
        SELECT YEARWEEK
        FROM KOPO_PRODUCT_VOLUME
        WHERE wearweek between 201501 and 201552
);

SELECT *
FROM KOPO_PRODUCT_VOLUME
WHERE 1=1
AND PRODUCTGROUP = 'ST0001'
and yearweek not in(
        SELECT DISTINCT yearweek
        FROM KOPO_CHANNEL_PESULT_NEW
);
--------------------------------------------------------------



-- 대/소문자 변경하기-----------------
SELECT 
   UPPER(PRODUCT) AS CASE1,
   LOWER(PRODUCT) AS CASE2
FROM KOPO_CHANNEL_SEASONALITY_NEW;

SELECT 
    *
FROM KOPO_CHANNEL_SEASONALITY_NEW
WHERE 1=1
AND LOWER(REGIONID) = LOWER(&UI_INPUT1)
AND LOWER(PRODUCT) = LOWER(&UI_INPUT2);
--LOWER : proDuct로 입력후 조회해도 전부 소문자로 인식 후 조회
--UPPER : PROdcut로 입력후 조회해도 저부 대문자로 인식 후 조회
-- 입력해주는 값과 조회해주는 값의 대소문자 방식도 통일되게 바꿔주어야함
--------------------------------------



-- 컬럼 값 합치기---------------------
SELECT 
    CONCAT(REGIONID,CONCAT('_',PRODUCT)) AS KEYCOL1,
    REGIONID||'_'||PRODUCT AS KEYCOL2
FROM KOPO_CHANNEL_SEASONALITY_NEW;
--------------------------------------




-- 컬럼 값 추출하기---------------------
SELECT 
    PRODUCT,
    SUBSTR(PRODUCT,1,7)
FROM KOPO_CHANNEL_SEASONALITY_NEW;


select 4*6/65 from dual;

--2016
select substr('201642',1,4) from dual;

--42
select substr('201642',5,6) from dual;
--from dual : 단일행 조회 할때 쓰임 
---------------------------------------




-- 컬럼 값 채우기---------------------

select lpad('UN42F6000', 15, 'a') from dual;

select * from KOPO_CUSTOMERDATA;

--LPAD
select
LPAD(CUSTOMERCODE, 12, '*')
FROM KOPO_CUSTOMERDATA;
--CUSTOMERCODE를 12자리로 하고 12자리가 안되면 왼쪽으로 *로 채움

--RPAD
select
RPAD(CUSTOMERCODE, 12, '*')
FROM KOPO_CUSTOMERDATA;
--CUSTOMERCODE를 12자리로 하고 12자리가 안되면 오른쪽으로 *로 채움
------------------------------------------


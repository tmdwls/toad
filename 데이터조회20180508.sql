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
       --LOWER(�ҹ��ں�ȭ) UPPER(�빮�� ��ȭ)--
       CASE 
       WHEN LOWER(A.gender) = 'Not Avaulable' then 0
       when UPPER(A.gender) = 'MALE' then 1
       else 2 
       end as sort_order
from kopo_customerdata A
order by sort_order;
--�ڿ� desc �������� //asc ��������--����Ʈ�� ��������
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
-- yeareek ��������, PRODUCTGROUP desc ��������, YEARWEEK �������� 
-- �̷��� ������ �����Ҽ��� �ִ�
--order by �ڿ� ������ �÷��� �ۼ�
--------------------------------------------------------------
--------------------------------------------------------------







--UNION(������)-------------------------
SELECT * 
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
    UNION
SELECT * 
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0002';
--�÷��� ������ ������ ���ƾ� �Ѵ�
---------------------------------------




--INTERSECT(������)-----------------------------------------
SELECT YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
INTERSECT
SELECT YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0002';
------------------------------------------------------------



-- MINUS (������)-----------------------------------------
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



-- ��/�ҹ��� �����ϱ�-----------------
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
--LOWER : proDuct�� �Է��� ��ȸ�ص� ���� �ҹ��ڷ� �ν� �� ��ȸ
--UPPER : PROdcut�� �Է��� ��ȸ�ص� ���� �빮�ڷ� �ν� �� ��ȸ
-- �Է����ִ� ���� ��ȸ���ִ� ���� ��ҹ��� ��ĵ� ���ϵǰ� �ٲ��־����
--------------------------------------



-- �÷� �� ��ġ��---------------------
SELECT 
    CONCAT(REGIONID,CONCAT('_',PRODUCT)) AS KEYCOL1,
    REGIONID||'_'||PRODUCT AS KEYCOL2
FROM KOPO_CHANNEL_SEASONALITY_NEW;
--------------------------------------




-- �÷� �� �����ϱ�---------------------
SELECT 
    PRODUCT,
    SUBSTR(PRODUCT,1,7)
FROM KOPO_CHANNEL_SEASONALITY_NEW;


select 4*6/65 from dual;

--2016
select substr('201642',1,4) from dual;

--42
select substr('201642',5,6) from dual;
--from dual : ������ ��ȸ �Ҷ� ���� 
---------------------------------------




-- �÷� �� ä���---------------------

select lpad('UN42F6000', 15, 'a') from dual;

select * from KOPO_CUSTOMERDATA;

--LPAD
select
LPAD(CUSTOMERCODE, 12, '*')
FROM KOPO_CUSTOMERDATA;
--CUSTOMERCODE�� 12�ڸ��� �ϰ� 12�ڸ��� �ȵǸ� �������� *�� ä��

--RPAD
select
RPAD(CUSTOMERCODE, 12, '*')
FROM KOPO_CUSTOMERDATA;
--CUSTOMERCODE�� 12�ڸ��� �ϰ� 12�ڸ��� �ȵǸ� ���������� *�� ä��
------------------------------------------


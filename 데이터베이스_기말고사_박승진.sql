----1.번 문제 -----------------------------------------------------------
create table KOPO_ST_박승진_FINAL1 as (
select *
from(select
REGIONID,
PRODUCT,
YEARWEEK,
QTY,
substr(YEARWEEK,5,2) as week,
substr(YEARWEEK,1,4) as year
from kopo_channel_seasonality_final a
ORDER BY WEEK desc)
where 1=1
and week != '53'
and year >= 2015
and PRODUCT IN ('PRODUCT1','PRODUCT2')
);
--------------------------------------------------------------------------


----2.번 문제 -----------------------------------------------------------
create table KOPO_ST_박승진_FINAL2 as(
select
    REGIONID,
    PRODUCT, 
    ROUND(AVG(QTY)) as AVG_QTY
    from KOPO_ST_박승진_FINAL1
    GROUP BY REGIONID, PRODUCT);
--------------------------------------------------------------------------
  


----3.번 문제 -----------------------------------------------------------
CREATE TABLE KOPO_ST_박승진_FINAL3 as (
select
    A.REGIONID,
    A.PRODUCT,
    A.YEARWEEK,
    A.QTY,
    B.AVG_QTY
  FROM KOPO_ST_박승진_FINAL1 A
  LEFT JOIN KOPO_ST_박승진_FINAL2 B
  ON A.REGIONID = B.REGIONID
  AND A.PRODUCT = B.PRODUCT);
--------------------------------------------------------------------------



----4.번 문제 -----------------------------------------------------------
CREATE TABLE KOPO_ST_박승진_FINAL4 as(
select
    REGIONID,
    PRODUCT,
    YEARWEEK,
    QTY,
    AVG_QTY,
    ROUND((QTY/AVG_QTY),2) as RATIO
    FROM KOPO_ST_박승진_FINAL3);
----------------------------------------------------------------------------   
    


----5.번 문제 -----------------------------------------------------------
CREATE TABLE KOPO_ST_박승진_FINAL5 as(
select 
    REGIONID,
    PRODUCT,
    SUBSTR(YEARWEEK,5,2) as WEEK,
    ROUND(AVG(RATIO),2) as RATIO
    from KOPO_ST_박승진_FINAL4
    GROUP BY REGIONID, PRODUCT, SUBSTR(YEARWEEK,5,2));
-------------------------------------------------------------------------   



----6.번 문제 -----------------------------------------------------------
CREATE TABLE KOPO_ST_박승진_FINAL6 as(
select * from KOPO_ST_박승진_FINAL5
PIVOT(
    SUM(RATIO)
    FOR WEEK IN('01' W01,'02' W02,'03' W03,'04' W04,'05' 
    W05,'06' W06,'07' W07,'08' W08,'09' W09,'10' W10)
));
--------------------------------------------------------------------------
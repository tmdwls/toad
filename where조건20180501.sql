select * From KOPO_PROMOTION;

select 
   REGIONID,
   ITEM,
   TARGETWEEK,
   PLANWEEK,
   MAP_PRICE,
   IR,
   PMAP,
   PRODUCT,
   round(PMAP*0.9) as PMAP10,
   case when MAP_PRICE = 0--프라이스가 0이면 1 변환하고 PMAP/MAP_PRICE 실행 하고 case는 end로 끝을냄
            then 1
        else PMAP/NVL(MAP_PRICE,1) end as promtion_ratio--NVL : NULL값이 있으면 1로 대처하라는 명령
from 
     KOPO_PROMOTION;
     
 select * from KOPO_PROMOTION
 where 1=1
 and MAP_PRICE is null;--null값 찾기(number타입) MAP_PRICE = ''도 가능
 
 
 select * from kopo_product_volume
 where 1=1
 and yearweek between 201515 and 201516;--between a and b : A 와 B사이에 있는 범위 값을 모두 검색
 
  select * from kopo_product_volume
 where 1=1
 and yearweek in ('201515', '201517', '201519');--in (a,b,c) : A 이거나 B 이거나 C 인 조건을 검색

 
 select * from tabs
 where table_name like '%MST%'; -- like : 특정 패턴을 가지고 있는 조건을 검색
 
 --and : 두조건 전부 만족하는 경우 
 SELECT
   REGIONID, PRODUCTGROUP, YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
AND YEARWEEK = '201544';

 --or : 두조건중 한가지만 만족하는 경우
 SELECT
   REGIONID, PRODUCTGROUP, YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
OR YEARWEEK = '201544';



 
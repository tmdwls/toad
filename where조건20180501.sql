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
   case when MAP_PRICE = 0--�����̽��� 0�̸� 1 ��ȯ�ϰ� PMAP/MAP_PRICE ���� �ϰ� case�� end�� ������
            then 1
        else PMAP/NVL(MAP_PRICE,1) end as promtion_ratio--NVL : NULL���� ������ 1�� ��ó�϶�� ���
from 
     KOPO_PROMOTION;
     
 select * from KOPO_PROMOTION
 where 1=1
 and MAP_PRICE is null;--null�� ã��(numberŸ��) MAP_PRICE = ''�� ����
 
 
 select * from kopo_product_volume
 where 1=1
 and yearweek between 201515 and 201516;--between a and b : A �� B���̿� �ִ� ���� ���� ��� �˻�
 
  select * from kopo_product_volume
 where 1=1
 and yearweek in ('201515', '201517', '201519');--in (a,b,c) : A �̰ų� B �̰ų� C �� ������ �˻�

 
 select * from tabs
 where table_name like '%MST%'; -- like : Ư�� ������ ������ �ִ� ������ �˻�
 
 --and : ������ ���� �����ϴ� ��� 
 SELECT
   REGIONID, PRODUCTGROUP, YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
AND YEARWEEK = '201544';

 --or : �������� �Ѱ����� �����ϴ� ���
 SELECT
   REGIONID, PRODUCTGROUP, YEARWEEK
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
OR YEARWEEK = '201544';



 
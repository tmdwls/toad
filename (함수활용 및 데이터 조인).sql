---1. DECODE ����ϱ� (SWITCH)
--��Ȯ�� = 1- ABS(������-������)/������
--���� : DT_RESULT_FINAL3 ���̺��� ��Ȯ���� �����ϼ���
--��, �������� 0�ΰ�� ��Ȯ���� 0
--------------------------------------------------------------------------
SELECT * from DT_RESULT_FINAL3;                                         --
SELECT                                                                  --
    A.*                                                                 --
    ,DECODE(A.PREDICTION_QTY,0,0                                        --
 -- ,0.5,'UNDEFINED'                                                    --
    ,(1-ABS(PREDICTION_QTY - REAL_QTY) / PREDICTION_QTY)) as ACCURACY   --
    from DT_RESULT_FINAL3 A;                                            --
--------------------------------------------------------------------------
--------------------------------------------------------------------------

--2. �����Լ�
--AVG(�÷�) : ��� 
--SUM(�÷�) : �հ�
--COUNT(�÷�) : �Ǽ�
--MIN/MAX(�÷�) : �ּ�/�ִ밪
--------------------------------------------------------------------------
SELECT AVG(QTY) FROM KOPO_CHANNEL_SEASONALITY_NEW;                      --
SELECT SUM(QTY) FROM KOPO_CHANNEL_SEASONALITY_NEW;                      --
SELECT COUNT(QTY) FROM KOPO_CHANNEL_SEASONALITY_NEW;                    --
SELECT MIN(QTY) FROM KOPO_CHANNEL_SEASONALITY_NEW;                      --
SELECT MAX(QTY) FROM KOPO_CHANNEL_SEASONALITY_NEW;                      --
--------------------------------------------------------------------------
--------------------------------------------------------------------------

--2_1. GROUP BY
--------------------------------------------------------------------------
SELECT                                                                  --
    REGIONID,                                                           --
    PRODUCT,                                                            -- 
    AVG(QTY)                                                            --
FROM KOPO_CHANNEL_SEASONALITY_NEW                                       --
GROUP BY REGIONID, PRODUCT                                              --
ORDER BY REGIONID, PRODUCT;                                             --
--------------------------------------------------------------------------
SELECT                                                                  --
    REGIONID,                                                           --
    PRODUCT,                                                            --
    AVG(QTY),                                                           --
    MAX(QTY),                                                           --
    MIN(QTY)                                                            --
FROM KOPO_CHANNEL_SEASONALITY_NEW                                       --
GROUP BY REGIONID, PRODUCT                                              --
HAVING MIN(QTY) > 2000;                                                 --
--------------------------------------------------------------------------
SELECT                                                                  --
    REGIONID,                                                           --
    PRODUCT,                                                            --
    AVG(QTY)                                                            --
FROM KOPO_CHANNEL_SEASONALITY_NEW                                       --
WHERE REGIONID = 'A01'                                                  --
GROUP BY REGIONID, PRODUCT                                              --
HAVING AVG(QTY) > 10000;                                                --
--------------------------------------------------------------------------

--���� : RMSE_MAE_EXAMPLE ���̺��� Ȱ���Ͽ� ITEM�� RMSE�� ���ϼ��� -------      
SELECT * FROM RMSE_MAE_EXAMPLE;
SELECT 
    ITEM,
    SQRT(AVG(POWER(ABS(QTY-PREDICTION),2))) as RMSE
FROM RMSE_MAE_EXAMPLE
GROUP BY ITEM ;
--------------------------------------------------------------------------     
SELECT 
    a.*,
    abs(QTY-PREDICTION)as ERROR,
    POWER(abs(QTY-PREDICTION),2) as ERROR_POW
 --   AVG(POWER(abs(QTY-PREDICTION),2))  
FROM RMSE_MAE_EXAMPLE a;









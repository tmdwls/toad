---1. DECODE 사용하기 (SWITCH)
--정확도 = 1- ABS(예측값-실측값)/예측값
--예제 : DT_RESULT_FINAL3 테이블에서 정확도를 산출하세요
--단, 예측값이 0인경우 정확도는 0
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

--2. 집계함수
--AVG(컬럼) : 평균 
--SUM(컬럼) : 합계
--COUNT(컬럼) : 건수
--MIN/MAX(컬럼) : 최소/최대값
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

--예제 : RMSE_MAE_EXAMPLE 테이블을 활용하여 ITEM별 RMSE를 구하세요 -------      
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









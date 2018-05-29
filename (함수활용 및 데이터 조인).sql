---1. DECODE 사용하기 (SWITCH)
--정확도 = 1- ABS(예측값-실측값)/예측값
--예제 : DT_RESULT_FINAL3 테이블에서 정확도를 산출하세요
--단, 예측값이 0인경우 정확도는 0
--------------------------------------------------------------------------
SELECT * from DT_RESULT_FINAL3;                                         --
SELECT                                                                  --
    A.*                                                                 --
    ,DECODE(A.PREDICTION_QTY,0,0                                        --
   -- ,0.5,'UNDEFINED'                                                  --
    ,(1-ABS(PREDICTION_QTY - REAL_QTY) / PREDICTION_QTY)) as ACCURACY   --
    from DT_RESULT_FINAL3 A                                             --
--------------------------------------------------------------------------


---1. DECODE ����ϱ� (SWITCH)
--��Ȯ�� = 1- ABS(������-������)/������
--���� : DT_RESULT_FINAL3 ���̺��� ��Ȯ���� �����ϼ���
--��, �������� 0�ΰ�� ��Ȯ���� 0
--------------------------------------------------------------------------
SELECT * from DT_RESULT_FINAL3;                                         --
SELECT                                                                  --
    A.*                                                                 --
    ,DECODE(A.PREDICTION_QTY,0,0                                        --
   -- ,0.5,'UNDEFINED'                                                  --
    ,(1-ABS(PREDICTION_QTY - REAL_QTY) / PREDICTION_QTY)) as ACCURACY   --
    from DT_RESULT_FINAL3 A                                             --
--------------------------------------------------------------------------


SELECT STATUS,--状态1-8 ,8未提交 1,待审核,2被退回,5已经审核,按反审核回到待审核状态
SECOND_WHSE_PTR,--当前审核用户              --
 * FROM Data0070 
 
 select STATUS ,* from Data0070 where PO_NUMBER like 'PUR13-05-0075'

UPDATE Data0070 SET STATUS=5 where PO_NUMBER like 'PUR13-05-0075'--采购单号

select RKEY,STATUS,* from data0071 where PO_PTR  ( SELECT RKEY where PO_NUMBER like 'PUR13-05-0075'--采购单号)
再把71表的status=0就可以行关闭了
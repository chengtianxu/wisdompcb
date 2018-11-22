--报废单要改已核
--报废单data0158和data0058，还有Vdata0158_1,vdata0158_2
--只要把data0158.status从1未提交改为2已审核
SELECT STATUS,* FROM data0158 WHERE MRB_NO='' --报废单号

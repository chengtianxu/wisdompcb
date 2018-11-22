--EP700 提交审批和审批信息查询
--提交审批
select top 1 DATA0073_KEY from data0707 where data0034_rkey='329' and flow_no='0' order by SEQ,RKEY  --883

update data0700 set Status=1,SK_WaitFor='883',SK_USER_PTR=null  where rkey='SL00021732  '

update data0701 set issuedflag=0 where data0700_rkey='SL00021732  '
--审批审核信息查询
SELECT     data0707.SEQ, data0707.RKEY, '(' + Data0073.USER_ID + ') ' + ISNULL(Data0005.EMPLOYEE_NAME, '') AS UserN,
isnull(data0707.flow_no,0) as flow_no,data0707.remark
FROM         data0707 
INNER JOIN          Data0073 ON data0707.DATA0073_KEY = Data0073.RKEY 
LEFT OUTER JOIN     Data0005 ON Data0073.EMPLOYEE_PTR = Data0005.RKEY
WHERE     (data0707.DATA0034_RKEY =999)--@P1
ORDER BY data0707.SEQ, data0707.RKEY

go
SELECT     '(' + Data0073.USER_ID + ') ' + ISNULL(Data0005.EMPLOYEE_NAME, '') AS UserN, Data0710.SKTime, Data0710.SKType, Data0710.SKRmk
FROM         Data0710 INNER JOIN
                      Data0073 ON Data0710.SKUser = Data0073.RKEY LEFT OUTER JOIN
                      Data0005 ON Data0073.EMPLOYEE_PTR = Data0005.RKEY
WHERE     (Data0710.SLRkey ='SL00020742  ') --@P1
ORDER BY Data0710.SKTime



--EP702选择可退回的申请单号
--Vdata0703_4
SELECT     dbo.data0700.RKEY, dbo.data0700.DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.data0700.TDATE, dbo.Data0005.EMPLOYEE_NAME AS USER_FULL_NAME
FROM         dbo.data0700 LEFT OUTER JOIN
                      dbo.Data0034 ON dbo.data0700.DEPT_CODE = dbo.Data0034.RKEY LEFT OUTER JOIN
                      dbo.Data0005 RIGHT OUTER JOIN
                      dbo.Data0073 ON dbo.Data0005.RKEY = dbo.Data0073.EMPLOYEE_PTR ON dbo.data0700.USER_PTR = dbo.Data0073.RKEY
WHERE     (dbo.data0700.STATUS = 3)

SELECT RKEY As 申领单号,DEPT_NAME As 申领部门,TDATE As 申领日期,USER_FULL_NAME As 申领人员 FROM Vdata0703_4  Where 1=1 and 1=1 and dept_code='329' Order by RKEY

--可退回的材料项
SELECT BARCODE_ID,INV_PART_NUMBER,INV_PART_DESCRIPTION,INV_DESCRIPTION,UNIT_NAME,REFERENCE_NUMBER,QUAN,RETURN_QUAN,FFSL,RKEY1 
FROM VDATA0703_3 
WHERE 1=1 AND LOCATION_PTR IN(1,2,3,4,5,6,7,8,10,11,12,13,14,15,16) AND RKEY='SL00016946'  Order by BARCODE_ID ASC
-- VDATA0703_3
SELECT     dbo.data0706.RKEY1, dbo.Data0022.BARCODE_ID, dbo.data0701.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0017.INV_DESCRIPTION, 
                      dbo.data0706.QUAN, dbo.Data0002.UNIT_NAME, dbo.data0706.RETURN_QUAN, ISNULL(dbo.Data0022.REFERENCE_NUMBER, ' ') AS Reference_Number, 
                      dbo.Data0022.LOCATION_PTR, dbo.data0700.RKEY, 1 AS FFSL--？？
FROM         dbo.Data0017 LEFT OUTER JOIN
                      dbo.data0701 ON dbo.Data0017.INV_PART_NUMBER = dbo.data0701.INV_PART_NUMBER RIGHT OUTER JOIN
                      dbo.data0706 LEFT OUTER JOIN
                      dbo.Data0022 ON dbo.data0706.DATA0022_RKEY = dbo.Data0022.RKEY ON dbo.data0701.RKEY = dbo.data0706.RKEY LEFT OUTER JOIN
                      dbo.data0700 ON dbo.data0701.DATA0700_RKEY = dbo.data0700.RKEY LEFT OUTER JOIN
                      dbo.Data0002 ON dbo.Data0017.PURCH_UNIT_PTR = dbo.Data0002.RKEY
select SO_PTR,SCH_COMPL_DATE,* from Data0006 where WORK_ORDER_NUMBER like '151009010-0-30-24'
select ORIG_SCHED_SHIP_DATE,SCH_DATE,ORIG_REQUEST_DATE,ENT_DATE,* from Data0060 where RKEY=6134
select * from data0360 where so_ptr=6134

select MFG_LEAD_TIME,CUSTOMER_PART_NUMBER,CP_REV,* from Data0050 where rkey like '2463'
select PROD_CODE_PTR, * from Data0025 where ANCESTOR_PTR =2463
select * from Data0008 where rkey=2
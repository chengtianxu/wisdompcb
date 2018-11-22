--EP100查找层压图有光板的
--在层压示意图特殊信息里
select CP_REV ,TSTATUS,* from Data0050 where CUSTOMER_PART_NUMBER like 'S6G234177'
select * from data0025 where rkey=12388 --'6LFR4 1.6MM 1OZ ENIG 71.56*75MM TG130' 

select * from Data0025 where ANCESTOR_PTR=11498 --MANU_PART_DESC like '6LFR4 1.6MM 1OZ ENIG 71.56*75MM TG130'
select * from Data0046 where SRCE_PTR=11498

--update Data0046 set LINE_03='afdasf光板dfa' ,no_lines=4 where SRCE_PTR=11498

select * from Data0050 where RKEY in
(
select ANCESTOR_PTR from Data0025 where 
RKEY in
(
select SRCE_PTR --,*
 from Data0046 
where  CHARINDEX('光板',LINE_01)>0 or CHARINDEX('光板',LINE_02)>0 or CHARINDEX('光板',LINE_03)>0 or CHARINDEX('光板',LINE_04)>0 or CHARINDEX('光板',LINE_05)>0 
or     CHARINDEX('光板',LINE_06)>0 or CHARINDEX('光板',LINE_07)>0 or CHARINDEX('光板',LINE_08)>0 or CHARINDEX('光板',LINE_09)>0 or CHARINDEX('光板',LINE_10)>0 
or     CHARINDEX('光板',LINE_11)>0 or CHARINDEX('光板',LINE_12)>0 or CHARINDEX('光板',LINE_13)>0 or CHARINDEX('光板',LINE_14)>0 or CHARINDEX('光板',LINE_15)>0 
or     CHARINDEX('光板',LINE_16)>0 or CHARINDEX('光板',LINE_17)>0 or CHARINDEX('光板',LINE_18)>0 or CHARINDEX('光板',LINE_19)>0 or CHARINDEX('光板',LINE_20)>0 
))


select * from Data0050 
join data0059 on data0050.RKEY=data0059.cust_part_ptr

where data0059.ONHOLD_SALES_FLAG=0 and ( last_modified_date between '2013-1-1' and '2013-7-1'
) 
and 
data0050.RKEY in
(
select ANCESTOR_PTR from Data0025 where 
RKEY in
(
select SRCE_PTR --,*
 from Data0046 
where  CHARINDEX('光板',LINE_01)>0 or CHARINDEX('光板',LINE_02)>0 or CHARINDEX('光板',LINE_03)>0 or CHARINDEX('光板',LINE_04)>0 or CHARINDEX('光板',LINE_05)>0 
or     CHARINDEX('光板',LINE_06)>0 or CHARINDEX('光板',LINE_07)>0 or CHARINDEX('光板',LINE_08)>0 or CHARINDEX('光板',LINE_09)>0 or CHARINDEX('光板',LINE_10)>0 
or     CHARINDEX('光板',LINE_11)>0 or CHARINDEX('光板',LINE_12)>0 or CHARINDEX('光板',LINE_13)>0 or CHARINDEX('光板',LINE_14)>0 or CHARINDEX('光板',LINE_15)>0 
or     CHARINDEX('光板',LINE_16)>0 or CHARINDEX('光板',LINE_17)>0 or CHARINDEX('光板',LINE_18)>0 or CHARINDEX('光板',LINE_19)>0 or CHARINDEX('光板',LINE_20)>0 
))
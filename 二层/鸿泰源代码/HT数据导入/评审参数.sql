select * from Data0087
--select * from data0089 
select * from Data0278 where RKEY =93

SELECT Data0087.RKEY, Data0087.PARAMETER_PTR,Data0087.SEQ_NO, Data0087.group_ptr, Data0087.ttype
FROM Data0087 INNER JOIN Data0007 ON Data0087.group_ptr = Data0007.RKEY INNER JOIN
Data0008 ON Data0007.RKEY = Data0008.PR_GRP_POINTER
WHERE (Data0008.RKEY = 10) ORDER BY Data0087.SEQ_NO


select * from [192.168.1.253].sj_v20_live.dbo.data0050
where CUSTOMER_PART_NUMBER='L6474W2' and CP_REV='A1'
--字符
select data0025.RKEY,61 as parameter_ptr, data0050.CM_COLOR  as tvalue into #D89 from [192.168.1.253].sj_v20_live.dbo.data0050
inner join [192.168.1.253].sj_v20_live.dbo.data0025 on data0025.ANCESTOR_PTR=data0050.RKEY  and data0025.PARENT_PTR=0
where data0050.CM_COLOR <>'' and data0025.RKEY in (select RKEY from data0025)

--包装
insert into #D89 (RKEY,parameter_ptr, tvalue)
select data0025.RKEY,69 as parameter_ptr, data0050.analysis_code_2 as tvalue from [192.168.1.253].sj_v20_live.dbo.data0050
inner join [192.168.1.253].sj_v20_live.dbo.data0025 on data0025.ANCESTOR_PTR=data0050.RKEY  and data0025.PARENT_PTR=0
where data0050.analysis_code_2 <>'' and data0025.RKEY in (select RKEY from data0025)

--测试
insert into #D89 (RKEY,parameter_ptr, tvalue)
select data0025.RKEY,68 as parameter_ptr, data0050.etest_tp as tvalue from [192.168.1.253].sj_v20_live.dbo.data0050
inner join [192.168.1.253].sj_v20_live.dbo.data0025 on data0025.ANCESTOR_PTR=data0050.RKEY  and data0025.PARENT_PTR=0
where data0050.etest_tp <>'' and data0025.RKEY in (select RKEY from data0025)

--板厚
insert into #D89 (RKEY,parameter_ptr, tvalue)
select data0025.RKEY,29 as parameter_ptr, data0050.mat_thick as tvalue from [192.168.1.253].sj_v20_live.dbo.data0050
inner join [192.168.1.253].sj_v20_live.dbo.data0025 on data0025.ANCESTOR_PTR=data0050.RKEY  and data0025.PARENT_PTR=0
where data0050.mat_thick <>'' and data0025.RKEY in (select RKEY from data0025)

--基材类型
insert into #D89 (RKEY,parameter_ptr, tvalue)
select data0025.RKEY,26 as parameter_ptr, data0050.mat_tp as tvalue from [192.168.1.253].sj_v20_live.dbo.data0050
inner join [192.168.1.253].sj_v20_live.dbo.data0025 on data0025.ANCESTOR_PTR=data0050.RKEY  and data0025.PARENT_PTR=0
where data0050.mat_tp <>'' and data0025.RKEY in (select RKEY from data0025)

--板材供应商
insert into #D89 (RKEY,parameter_ptr, tvalue)
select data0025.RKEY,28 as parameter_ptr, data0050.mat_fact as tvalue from [192.168.1.253].sj_v20_live.dbo.data0050
inner join [192.168.1.253].sj_v20_live.dbo.data0025 on data0025.ANCESTOR_PTR=data0050.RKEY  and data0025.PARENT_PTR=0
where data0050.mat_fact <>'' and data0025.RKEY in (select RKEY from data0025)

--阻焊
insert into #D89 (RKEY,parameter_ptr, tvalue)
select data0025.RKEY,56 as parameter_ptr, data0050.SM_COLOR as tvalue from [192.168.1.253].sj_v20_live.dbo.data0050
inner join [192.168.1.253].sj_v20_live.dbo.data0025 on data0025.ANCESTOR_PTR=data0050.RKEY  and data0025.PARENT_PTR=0
where data0050.SM_COLOR <>'' and data0025.RKEY in (select RKEY from data0025)

--成品铜厚
insert into #D89 (RKEY,parameter_ptr, tvalue)
select data0025.RKEY,93 as parameter_ptr, data0050.outer_oz as tvalue from [192.168.1.253].sj_v20_live.dbo.data0050
inner join [192.168.1.253].sj_v20_live.dbo.data0025 on data0025.ANCESTOR_PTR=data0050.RKEY  and data0025.PARENT_PTR=0
where data0050.outer_oz <>'' and data0025.RKEY in (select RKEY from data0025)

--过孔工艺  
insert into #D89 (RKEY,parameter_ptr, tvalue)          
select data0025.RKEY,57 as parameter_ptr, data0050.sm_type  as tvalue from [192.168.1.253].sj_v20_live.dbo.data0050
inner join [192.168.1.253].sj_v20_live.dbo.data0025 on data0025.ANCESTOR_PTR=data0050.RKEY  and data0025.PARENT_PTR=0
where data0050.sm_type <>'' and data0025.RKEY in (select RKEY from data0025)

--板材铜厚  
insert into #D89 (RKEY,parameter_ptr, tvalue)                      
select data0025.RKEY,27 as parameter_ptr, data0050.mat_oz as tvalue from [192.168.1.253].sj_v20_live.dbo.data0050
inner join [192.168.1.253].sj_v20_live.dbo.data0025 on data0025.ANCESTOR_PTR=data0050.RKEY  and data0025.PARENT_PTR=0
where data0050.mat_oz <>'' and data0025.RKEY in (select RKEY from data0025)

--成型方法
insert into #D89 (RKEY,parameter_ptr, tvalue)
select data0025.RKEY,144 as parameter_ptr, data0050.cnc_tp as tvalue from [192.168.1.253].sj_v20_live.dbo.data0050
inner join [192.168.1.253].sj_v20_live.dbo.data0025 on data0025.ANCESTOR_PTR=data0050.RKEY  and data0025.PARENT_PTR=0
where data0050.cnc_tp <>'' and data0025.RKEY in (select RKEY from data0025)

--工艺类型   
insert into #D89 (RKEY,parameter_ptr, tvalue)                     
select data0025.RKEY,143 as parameter_ptr, data0050.eng_tp as tvalue from [192.168.1.253].sj_v20_live.dbo.data0050
inner join [192.168.1.253].sj_v20_live.dbo.data0025 on data0025.ANCESTOR_PTR=data0050.RKEY  and data0025.PARENT_PTR=0
where data0050.eng_tp <>'' and data0025.RKEY in (select RKEY from data0025)



select RKEY as cust_part_ptr,parameter_ptr, tvalue into #D089 from #D89
order by RKEY,parameter_ptr



select * from data0089

insert into data0089(cust_part_ptr,parameter_ptr, tvalue)
select cust_part_ptr,parameter_ptr, tvalue from #D089




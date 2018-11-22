select * from (select 
data0417.FASSET_CODE   [设备代码],
data0417.FASSET_NAME   [设备名称],
Data0034.DEPT_CODE     [部门代码],
Data0034.DEPT_NAME     [部门名称],
data0417.LOCATION      [位置],
data0831.PlanMainDate  [计划保养时间],
data0831.MainCycl	   [保养周期],
data0831.StarMainTime  [开始保养时间],
data0831.ActuCompTime  [实际完成时间],
data0831.TimeCons	   [保养消耗时间],
data0831.StdTimeCons   [标准消耗时间],
data0831.TimeCons/data0831.StdTimeCons [达成率],
data0567.NUMBER        [申请编号],
case data0567.status when 0 then '未提交' when 1 then '待受理' when 2 then '已受理'
                     when 3 then '已完工' when 4 then '已验收' when 5 then '被退回' 
                     when 6 then '已暂停' when 8 then '验收退回'  end as [状态],
data0567.failure_degree	  [影响程度],   
data0567.failure_circs	  [故障说明], 
data0567.validate_appraise[验收评价],   
data0567.disposal_date	  [受理日期],
data0567.maintain_text	  [维修记录],
data0567.complete_date	  [完工日期], 
data0567.stop_house	      [暂停小时],
data0567.maintain_house	  [实际维修时间],            
dateDiff(day, data0831.StarMainTime,data0567.disposal_date)[间隔时长],
data0005.EMPL_CODE 雇员代码,
data0005.EMPLOYEE_NAME 雇员名称,
data0842.WorkDate 工作日期,
data0842.BeginTime 开始时间,
data0842.EndTime 结束时间,
data0842.TimeRest 中途休息时间,
data0842.WorkTime 雇员工作时间
from data0417 
join data0034 on data0417.DEPT_PTR=data0034.rkey
join data0831 on data0417.FASSET_CODE=data0831.DeviNumb 
and data0831.TimeCons/data0831.StdTimeCons<=:vAccomplish /*保养计划.达成率*/ 
join data0567 on data0417.rkey=data0567.FASSET_PTR 
and data0567.maintain_house>=:vMaintain_house --and data0567.failure_degree='生产停顿'
 /*维修.实际维修时间>=2小时*/ 
left join Data0842 on Data0842.[Work_ptr]=data0567.rkey
left join data0005 on Data0842.[Empl_ptr]=data0005.rkey
where dateDiff(day, data0831.StarMainTime,data0567.disposal_date)<=:vDisposal_date    
 /*设备维修.受理日期-保养计划.开始保养时间<=30*/ )as t1

---------------------------
设备维修受理 开发备份
---------------------------
select Data0842.*,data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,MainexecStat from Data0842
left join data0005 on Data0842.[Empl_ptr]=data0005.rkey
join data0832 on Data0842.[Status]=data0832.rkey
where [Work_ptr]= :vWork_ptr
---------------------------
OK   
---------------------------


---------------------------
设备维修受理 开发备份
---------------------------
select * from (select NUMBER [申请编号],data0417.FASSET_CODE [设备代码],data0417.FASSET_NAME [设备名称],
case data0567.status when 0 then '未提交' when 1 then '待受理' when 2 then '已受理'
                     when 3 then '已完工' when 4 then '已验收' when 5 then '被退回' 
                     when 6 then '已暂停' when 8 then '验收退回'  end as 状态,
Data0034.DEPT_NAME 部门名称, Data0005.EMPLOYEE_NAME 申报人,data0015.abbr_name 工厂,
Data0005_1.EMPLOYEE_NAME as 受理人,Data0005_2.EMPLOYEE_NAME as 完工人员,   
DATA0567.equipment_grade	[设备级别],failure_degree	[影响程度],
referring_date	提交日期,CONTACT_NAME	联络人,CONTACT_PHONE	联络人电话,failure_circs	故障说明,
disposal_date	受理日期,maintain_text	维修记录,complete_date	完工日期,
validate_appraise	[验收评价],fail_type	异常类别,maintain_house	实际维修时间,
Data0842.WorkDate [工作日期],d5.EMPLOYEE_NAME[雇员],data0832.MainexecStat 工作单状态,
Data0842.BeginTime[开始时间],Data0842.EndTime[结束时间],data0846.FaultName	[故障名称],data0846.stdDate	[标准维修时间],
Data0842.TimeRest[中途休息时间],Data0842.WorkTime[雇员工作时间],Data0842.TimeCons [暂停时间],
case when data0846.stdDate>0 and DATA0567.Staff_Sum_house>0 then
data0846.stdDate/DATA0567.Staff_Sum_house else 0 end [达成率],
'投诉内容'=convert(varchar(500),STUFF((SELECT '；' + remark from data0841
       where data0841.D567_ptr=data0567.rkey and Status_ptr=7
       FOR XML PATH('')), 1, 1, '')),Data0842.Remark[备注],data0840.Location as[责任小组],Data0417.EquiType 是设备类型
from DATA0567
join data0417 on DATA0567.FASSET_PTR=data0417.rkey
join  Data0034 ON DATA0567.DEPT_PTR = Data0034.RKEY 
join  Data0005 ON DATA0567.EMPL_PTR = Data0005.RKEY left outer JOIN
       Data0005 AS Data0005_1 ON DATA0567.disposal_emplptr = Data0005_1.RKEY left outer join
       Data0005 AS Data0005_2 ON Data0567.completion_emplptr=Data0005_2.RKEY left outer join
       Data0015 ON DATA0567.whouse_ptr=data0015.rkey
left join Data0842 on Data0842.[Work_ptr]=DATA0567.rkey
left join data0005 d5 on Data0842.[Empl_ptr]=d5.rkey
join data0832 on Data0842.[Status]=data0832.rkey
left join data0846 on data0846.rkey=DATA0567.d846_ptr 
left join data0840 on DATA0567.D840_ptr=data0840.rkey)W1 
where  
工作日期>=getDate()-30

---------------------------
OK   
---------------------------


---------------------------
保养计划 开发备份
---------------------------
select *from 
(select d31.PlanMainDate	计划保养时间,d15.ABBR_NAME 工厂,d34.DEPT_NAME 部门,
d17.FASSET_NAME 设备名称,d31.DeviNumb	设备编号,d32.MainExecStat 状态,
d17.equipment_grade	设备等级,d17.LOCATION 具体位置,
d31.DeviType	保养类型,d31.MainCycl	保养周期,
d31.StarMainTime	开始保养时间,
d31.ActuCompTime	实际完成时间,d31.MainImpl	保养人,
d31.TimeCons	保养消耗时间,
d31.StdTimeCons	标准消耗时间,
TimeCons/StdTimeCons 达成率,
d73.User_Full_Name 验收人,
d40.Location as [责任小组],
d05.EMPLOYEE_NAME 雇员,d48.WorkDate 工作日期,
d48.BeginTime 开始时间,d48.EndTime 结束时间,
d48.TimeRest 中途休息时间,d48.WorkTime 雇员工作时间,
d31.Remarks	保养记录描述
from data0831 d31
join data0417 d17 on d31.DeviNumb=d17.FASSET_CODE
join data0034 d34 on d17.DEPT_PTR=d34.rkey
join data0015 d15 on d17.warehouse_ptr=d15.rkey
join data0832 d32 on d31.RKEY832=d32.rkey
left join data0073 d73 on d31.MainAcce_UserPtr=d73.rkey
join Data0848 d48 on d31.rkey=d48.Work_ptr
join data0005  d05 on d48.[Empl_ptr]=d05.rkey

left join data0840 d40 on d17.D840_ptr=d40.rkey

where d31.StarMainTime>:SD and d31.StarMainTime<:ED
)as t1

where 达成率<=0.6
---------------------------
OK   
---------------------------


select data0417.FASSET_CODE,FASSET_NAME,data0567.* from data0567 
join data0417 on data0417.rkey=data0567.FASSET_PTR
where maintain_house>2 and failure_degree='生产停顿'
select dateDiff(day ,'2013-9-1',getdate())

select * from data0417 where rkey=26891
update data0567
set disposal_date='2013-9-04 10:22' --'2012-11-12 16:01:00'
where rkey=26891

select top 100 *from data0567 where fail_type='保养不良'
--EP089外发扩展属性关联
--当材料项目与产品部件管理后，可以从产品档案中获取参数保存到材料扩张属性中。
create proc EP089;10
(@inv_group_ptr int,--外发分组指针
@inv_ref_manupart_ptr int)--data0025.rkey部件指针
with encryption
AS

create table #temp01(seqno int,param_flag bit,param_ptr int,param_d0506ptr int,
	param_value varchar(300))

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 1,wf_note01_param_flag,wf_note01_param_ptr,wf_note01_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 2,wf_note02_param_flag,wf_note02_param_ptr,wf_note02_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 3,wf_note03_param_flag,wf_note03_param_ptr,wf_note03_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 4,wf_note04_param_flag,wf_note04_param_ptr,wf_note04_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 5,wf_note05_param_flag,wf_note05_param_ptr,wf_note05_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 6,wf_note06_param_flag,wf_note06_param_ptr,wf_note06_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 7,wf_note07_param_flag,wf_note07_param_ptr,wf_note07_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 8,wf_note08_param_flag,wf_note08_param_ptr,wf_note08_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 9,wf_note09_param_flag,wf_note09_param_ptr,wf_note09_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 10,wf_note10_param_flag,wf_note10_param_ptr,wf_note10_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 11,wf_note11_param_flag,wf_note11_param_ptr,wf_note11_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 12,wf_note12_param_flag,wf_note12_param_ptr,wf_note12_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 13,wf_note13_param_flag,wf_note13_param_ptr,wf_note13_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 14,wf_note14_param_flag,wf_note14_param_ptr,wf_note14_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 15,wf_note15_param_flag,wf_note15_param_ptr,wf_note15_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

insert #temp01(seqno,param_flag,param_ptr,param_d0506ptr,param_value)
select 16,wf_note16_param_flag,wf_note16_param_ptr,wf_note16_param_d0506ptr,''
from data0496
where rkey=@inv_group_ptr

declare @seqno int,@param_flag bit,@param_ptr int,@param_d0506ptr int,
	@param_value varchar(300),@paratypename varchar(30)

declare mycursor1 cursor for 
select *
from #temp01

open mycursor1
fetch next from mycursor1 into @seqno,@param_flag,@param_ptr,@param_d0506ptr,@param_value
while @@fetch_status=0
begin
	if @param_flag=0	--非工序参数
	begin
		select @paratypename=upper(rtrim(category_name))
		from data0278 inner join data0277 on data0278.category_ptr=data0277.rkey
		where data0278.rkey=@param_ptr
		if @paratypename='GENUNIT'	--基本单位
		begin
			select top 1 @param_value=convert(varchar(30),round(parameter_value,4))+
				case when isnull(parameter_value,0)>0 then isnull(unit_name,'') else '' end
			from data0047 inner join data0278 on data0047.parameter_ptr=data0278.rkey
				left join data0002 on data0278.unit_ptr=data0002.rkey and data0002.unit_code<>'<NIL>'
			where source_pointer=@inv_ref_manupart_ptr and parameter_ptr=@param_ptr
			order by data0047.rkey desc
		end
		else						--非基本单位
		begin
			select top 1 @param_value=rtrim(parameter_value)+
				case when isnull(parameter_value,'')<>'' then isnull(unit_name,'') else '' end
			from data0279 inner join data0278 on data0279.parameter_ptr=data0278.rkey
				left join data0002 on data0278.unit_ptr=data0002.rkey and data0002.unit_code<>'<NIL>'
			where source_ptr=@inv_ref_manupart_ptr and parameter_ptr=@param_ptr
			order by data0279.rkey desc
		end
	end
	else				--工序参数
	begin
		select top 1 @param_value=rtrim(parameter_value)+
			case when isnull(parameter_value,'')<>'' then isnull(unit_name,'') else '' end
		from data0494 inner join data0038 on data0494.route_step_ptr=data0038.rkey
			inner join data0278 on data0494.parameter_ptr=data0278.rkey
			left join data0002 on data0278.unit_ptr=data0002.rkey and data0002.unit_code<>'<NIL>'
		where data0038.source_ptr=@inv_ref_manupart_ptr and data0494.source_ptr=@param_d0506ptr
		order by data0038.step_number 
	end
	update #temp01 set param_value=@param_value
	where seqno=@seqno

	fetch next from mycursor1 into @seqno,@param_flag,@param_ptr,@param_d0506ptr,@param_value
end
close mycursor1
deallocate mycursor1

select *
from #temp01
where param_ptr is not null
order by seqno

drop table #temp01

GO


exec sp_executesql N'UPDATE "SJ_V20_live".."data0017"
 SET "STOCK_PURCH"=@P1,"FAILURE_RATE"=@P2,"WF_NOTE01_VALUE"=@P3,"WF_NOTE02_VALUE"=@P4,"WF_NOTE03_VALUE"=@P5,"REF_MANU_PART_PTR"=@P6,"WF_NOTES_REMARK"=@P7,"USE_FLAG"=@P8,"CONF_FLAG"=@P9,"ALARM_FLAG"=@P10,"ALARM_Ptr"=@P11,"evaluedate"=@P12,"Modify_By"=@P13,"Modify_DATE"=@P14 
 WHERE "RKEY"=@P15 AND "STOCK_PURCH"=@P16 AND "FAILURE_RATE"=@P17 AND "WF_NOTE01_VALUE" IS NULL AND "WF_NOTE02_VALUE" IS NULL AND "WF_NOTE03_VALUE" IS NULL AND "REF_MANU_PART_PTR" IS NULL AND "USE_FLAG"=@P18 AND "CONF_FLAG"=@P19 AND "ALARM_FLAG"=@P20 AND "ALARM_Ptr" IS NULL AND "evaluedate"=@P21 AND "Modify_By"=@P22 AND "Modify_DATE"=@P23',
 N'@P1 float,@P2 float,@P3 varchar(300),@P4 varchar(300),@P5 varchar(300),@P6 int,@P7 text,@P8 tinyint,@P9 tinyint,@P10 int,@P11 int,@P12 datetime,@P13 int,@P14 datetime,@P15 int,@P16 float,@P17 float,@P18 tinyint,@P19 tinyint,@P20 int,@P21 datetime,@P22 int,@P23 datetime',
 1,0,'415mm','47.00 x 47.00mm','0.0038无',10881,'大料X方向PNL长度:415mm; PCS尺寸:47.00 x 47.00mm; 平方米(生产):0.0038无. ',0,0,0,0,'2013-07-08 12:52:00',1,'2013-08-14 16:23:50',7846,1,0,0,0,0,'2013-07-08 12:52:00',1,'2013-07-08 12:52:00'
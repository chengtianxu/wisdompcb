select data0034.dept_name,data0050.customer_part_number,Data0050.cp_rev,Data0006.work_order_number 
 from Data0401 
 left join Data0034 on Data0401.dept_ptr=Data0034.Rkey 
 left join Data0006 on Data0401.wo_ptr=Data0006.Rkey 
 left join data0025 on Data0006.bom_ptr=Data0025.Rkey 
 left join data0050 on data0025.ancestor_ptr=Data0050.rkey 
where data0401.status=0  and
data0401.header_ptr=145

---------------------------
--onfirm
-----------------------------
--你确认要用输入的数量替换系统原库存数量吗?
---------------------------
--Yes   No   
---------------------------
--exec ep196;3 146,240
--create procedure ep196;3
declare 
@d400 int=145,
@reject_ptr int =240

as

set nocount on 
declare @msg_err varchar(30)
declare @empl_ptr int
declare @Rej_ptr int
declare @mrb_ptr int
declare @empl_ptr_05 int

select @Rej_ptr=custfedship from data0192

insert into data0401(header_ptr,wo_ptr,dept_ptr,wip_ptr,reject_ptr,
       wip_system_qty,physical_count_qty,enterted_ptr,count_ptr,
       ent_date,user_ptr,status,seaial_no,panels,wiprkey_ptr,physical_panels)
select wipcode_ptr,wo_ptr,dept_ptr,step,@Rej_ptr,
      system_quan,0,employee_ptr,employee_ptr,
      getdate(),(select top 1 rkey from data0073 where employee_ptr=data0402.employee_ptr),2,0,panels,rkey56,0
from data0402
where wipcode_ptr=@d400

select @empl_ptr=Data0073.rkey
From data0401 left join
     Data0073 on Data0401.user_ptr=Data0073.Rkey
Where Data0401.header_ptr=@d400
  and IsNull(Data0401.user_ptr,0)>0
  
select @empl_ptr_05=Data0073.EMPLOYEE_PTR --data0005.rkey 值 20130428 LLL 
From data0401 left join
     Data0073 on Data0401.user_ptr=Data0073.Rkey
Where Data0401.header_ptr=@d400
  and IsNull(Data0401.user_ptr,0)>0


set @msg_err='从删除表转入到盘点表出错'
if @@ERROR > 0 
   RAISERROR (@msg_err, 16, 1) with NOWAIT

delete data0402 where wipcode_ptr=@d400  --将报废的数据转入到盘点表中

declare @wo int,@dept int,@step int,@rej int,@sys int,@phy int,
        @pnl decimal(10,2),@wiprkey int,@phy_pnl decimal(10,2),
        @empl int ,@flow smallint,@mrb_1 nvarchar(15),@set_qty int,@set int

--select @seed_value=seed_value from data0004 where rkey=18
  --select @mrb_1=max(rkey)+1 from data0158 
  
--insert into data0158(mrb_no,empl_ptr,tdatetime,status,mrb_flag)
  --values(@mrb_1,@empl_ptr,getdate(),0,1)
--convert(varchar(10),getdate(),112)
declare  d401 cursor for 
  select wo_ptr,dept_ptr,wip_ptr,reject_ptr,wip_system_qty,physical_count_qty,
    a.panels,wiprkey_ptr,a.physical_panels,IsNull(data0073.employee_ptr,@empl_ptr),b.flow_no from data0401 a
   inner join data0006 b on a.wo_ptr=b.rkey left join
   data0073 on a.user_ptr=data0073.rkey
     where header_ptr=@d400 and (wip_system_qty<>physical_count_qty or a.panels <> a.physical_panels) 

open d401
FETCH NEXT FROM d401 INTO @wo ,@dept ,@step ,@rej ,@sys ,@phy ,@pnl 
                         ,@wiprkey ,@phy_pnl ,@empl,@flow

WHILE(@@FETCH_STATUS=0)
  BEGIN 
     select @set=Data0050.set_x_qty *Data0050.set_y_qty 
       from Data0006 left join Data0025 on Data0006.BOM_PTR=data0025.rkey
         left join Data0050 on Data0025.ANCESTOR_PTR=data0050.rkey and Data0025.PARENT_PTR=0
       where Data0006.rkey=@wo

    if (@sys-@phy)>0
    begin
      if (@sys-@phy)%@set > 0 
        set @set_qty = (@sys-@phy)/@set + 1
      else
        set @set_qty = (@sys-@phy)/@set
    end
    else
    begin
      if (@sys-@phy)%@set <> 0 
        set @set_qty = (@sys-@phy)/@set -1 
      else
        set @set_qty = (@sys-@phy)/@set
     end

        select @mrb_1=cast(seed_value as BIGINT)+1 from data0004 where rkey=18
        insert into data0158(mrb_no,empl_ptr,tdatetime,status,mrb_flag,AUDIT_EMPL_PTR,AUDIT_DATETIME,ttype) --插入data0158表数据
          values(@mrb_1,@empl_ptr_05,getdate(),2,1,@empl_ptr_05,getdate(),2)
    
        insert into data0058 (mrb_no,wo_ptr,dept_ptr,reject_ptr,qty_org_rej,
                qty_reject,panels,flow_no,step,empl_ptr,tdatetime,RESP_DEPT_PTR,SETS_QTY)
            values(@mrb_1,@wo,@dept,isnull(@rej,@Rej_ptr),@sys-@phy,
                @sys-@phy,@phy_pnl-@pnl,@flow,@step,@empl,getdate(),@dept,@set_qty) --@pnl 是盘点PANELS，@phy_pnl是系统@phy_pnl 


      set @mrb_ptr= (select rkey from data0158 where mrb_no=@mrb_1) 

        insert into data0274 (user_ptr,auth_DATE,ranking,mrb_ptr) --data0274审核记录表LLL 20120226
          values(@empl_ptr,getdate(),1,@mrb_ptr)                              
      
        update Data0004 set seed_value=@mrb_1+1 where rkey=18

  set @msg_err= '新增报废出错！作业单ID＝'+cast(@wo as varchar(10))
	if @@ERROR > 0 
	   RAISERROR ( @msg_err, 16, 1) with NOWAIT

    if @sys<>0 --是本工序数据,不需要新增
      begin
        update data0056 
        set qty_backlog=@phy,
            panels=@pnl,SETS_QTY = SETS_QTY - @set_qty
        where rkey=@wiprkey
        update data0006 
        set quan_rej=quan_rej+@sys-@phy
            --panels=panels+@pnl-@phy_pnl --06表的panels数不能改变
        where rkey=@wo
        if @phy=0 --如果已经盘点为0，,就要代为删除
          begin
           delete data0056 where rkey=@wiprkey
           update data0006 
           set prod_status=9 
           where rkey=@wo  
             and not exists(select 1 from Data0056 where Data0056.wo_ptr=Data0006.Rkey)
          end
      end 
    else   --如果是增加了新单
      begin
        if @wiprkey<>0   --新增的其它工序的在线工单
          begin
            update data0056 set qty_backlog=@phy,panels=@pnl,step=@step,
                    dept_ptr=@dept,employee_ptr=@empl,SETS_QTY = SETS_QTY - @set_qty
                where rkey=@wiprkey
            
          end 
         else    --新增的非在线工单
          begin
            insert into data0056 (wo_ptr,dept_ptr,employee_ptr,flow_no,step,
                qty_backlog,panels,intime,SETS_QTY)
              values (@wo,@dept,@empl,@flow,@step,@phy,@pnl,getdate(),- @set_qty)
            update data0006 set quan_rej=quan_rej+@sys-@phy
               --,panels=panels+@pnl-@phy_pnl  --06表的panels数不能改变
              where rkey=@wo
            set @msg_err='新增非在线工单出错！作业单ID＝'+cast(@wo as varchar(10))    
        	if @@ERROR > 0 
	          RAISERROR (@msg_err, 16, 1) with NOWAIT

          end
       update data0006 set prod_status=3
        where rkey=@wo
      end
   FETCH NEXT FROM d401 INTO @wo ,@dept ,@step ,@rej ,@sys ,@phy ,@pnl 
                         ,@wiprkey ,@phy_pnl ,@empl,@flow
  end

close d401
DEALLOCATE d401

go


--修改表头
update data0400 set status=1 where rkey=146
		


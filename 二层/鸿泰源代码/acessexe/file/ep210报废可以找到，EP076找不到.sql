--ep210报废可以找到，EP076找不到
SELECT * FROM data0058 WHERE MRB_NO IN ('1309090183','1309090184') 
--EP076
exec EP076;1 0,'U','0',0,4,1,'0',2,'2013-09-09 00:00:00','2013-09-10 00:59:59','%','0',0,0,0,'%',0,0,'%',2,'204'
--EP210
exec EP210;1 '2013-09-09 00:00:00','2013-09-10 01:59:59',2,'0','U',2,' ORDER BY data0050.customer_part_number',0,0


--exec EP076;1 0,'U','0',0,4,1,'0',2,'2013-09-09 00:00:00','2013-09-10 00:59:59','%','0',0,0,0,'%',0,0,'%',2,'204'
--P2G204017
--create PROCEDURE EP076;1  --明细
declare
  @inde int=0,   --按照报废批量排序,(1,0)
  @tp CHAR(1)='U',  --参数类型,U除,P乘
  @vindex varchar(100)='0',  --责任部门,0全部,其它部门指针
  @vindex2 int=0,--@vindex2=0按本厂编号查@vindex2=1按客户型号查
  @vptr1 int=4,--产品类型,样板,生产板,全部
  @vptr2 int=1,--参数指针
  @vptr3 varchar(100)='0',--产品组别指针
  @vtype INT=2,  --显示0：外层1：内部2：全部
  @vdate1 varchar(20)='2013-09-09 00:00:00',--报废申请时间范围
  @vdate2 varchar(20)='2013-09-10 00:59:59',--报废申请时间范围
  @vproj varchar(20)='%',--本厂编号与客户型号
  @Rject1 varchar(100)='0', --报废原因
  @vlot float=0, --批量值
  @Whse_ptr int=0,--工厂
  @LotScrap int=0,--盘点报废缺陷
  @Work_Order_Number varchar(30)='%', --作业单号
  @flag int=0,  --查询时间，0申请时间，1最后审核时间
  @flag1 int=0,
  @so_no varchar(50)='%',--销售订单号
  @vindex3 int=2,  --责任单位：0:工序；1：部门;2:全部
  @cust1 varchar(32)='204' 		--客户代码
--WITH ENCRYPTION
--AS
declare @sql2 varchar(8000),@sql3 varchar(8000)
declare @JUnit varchar(5),@MUnit varchar(5) 
select @flag=Search_Unit_flag from Data0195
  if @flag = 0  --平方米
  begin
    set @JUnit='L'  --净面积
    set @MUnit='D'  --毛面积
  end
  else   --平方尺
  begin
    set @JUnit='K'
    set @MUnit='E'
  end


set @sql2=' If exists(Select 1 From tempdb..sysobjects Where id=object_id(''tempdb..#tmp''))  drop table #tmp '
set @sql2=@sql2+' If exists(Select 1 From tempdb..sysobjects Where id=object_id(''tempdb..#Result''))  drop table #Result '
/*先计算投产数*/
set @sql2=@sql2+'SELECT Data0492.SO_NO/*销售订单号*/,Data0492.CUT_NO/*投料单号*/,Data0025.MANU_PART_NUMBER,
                data0492.ISSUED_QTY as ISSUED_QTYpcs /*投产PCS数*/'
 if @tp='U' 
 begin 
   set @sql2=@sql2+' ,(data0492.ISSUED_QTY / IsNull(Data0047.PARAMETER_VALUE,1)) AS QTY_PLANNED /*投产数量*/  '
 end 
 if @tp='P' 
 begin
   set @sql2=@sql2+' ,(data0492.ISSUED_QTY * Data0047.PARAMETER_VALUE) AS QTY_PLANNED /*投产数量*/ '
 end
set @sql2=@sql2+' into #tmp '
 set @sql2=@sql2+' From Data0058 Left Join
                        Data0158 on Data0058.mrb_no = Data0158.mrb_no left join 
                        Data0006 On Data0058.WO_PTR=Data0006.RKey Left Join 
                        Data0492 On Data0006.CUT_NO=Data0492.CUT_NO Left Join
                        Data0025 On Data0006.BOM_PTR=Data0025.RKey Left Join
                        Data0050 On Data0025.ANCESTOR_PTR=Data0050.RKey Left Join
                        Data0047 On Data0025.RKey=Data0047.SOURCE_POINTER Left Join
                        Data0034 On Data0058.RESP_DEPT_PTR=Data0034.Rkey left join
                        Data0008 on Data0025.PROD_CODE_PTR=Data0008.Rkey left join
                        Data0039 on Data0058.REJECT_PTR=Data0039.Rkey left join
                        Data0059 on Data0050.Rkey=Data0059.cust_part_ptr
                          and Data0492.customer_ptr=Data0059.customer_ptr 
                        left join data0010 on data0492.customer_ptr=data0010.rkey --20130525 LLL 加客户 
           
                   where ' --2006-5-7更新
  if @vindex3 = 0 
    set @sql2=@sql2+' Data0034.ttype<>4 and '
  else
  if @vindex3 = 1
    set @sql2=@sql2+' Data0034.ttype=4 and '

 set @sql2=@sql2+' Data0039.spec_type=0 AND DATA0047.PARAMETER_PTR = '+convert(varchar(4),@VPTR2) --参数指针

  if @VPTR1<>4 --当不是全部时 LLL 20120517
 set @sql2=@sql2+' and DATA0050.TTYPE = '+convert(char(1),@VPTR1)  --1样板,0生产板,全部
 else 
 set @sql2=@sql2+' and (DATA0050.TTYPE=0 or DATA0050.TTYPE=1) ' --等于全部：包括样板和生产板

-- set @sql2=@sql2+' and DATA0050.TTYPE <> '+convert(char(1),@VPTR1)  --样板,生产板,全部

 if @flag = 0 
 begin
   set @sql2=@sql2+' AND DATA0058.TDATETIME >= '''+@VDATE1  +''''--convert(char(20),@VDATE1)+''''--时间过滤
   set @sql2=@sql2+' AND DATA0058.TDATETIME <= '''+@VDATE2  +''''--+'  23:59:59'''--convert(char(20),@VDATE2)+''''--时间过滤
 end
 else
 begin
   set @sql2=@sql2+' AND Data0158.AUDIT_DATETIME >= '''+@VDATE1  +''''--convert(char(20),@VDATE1)+''''--时间过滤
   set @sql2=@sql2+' AND Data0158.AUDIT_DATETIME <= '''+@VDATE2  +''''--+'  23:59:59'''--convert(char(20),@VDATE2)+''''--时间过滤
 end
 
 if @flag1 = 0 
 begin
   if @tp='U'
     set @sql2=@sql2+' and DATA0058.QTY_REJECT / IsNull(DATA0047.PARAMETER_VALUE,1) >= '+convert(char(12),@vlot) --批量过滤
   if @tp='P'
     set @sql2=@sql2+' and DATA0058.QTY_REJECT * DATA0047.PARAMETER_VALUE >= '+convert(char(12),@vlot)
 end
 else
 begin
   if @tp='U'
     set @sql2=@sql2+' and (DATA0058.QTY_REJECT/isnull(Data0025.parts_num,1) )/ IsNull(DATA0047.PARAMETER_VALUE,1) >= '+convert(char(12),@vlot) --批量过滤
   if @tp='P'
     set @sql2=@sql2+' and (DATA0058.QTY_REJECT/isnull(Data0025.parts_num,1) )* DATA0047.PARAMETER_VALUE >= '+convert(char(12),@vlot)
 end
  
 if @vindex3 <> 2
 begin
  if @vindex <> '0'
  set @sql2=@sql2+' and  data0058.RESP_DEPT_PTR  in ('+convert(varchar(20), @vindex) +')' --责任部门过滤 将原DATA0034.dept_ptr改成data0058.RESP_DEPT_PTR 20130702强制转换 LLL 
 end

  if @vptr3 <> '0'
    set @sql2=@sql2+' AND DATA0008.PR_GRP_POINTER in ('+ convert(varchar(20), @vptr3) +')'--产品组别
  if @Rject1 <> '0'
    set @sql2=@sql2+' and DATA0058.REJECT_PTR in ('+ convert(varchar(20),  @Rject1) +')' --报废原因过滤

   if @vindex2=0          
      set @sql2=@sql2+' and Data0050.CUSTOMER_PART_NUMBER LIKE '''+@VPROJ+''''--按本厂编号过滤
   if @vindex2=1         
      set @sql2=@sql2+' and Data0059.CUSTOMER_PART_DESC LIKE '''+@VPROJ+''''--按客户型号过滤
   set @sql2=@sql2+' and Data0006.work_order_number like '''+@work_order_number+''''--按作业单过滤

  
   --set @sql2=@sql2+' and Data0058.reject_ptr<>'+convert(varchar(5),@LotScrap)--过滤盘点报废

    if @LotScrap=1  -- 如不包括盘点报废，则过滤盘盈和盘亏  20130720 LLL  
    SET @sql2 = @sql2+'  and (Data0058.reject_ptr<>(select custfedship from data0192)) and (Data0058.reject_ptr<>(select CUSTFEDSHIP_loss from data0192)) '  
     


   if @Whse_ptr>0
     set @sql2=@sql2+' and Data0006.whouse_ptr='+convert(varchar(5),@Whse_ptr)--过滤工厂
  if @so_no <> '%'
   set @sql2=@sql2+' and Data0492.so_no LIKE '''+@so_no+''''  

  if @cust1<>''
  set @sql2=@sql2+'and data0010.cust_code like '''+ @cust1+'%'''  --20130525 LLL 加客户 



/*汇总投产数*/
 set @sql2=@sql2+' SELECT SO_NO,MANU_PART_NUMBER,
                  ISSUED_QTYpcs=sum(ISSUED_QTYpcs) /*投产PCS数*/
                 ,QTY_PLANNED=sum(QTY_PLANNED) /*投产数量*/  '
Set @sql2=@sql2+' into #Result'
set @sql2=@sql2+' From (select distinct * from #tmp) a '
Set @sql2=@sql2+' Group by SO_NO,MANU_PART_NUMBER'

/*计算报废数，并且连接投产数*/
 set @sql2=@sql2+' SELECT ABBR_NAME=data0010.cust_code /*客户简称*/, Data0050.CUSTOMER_PART_NUMBER /*本厂编号*/,Data0050.Layers /*层数*/,Data0050.mat_tp /*基材类型*/,
                  Data0050.CP_REV /*版本*/,Data0050.eng_tp, Data0025.MANU_PART_NUMBER /**/, Data0059.CUSTOMER_PART_DESC /*产品描述*/, 
                  Data0008.PRODUCT_NAME /*产品类别*/, data0492.SO_NO /*销售订单号*/,data0492.SCH_COMPL_DATE /*投产日期*/,
                  Data0034.DEPT_NAME /*责任部门*/,Data0039.REJECT_DESCRIPTION /*缺陷名称*/,Data0008.Product_Name /*类型*/,
                  t1.ISSUED_QTYpcs,/*投产PCS数*/t1.QTY_PLANNED/*投产数量*/,factory=Data0015.abbr_name,Data0047.PARAMETER_VALUE,
                  (case Data0050.ttype when 0 then Data0008.EST_SCRAP_LTM when 1 then Data0008.EST_SCRAP1_LMT end) as rej_rate'

 if @flag1 = 0
 begin
   if @tp='U'
   begin 
     set @sql2=@sql2+' ,parts_order=data0060.parts_ordered/IsNull(Data0047.PARAMETER_VALUE,1) ,SUM(Data0058.QTY_REJECT/ IsNull(Data0047.PARAMETER_VALUE,1)) AS QUANTITY /*报废数量*/ '
   end
   if @tp='P'
   begin
     set @sql2=@sql2+' ,parts_order=data0060.parts_ordered*Data0047.PARAMETER_VALUE,SUM(Data0058.QTY_REJECT * Data0047.PARAMETER_VALUE) AS QUANTITY /*报废数量*/'
     
   end
  set  @sql2=@sql2+' ,D47C.PARAMETER_VALUE as JmianJiUnit,round(isnull(sum(Data0058.QTY_REJECT* D47C.PARAMETER_VALUE),0),5) AS JmianJi  ' --20130703 LLL 加净面积单重，和净面积  
 end
 else
 begin
   if @tp='U'
   begin 
     set @sql2=@sql2+' ,parts_order=data0060.parts_ordered/IsNull(Data0047.PARAMETER_VALUE,1) ,SUM((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1))/ IsNull(Data0047.PARAMETER_VALUE,1)) AS QUANTITY /*报废数量*/'
   end
   if @tp='P'
   begin
     set @sql2=@sql2+' ,parts_order=data0060.parts_ordered*Data0047.PARAMETER_VALUE,SUM((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1) )* Data0047.PARAMETER_VALUE) AS QUANTITY /*报废数量*/'
   end
   set  @sql2=@sql2+' ,D47C.PARAMETER_VALUE as JmianJiUnit,round(isnull(sum(Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)* D47C.PARAMETER_VALUE),0) ,5) AS JmianJi  ' --20130703 LLL 加净面积单重，和净面积  
 end

 set @sql2=@sql2+',Data0050.Customer_part_number+'''+' '+'''+data0050.cp_rev as cust_part_number '
 
--Set @sql2=@sql2+' into #Result1'
 set @sql2=@sql2+' From Data0058 left join
     Data0158 on Data0058.mrb_no = Data0158.mrb_no left join 
     Data0006 on Data0058.WO_PTR=Data0006.Rkey left join 
     Data0492 on Data0006.cut_no=Data0492.cut_no left join
     Data0060 on Data0492.so_no=Data0060.sales_order left join
     Data0025 on Data0006.bom_ptr=Data0025.Rkey left join
     Data0050 on Data0025.ancestor_ptr=Data0050.Rkey left join
     Data0059 on Data0050.Rkey=Data0059.cust_part_ptr
             and Data0060.customer_ptr=Data0059.customer_ptr left join
     Data0010 on Data0060.customer_ptr=Data0010.Rkey left join
     Data0008 on Data0025.PROD_CODE_PTR=Data0008.Rkey left join
     Data0039 on Data0058.REJECT_PTR=Data0039.Rkey left join
     Data0034 on Data0058.RESP_DEPT_PTR=Data0034.Rkey left join
     #Result t1 On Data0492.SO_NO=t1.SO_NO and t1.MANU_PART_NUMBER =Data0025.MANU_PART_NUMBER left join
     Data0015 on Data0006.whouse_ptr=Data0015.Rkey 
     LEFT JOIN DATA0047 D47C ON DATA0025.RKEY=D47C.SOURCE_POINTER AND D47C.PARAMETER_PTR=(select top 1 rkey from data0278 where SPEC_RKEY='''+@JUnit+''' ) --20130703 LLL 
     left join   Data0047 on Data0025.RKEY = Data0047.SOURCE_POINTER 
     AND DATA0047.PARAMETER_PTR = '+convert(varchar(4),@VPTR2) --参数指针'
set @sql2=@sql2+' where '
  if @vindex3 = 0 
    set @sql2=@sql2+' Data0034.ttype<>4 and '
  else
  if @vindex3 = 1
    set @sql2=@sql2+' Data0034.ttype=4 and '

 set @sql2=@sql2+' Data0039.spec_type=0 '
 if @VPTR1<>4 --当不是全部时 LLL 20120517
 set @sql2=@sql2+' and DATA0050.TTYPE = '+convert(char(1),@VPTR1)  --1样板,0生产板,全部
 else 
 set @sql2=@sql2+' and (DATA0050.TTYPE=0 or DATA0050.TTYPE=1) ' --等于全部：包括样板和生产板

 if @flag = 0 
 begin
   set @sql2=@sql2+' AND DATA0058.TDATETIME >= '''+@VDATE1  +''''--convert(char(20),@VDATE1)+''''--时间过滤
   set @sql2=@sql2+' AND DATA0058.TDATETIME <= '''+@VDATE2  +''''--+'  23:59:59'''--convert(char(20),@VDATE2)+''''--时间过滤
 end
 else
 begin
   set @sql2=@sql2+' AND Data0158.AUDIT_DATETIME >= '''+@VDATE1  +''''--convert(char(20),@VDATE1)+''''--时间过滤
   set @sql2=@sql2+' AND Data0158.AUDIT_DATETIME <= '''+@VDATE2  +''''--+'  23:59:59'''--convert(char(20),@VDATE2)+''''--时间过滤
 end
 
 if @flag1 =0 
 begin
   if @tp='U'
     set @sql2=@sql2+' and DATA0058.QTY_REJECT / IsNull(DATA0047.PARAMETER_VALUE,1) >= '+convert(char(12),@vlot) --批量过滤
   if @tp='P'
     set @sql2=@sql2+' and DATA0058.QTY_REJECT * DATA0047.PARAMETER_VALUE >= '+convert(char(12),@vlot)
 
 end
 else
 begin
   if @tp='U'
     set @sql2=@sql2+' and (DATA0058.QTY_REJECT/isnull(Data0025.parts_num,1) )/ IsNull(DATA0047.PARAMETER_VALUE,1) >= '+convert(char(12),@vlot) --批量过滤
   if @tp='P'
     set @sql2=@sql2+' and (DATA0058.QTY_REJECT/isnull(Data0025.parts_num,1) )* DATA0047.PARAMETER_VALUE >= '+convert(char(12),@vlot)
 end 
 
  if @vindex3 <> 2
  begin
    if @vindex<> '0' 
    --  set @sql2=@sql2+' and  DATA0034.dept_ptr in ('+ @vindex +')' --责任部门过滤
      set @sql2=@sql2+' and  data0058.RESP_DEPT_PTR  in ('+convert(varchar(20), @vindex) +')'  --责任部门过滤 将原DATA0034.dept_ptr改成data0058.RESP_DEPT_PTR 20130528 LLL  
  end

  if @vptr3 <>'0'
    set @sql2=@sql2+' AND DATA0008.PR_GRP_POINTER in ('+ convert(varchar(20), @vptr3)  +')'--产品组别
  if @Rject1 <> '0'
    set @sql2=@sql2+' and DATA0058.REJECT_PTR in ('+ convert(varchar(20), @Rject1) +')' --报废原因过滤

   if @vindex2=0          
      set @sql2=@sql2+' and Data0050.CUSTOMER_PART_NUMBER LIKE '''+@VPROJ+''''--按本厂编号过滤
   if @vindex2=1         
      set @sql2=@sql2+' and Data0059.CUSTOMER_PART_DESC LIKE '''+@VPROJ+''''--按客户型号过滤
if @vtype=0
     set @sql2=@sql2+' and data0025.parent_ptr=0'
if @vtype=1 
     set @sql2=@sql2+' and data0025.parent_ptr>0'
   set @sql2=@sql2+' and Data0006.work_order_number like '''+@work_order_number+''''--按作业单过滤

  -- set @sql2=@sql2+' and Data0058.reject_ptr<>'+convert(varchar(5),@LotScrap)--过滤盘点报废  

    if @LotScrap=1  -- 如不包括盘点报废，则过滤盘盈和盘亏  20130720 LLL  
    SET @sql2 = @sql2+'  and (Data0058.reject_ptr<>(select custfedship from data0192)) and (Data0058.reject_ptr<>(select CUSTFEDSHIP_loss from data0192)) '  
     

   if @Whse_ptr>0
     set @sql2=@sql2+' and Data0006.whouse_ptr='+convert(varchar(5),@Whse_ptr)--过滤工厂
     --set @sql2=@sql2+' and ((Data0025.parent_ptr=0 and @vtype2=0)OR(Data0025.parent_ptr>0 and @vtype2=1)OR(@vtype2=2))'
  if @so_no <> '%'
    set @sql2=@sql2+' and Data0492.so_no LIKE '''+@so_no+''''
    if @cust1<>''
  set @sql2=@sql2+'and data0010.cust_code like '''+ @cust1+'%'''  --20130525 LLL 加客户 

Set @Sql2=@sql2+' Group by Data0010.Cust_code,Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0050.Layers,Data0025.MANU_PART_NUMBER,
                Data0059.CUSTOMER_PART_DESC,Data0008.PRODUCT_NAME,data0492.SO_NO,data0492.SCH_COMPL_DATE,Data0034.DEPT_NAME,
                Data0039.REJECT_DESCRIPTION,Data0008.Product_Name,t1.ISSUED_QTYpcs,t1.QTY_PLANNED,data0060.parts_ordered,Data0050.mat_tp,
                Data0047.PARAMETER_VALUE,D47C.PARAMETER_VALUE,Data0015.abbr_name,Data0050.eng_tp,(case Data0050.ttype when 0 then Data0008.EST_SCRAP_LTM when 1 then Data0008.EST_SCRAP1_LMT end)'
 if @inde=0
    set @sql2=@sql2+' order by Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0025.MANU_PART_NUMBER,data0492.so_no '
 --按报废数量排序20120618lll


if @inde=1 
begin
  if @tp='U'
     set @sql2=@sql2+' order by SUM((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1))/ IsNull(Data0047.PARAMETER_VALUE,1)),Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0025.MANU_PART_NUMBER,data0492.so_no '
   if @tp='P'
     set @sql2=@sql2+' order by SUM((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1) )* Data0047.PARAMETER_VALUE),Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0025.MANU_PART_NUMBER,data0492.so_no  ' 
end
exec (@sql2)
print (@sql2)

go


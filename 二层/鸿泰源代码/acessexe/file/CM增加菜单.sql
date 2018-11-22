declare @vnum INT,@program VARCHAR(20),@descr VARCHAR(50)
SElect @program='ep799.exe',@descr='材料发IQC'
select @vnum=count(*) from  data0419 where program=@program
if @vnum=0
INSERT INTO data0419([TTYPE], [ANCESTOR_PTR], [PARENT_PTR], [SEQ_NO], [EXE_FLAG], [DESCRIPTION], [BIG5_DESCRPT], 
	[PREV_TP], [PROGRAME], [IMAGE_INDEX], [program], [flag], [ERP_NODE_CODE], 
	[RIGHT_TITLE_01], [RIGHT_TITLE_02], [RIGHT_TITLE_03], [RIGHT_TITLE_04], [RIGHT_TITLE_05], [RIGHT_TITLE_06], 
	[RIGHT_TITLE_07], [RIGHT_TITLE_08], [RIGHT_TITLE_09], [RIGHT_TITLE_10], [RIGHT_TITLE_11], [RIGHT_TITLE_12], 
	[RIGHT_TITLE_13], [RIGHT_TITLE_14], 
	[RIGHT_TITLE_15], [RIGHT_TITLE_16], 
	[RIGHT_01], [RIGHT_02], [RIGHT_03], [RIGHT_04], [RIGHT_05], [RIGHT_06], [RIGHT_07], [RIGHT_08], 
	[RIGHT_09], [RIGHT_10], [RIGHT_11], [RIGHT_12], [RIGHT_13], [RIGHT_14], [RIGHT_15], [RIGHT_16])
SELECT [TTYPE], [ANCESTOR_PTR], [PARENT_PTR],0, [EXE_FLAG], @descr,@descr, 
	[PREV_TP], @program,  [IMAGE_INDEX],@program, [flag], [ERP_NODE_CODE], 
	[RIGHT_TITLE_01], [RIGHT_TITLE_02], [RIGHT_TITLE_03], [RIGHT_TITLE_04], [RIGHT_TITLE_05], [RIGHT_TITLE_06], 
	[RIGHT_TITLE_07], [RIGHT_TITLE_08], [RIGHT_TITLE_09], [RIGHT_TITLE_10], [RIGHT_TITLE_11], [RIGHT_TITLE_12], 
	[RIGHT_TITLE_13], [RIGHT_TITLE_14], [RIGHT_TITLE_15], [RIGHT_TITLE_16], 
	[RIGHT_01], [RIGHT_02], [RIGHT_03], [RIGHT_04], [RIGHT_05], [RIGHT_06], [RIGHT_07], [RIGHT_08], 
	[RIGHT_09], [RIGHT_10], [RIGHT_11], [RIGHT_12], [RIGHT_13], [RIGHT_14], [RIGHT_15], [RIGHT_16] 
 from data0419 where program='ep017.exe'
go

------------------------------------------------------------------------------------------

--增加窗口最底层模块菜单
declare @rf_program VARCHAR(30),--同级参考程序名
        @new_program VARCHAR(30) ,--新执行程序名 
        @new_DESCRIPTION VARCHAR(50),--新菜单名
        @user_name VARCHAR(30) --要授权的登录名
SELECT  @rf_program ='EP013.EXE', 
        @new_program='EP411.EXE',
        @new_DESCRIPTION='IPQC',
 --       @user_name='admin'
 --非标准材料请购单 ep2051.exe      
 --非标准材料请购单审核 ep2057.exe
 --非标准材料请购单处理 ep2054.exe
 --非标准材料采购 ep2056.exe
 --非标准材料采购审核 ep2053.exe
---------------------------------------------------
declare @ncount int,@ocount int,@rf_key int,@new_key int,@max_seq_no INT,@user_ptr VARCHAR(30)
select @ncount=0,@ocount=0,@rf_key=0,@new_key=0,@max_seq_no=0,@user_ptr=0;

select @ncount=count(*) from data0419 where upper(programe)=upper(@new_program)

if @ncount<1--新增不存在
  begin
select @ocount=count(*) from data0419 where upper(programe)=upper(@rf_program)
if @ocount>0--旧的存在
begin  
  select @rf_key=rkey from data0419 where programe=@rf_program
  select @max_seq_no=max(seq_no)+1 from data0419 where parent_ptr in (select parent_ptr from data0419 where rkey=@rf_key)--求顺序号 
  --增加模块菜单
  --

INSERT INTO data0419([TTYPE], [ANCESTOR_PTR], [PARENT_PTR], [SEQ_NO], [EXE_FLAG], [DESCRIPTION], [BIG5_DESCRPT], 
	[PREV_TP], [PROGRAME], [IMAGE_INDEX], [program], [flag], [ERP_NODE_CODE], 
	[RIGHT_TITLE_01], [RIGHT_TITLE_02], [RIGHT_TITLE_03], [RIGHT_TITLE_04], [RIGHT_TITLE_05], [RIGHT_TITLE_06], 
	[RIGHT_TITLE_07], [RIGHT_TITLE_08], [RIGHT_TITLE_09], [RIGHT_TITLE_10], [RIGHT_TITLE_11], [RIGHT_TITLE_12], 
	[RIGHT_TITLE_13], [RIGHT_TITLE_14], 
	[RIGHT_TITLE_15], [RIGHT_TITLE_16], 
	[RIGHT_01], [RIGHT_02], [RIGHT_03], [RIGHT_04], [RIGHT_05], [RIGHT_06], [RIGHT_07], [RIGHT_08], 
	[RIGHT_09], [RIGHT_10], [RIGHT_11], [RIGHT_12], [RIGHT_13], [RIGHT_14], [RIGHT_15], [RIGHT_16])

SELECT [TTYPE], [ANCESTOR_PTR], [PARENT_PTR],@max_seq_no, [EXE_FLAG], @new_DESCRIPTION, @new_DESCRIPTION, 
	[PREV_TP], @new_program, [IMAGE_INDEX], @new_program, [flag], [ERP_NODE_CODE], 
	[RIGHT_TITLE_01], [RIGHT_TITLE_02], [RIGHT_TITLE_03], [RIGHT_TITLE_04], [RIGHT_TITLE_05], [RIGHT_TITLE_06], 
	[RIGHT_TITLE_07], [RIGHT_TITLE_08], [RIGHT_TITLE_09], [RIGHT_TITLE_10], [RIGHT_TITLE_11], [RIGHT_TITLE_12], 
	[RIGHT_TITLE_13], [RIGHT_TITLE_14], 
	[RIGHT_TITLE_15], [RIGHT_TITLE_16], 
	[RIGHT_01], [RIGHT_02], [RIGHT_03], [RIGHT_04], [RIGHT_05], [RIGHT_06], [RIGHT_07], [RIGHT_08], 
	[RIGHT_09], [RIGHT_10], [RIGHT_11], [RIGHT_12], [RIGHT_13], [RIGHT_14], [RIGHT_15], [RIGHT_16]

 from data0419 
where program=@rf_program --或program='ep065.exe'

select top 1 @new_key=rkey from data0419 where programe=@new_program order by rkey desc

  --查找用户指针
 --SELECT @user_ptr=rkey FROM data0073 WHERE USER_LOGIN_NAME=@user_name
 SELECT @new_key


  
  --增加权限,
INSERT INTO data0074(USER_PTR, FUNCTION_ID, USER_RIGHTS, FAVORIATE,
            RIGHT_VALUE_STR)
SELECT  USER_PTR,@new_key ,--FUNCTION_ID新增的data0073表功能菜单指针
USER_RIGHTS, FAVORIATE, RIGHT_VALUE_STR 
from DATA0074 
WHERE user_ptr IN (SELECT rkey FROM data0073 )
--USER_PTR=@user_ptr --用户指针,只把一个用户的权限
AND FUNCTION_ID=@rf_key--data0073表功能菜单指针*/
 select @ocount,@rf_program,@rf_key,@new_key,@max_seq_no --@user_ptr
end

end


----------------------------------------------------------------------------

declare @vnum int
select @vnum=count(*) from  data0419 where program='ep289.exe'
if @vnum=0
INSERT INTO data0419([TTYPE], [ANCESTOR_PTR], [PARENT_PTR], [SEQ_NO], [EXE_FLAG], [DESCRIPTION], [BIG5_DESCRPT], 
	[PREV_TP], [PROGRAME], [IMAGE_INDEX], [program], [flag], [ERP_NODE_CODE], 
	[RIGHT_TITLE_01], [RIGHT_TITLE_02], [RIGHT_TITLE_03], [RIGHT_TITLE_04], [RIGHT_TITLE_05], [RIGHT_TITLE_06], 
	[RIGHT_TITLE_07], [RIGHT_TITLE_08], [RIGHT_TITLE_09], [RIGHT_TITLE_10], [RIGHT_TITLE_11], [RIGHT_TITLE_12], 
	[RIGHT_TITLE_13], [RIGHT_TITLE_14], 
	[RIGHT_TITLE_15], [RIGHT_TITLE_16], 
	[RIGHT_01], [RIGHT_02], [RIGHT_03], [RIGHT_04], [RIGHT_05], [RIGHT_06], [RIGHT_07], [RIGHT_08], 
	[RIGHT_09], [RIGHT_10], [RIGHT_11], [RIGHT_12], [RIGHT_13], [RIGHT_14], [RIGHT_15], [RIGHT_16])

SELECT [TTYPE], [ANCESTOR_PTR], [PARENT_PTR], [SEQ_NO], [EXE_FLAG], '材料项目审核','材料项目审核', 
	[PREV_TP], 'ep289.exe',  [IMAGE_INDEX], 'ep289.exe', [flag], [ERP_NODE_CODE], 
	[RIGHT_TITLE_01], [RIGHT_TITLE_02], [RIGHT_TITLE_03], [RIGHT_TITLE_04], [RIGHT_TITLE_05], [RIGHT_TITLE_06], 
	[RIGHT_TITLE_07], [RIGHT_TITLE_08], [RIGHT_TITLE_09], [RIGHT_TITLE_10], [RIGHT_TITLE_11], [RIGHT_TITLE_12], 
	[RIGHT_TITLE_13], [RIGHT_TITLE_14], [RIGHT_TITLE_15], [RIGHT_TITLE_16], 
	[RIGHT_01], [RIGHT_02], [RIGHT_03], [RIGHT_04], [RIGHT_05], [RIGHT_06], [RIGHT_07], [RIGHT_08], 
	[RIGHT_09], [RIGHT_10], [RIGHT_11], [RIGHT_12], [RIGHT_13], [RIGHT_14], [RIGHT_15], [RIGHT_16] 
 from data0419 where program='ep089.exe'
go

                               
                                     
                                                          
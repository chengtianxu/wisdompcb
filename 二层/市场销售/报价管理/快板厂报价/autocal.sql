

if exists (select * from sysobjects where id = object_id(N'autocal85') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop PROCEDURE autocal85
GO
/*
(条件值)            本列为X变量  y1(col)  y2    y3    y4     y5
本行为Y变量            0        值1      值2   值3    值4    值5
   1(row_index)       x11      值6      值7   值8    值9    值10    
   2                  x12      值11     值12  值13   值14   值15
   3                  x13      值16     值17  值18   值19   值20

如要找值7则要输入的参数为   @vtp,@vptr,y2,x11,0,0
*/
CREATE PROCEDURE autocal85;1  --根据行列的值找出对应的表单中的值
  @vptr int, --表280的指针
  @vcol0 varchar(50), --行列值只存字符 ,对应Y值
  @vrow0 varchar(50), --  对应X值
  @vcol real, --行列值只存数字 --对应Y值
  @vrow real  --对应X值
--with encryption
AS
  begin
	declare @vmcol int  /*声明变量*/
	declare @vmrow int  /*声明变量*/
	--根据参数的类型来确定返回的值,
	--数字返回为:大于等于此值的第一个在表单中的值
	--字符根实行列的值来返回对应的值
        DECLARE @vtpx int,@vtpy int
        set  @vtpx = (SELECT top 1 Data0278.DATA_TYPE 
                        FROM Data0280 LEFT OUTER JOIN
                          Data0278 ON Data0280.FX = Data0278.RKEY where  Data0280.rkey = @vptr)
        set  @vtpy = (SELECT top 1 Data0278.DATA_TYPE 
                       FROM Data0280 LEFT OUTER JOIN
                         Data0278 ON Data0280.FY = Data0278.RKEY where  Data0280.rkey = @vptr)
     
--print @vtpx
--print @vtpy

        if @vtpx = 1 --参数为数字 row_index
	  	set @vmcol=( select min(row_index) as vmcol from data0282
	 	 where eng_table_ptr=@vptr
	 		 and col=1
 	 		 and cast(tvalue as decimal(20,8))>= @vcol)
        else if @vtpx = 2 --参数为字符
 		 set @vmcol=( select min(row_index) as vmcol from data0282
		    where eng_table_ptr=@vptr
 		 	and col = 1  
  			and ''''+ltrim(rtrim(tvalue))+''''= @vcol0 )
        if @vtpy is null 
             set @vmrow=( select min(col) as vmrow from data0282
         		 where eng_table_ptr=@vptr
	         		and row_index = 1
	          		and cast(tvalue as decimal(20,8))>=1)
        else
            begin
                if @vtpy = 1 --参数为数字
	  	        set @vmrow=( select min(col) as vmrow from data0282
         		 where eng_table_ptr=@vptr
	         		and row_index=1 
	          		and cast(tvalue as decimal(20,8))>=@vrow)
                else if @vtpy = 2 --参数为字符
 	        	 set @vmrow=( select min(col) as vmrow from data0282
 		            where eng_table_ptr=@vptr
  	        		and row_index=1 
 		         	and ''''+ltrim(rtrim(tvalue))+''''=@vrow0)
            end

	
	--返回实际的值
	select tvalue from data0282
	  where eng_table_ptr=@vptr
		and col=@vmrow
		and row_index=@vmcol
       --select @vptr,@vmcol,@vmrow

end
go



declare @data0085rkey int
set @data0085rkey = 12
--查找每一个报价单的参数与参数值
SELECT Data0431.*, Data0278.PARAMETER_NAME, 
      Data0278.PARAMETER_DESC, Data0278.DATA_TYPE, 
      Data0002.UNIT_CODE, Data0002.UNIT_NAME
FROM Data0431 INNER JOIN
      Data0278 ON Data0431.UNIT_PTR = Data0278.RKEY INNER JOIN
      Data0002 ON Data0278.UNIT_PTR = Data0002.RKEY
WHERE (Data0431.QTE_PTR = @data0085rkey)
--每一个报价单要用到的物特别工艺
SELECT Data0348.*
FROM Data0348 INNER JOIN
      Data0432 ON Data0348.RKEY = Data0432.SOURCE_PTR
WHERE (Data0432.QTE_PTR = @data0085rkey)

--每一个特别工艺要用到的参数
SELECT Data0348.ADDER_NAME, Data0430.*, Data0002.UNIT_CODE, 
      Data0002.UNIT_NAME
FROM Data0348 INNER JOIN
      Data0430 ON Data0348.RKEY = Data0430.SOURCE_PTR INNER JOIN
      Data0278 ON Data0430.UNIT_PTR = Data0278.RKEY INNER JOIN
      Data0002 ON Data0278.UNIT_PTR = Data0002.RKEY


--选择特别工艺中要用到的全部参数
SELECT DISTINCT Data0278.PARAMETER_NAME, Data0278.DATA_TYPE
FROM Data0430 INNER JOIN
      Data0278 ON Data0430.UNIT_PTR = Data0278.RKEY

--每一个报价单中要用到的参数及值
	SELECT Data0278.PARAMETER_NAME, Data0278.DATA_TYPE, 
	      case Data0431.UNIT_VALUE when null then (case Data0278.DATA_TYPE when 1 then 0
                                                                               when 2 then ''' ''' end)
                               else  (case Data0278.DATA_TYPE when 1 then Data0431.UNIT_VALUE
                                                              when 2 then ''''+Data0431.UNIT_VALUE+'''' end) end
	               as UNITVALUE
	FROM Data0431 INNER JOIN
	      Data0278 ON Data0431.UNIT_PTR = Data0278.RKEY
	WHERE (Data0431.QTE_PTR = @data0085rkey)


--exec sp_addextendedproperty N'MS_Description', N'区位码,邮政编码,区号', N'user', N'dbo', N'table', N'TProvince'
--exec sp_addextendedproperty N'MS_Description', N'邮政编码', N'user', N'dbo', N'table', N'TProvince', N'column', N'ZipCode'
--
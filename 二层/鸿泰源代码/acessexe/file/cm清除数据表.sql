declare @tablelist varchar(100),
   @idflag int
exec sp_MSFOREACHTABLE 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
exec sp_MSFOREACHTABLE 'ALTER TABLE ? DISABLE TRIGGER ALL'
    
declare table_list cursor  for
  select name from sysobjects where type='U'
    and name not in 
  ('data0034','data0506','data0031',--生产资源、制程参数、工具
   'data0504','data0505',--智能流程设计
   'data0193','data0194',--层压图模板
  'data0017',
   'data0019','data0496',--材料类别,材料
   --'data0010','data0059','data0050','data0025',--客户信息
 -- 'data0036',--工程备注信息
  'data0498','data0495','Data0497','data0510','Data0104',--BOM成本设置,0510标准会计科目,Data0104记账凭证默认科目表(基本业务账务设定EP173)
  --'data0038','data0502','data0047','data0029','data0026','data0044','data0046',--部件流程,开料图,部件参数,钻孔表,BOM表,层压信息,
 -- 'data0494',--部件IES参数,
  'data0279',--产品全局参数
  --'data0554','data0564','data0552','data0413',--压板指示图,V-CUT图附件列表
 -- 'data0273',--工程更改
  --'data0032','data0042',--工具管理
  'data0005','data0002','data0073','data0074','data0493',--人员，单位，用户，公司，控制码
  --'data0496','','data0499',--材料类别IES参数和成本核算基本设置
  'data0192','Data0195','Data0419','data0004',--控制开关、公司信息
  'data0277','data0278','Data0338',--ies工程参数类别库、参数、参数值、默认取值表 
  'data0503','data0196','data0197','data0198'--拼版资料
  ,'Data0007','Data0008',--成品类型、类别
  'Data0504','Data0505',--产品类型工艺模型
  'Data0280','Data0282'
--工程表单
)  
  order by name

open table_list
fetch next from table_list into @tablelist
while @@fetch_status=0
  begin
   -- exec('select * into ' +@tablelist+'_100916bk from '+@tablelist)
    exec('delete from '+@tablelist)

  if OBJECTPROPERTY(OBJECT_ID(@tablelist),'TableHasIdentity')=1
      begin
       dbcc checkident (@tablelist, reseed, 0) 
       dbcc checkident (@tablelist, reseed, 0) 
     end

    fetch next from table_list into @tablelist
  end
close table_list  
deallocate table_list

/*
delete from data0074 where user_ptr<>1
delete from data0073 where rkey<>1
delete from data0005 where rkey<>1
*/

exec sp_MSFOREACHTABLE 'ALTER TABLE ? CHECK CONSTRAINT ALL'
exec sp_MSFOREACHTABLE 'ALTER TABLE ? ENABLE TRIGGER ALL'


--dbcc checkident ('data0279', reseed, 0)  
 /*
exec sp_MSFOREACHTABLE 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
exec sp_MSFOREACHTABLE 'ALTER TABLE ? DISABLE TRIGGER ALL'
*/


 /*
exec sp_MSFOREACHTABLE 'ALTER TABLE ? CHECK CONSTRAINT ALL'
exec sp_MSFOREACHTABLE 'ALTER TABLE ? ENABLE TRIGGER ALL'
*/


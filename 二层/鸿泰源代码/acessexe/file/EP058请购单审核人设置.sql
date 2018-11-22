--请购审批主表 data0094
select * from data0094

--Data0275  请购审批人员明细表
declare @p1 int
set @p1=2
exec sp_prepexec @p1 output,N'@P1 int,@P2 int,@P3 float,@P4 float,@P5 int,@P6 int,@P7 int',
N'INSERT INTO Data0275(AUTH_GROUP_PTR,USER_PTR,LOWER_LIMIT,UPPER_LIMIT,Auth_type,ConfirmType,SEQ_No) 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7)
',17,1,0,9999999999,0,1,1
select @p1
--AUTH_GROUP_PTR 指向94主表的指针
--Auth_type 受理前后审批标识 0：受理前；1：受理后；
--ConfirmType 审批类型 1：所有物料；2：标准物料；3：非标准；
--SEQ_No审批先后顺序

select * from data0275
join data0094 on data0275.AUTH_GROUP_PTR=data0094.rkey
where --data0275.user_ptr=1 --用户指针
data0094.RKEY=17 --94表指针


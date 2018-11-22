--触发器发送信息
ALTER TRIGGER [dbo].[DATA0060CMFTOMESSAGE] 
   ON [dbo].[Data0060] 
   FOR UPDATE
AS 
BEGIN
  if @@rowcount=0  return 
  if update(TO_BE_CONFIRMED)
  BEGIN
     declare @id varchar(20),@lastUser INT,@Part int,@cust int,@schdate datetime,@qty int,@STATUS INT,@SO_OLDNEW VARCHAR(30)
     declare @custcode varchar(20),@PARTS varchar(20),@REV varchar(20),@ENG varchar(50),@senddate datetime,@d14 int,@senduser int
     SELECT @lastUser=CSI_USER_PTR,@id=SALES_ORDER,@Part=cust_part_ptr,@cust=customer_ptr,
            @schdate=ORIG_SCHED_SHIP_DATE,@qty=PARTS_ORDERED,@STATUS=TO_BE_CONFIRMED,@SO_OLDNEW=SO_OLDNEW
         FROM inserted
     IF @STATUS=0
     BEGIN
        select @senddate=getdate()
        SELECT @PARTS=CUSTOMER_PART_NUMBER,@REV=CP_REV,@ENG=ENG_TP FROM DATA0050 WHERE RKEY=@Part
        SELECT @custcode=CUST_CODE FROM DATA0010 WHERE RKEY=@cust
        Insert into Data0014(MESSAGE,senddate,whosend,ttype) values
           ('客户:'+@custcode+' 的销售订单:'+@id+' 本产编号:'+@PARTS+' 版本:'+@REV+' 表面工艺:'+@ENG+
            ' 订单交期:'+CONVERT(varchar(10),@schdate,111)+' 订单数量:'+LTRIM(RTRIM(STR(@qty)))+'PCS.'+
            @SO_OLDNEW+',已确认生产通知单，请跟进!',@senddate,@lastUser,0)
        select @d14=rkey from data0014 where senddate=@senddate and whosend=@lastUser
        
       /* DECLARE mycursor cursor     
            for Select user_PTR from Data0074 where SUBSTRING(RIGHT_VALUE_STR,12,1)=1 and function_id=91 
        open mycursor
        fetch next from mycursor into @senduser    
        While @@fetch_status=0
        begin
            insert into data0314(emp_ptr,d14_ptr,hread,deleted) values (@senduser,@d14,'F','N')
            fetch next from mycursor into @senduser
        end
        close mycursor 
        deallocate mycursor*/

ep266子查询返回的值不止一个
---------------------------
ep266
---------------------------
子查询返回的值不止一个。当子查询跟随在 =、!=、<、<=、>、>= 之后，或子查询用作表达式时，这种情况是不允许的。.
---------------------------
确定   
---------------------------
统赢集团ERP问题协助 12:28:30 
select D439_ptr,count(2) from Data0274 where  user_ptr=112 group by d439_ptr having count(2)>1

select  *  from  data0274 where user_ptr=112 and d439_ptr in(6,32,99) 

delete from data0274 where rkey in (29, 74,183)

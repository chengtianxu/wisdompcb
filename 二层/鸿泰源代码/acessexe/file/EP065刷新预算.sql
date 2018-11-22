EP065Ë¢ÐÂÔ¤Ëã
create  procedure [dbo].[Update_budget]  
   @v_year varchar(6)   
as
   begin tran  
     
   set nocount on  

     select sum(TOTAL) as TOTAL,v_year,v_month,budget_ptr into #tempBudg
      from data0068 where v_year=@v_year and STATUS<>5
      group by v_year,v_month,budget_ptr

     update data0362 set USED_PERIOD_1=isnull(b.TOTAL,0)
       FROM data0362 a
       inner join (select* from #tempBudg where v_month=1) b
         on a.rkey=b.budget_ptr and a.bud_year=b.v_year 

     update data0362 set USED_PERIOD_2=isnull(b.TOTAL,0)
       FROM data0362 a
       inner join (select* from #tempBudg where v_month=2) b
         on a.rkey=b.budget_ptr and a.bud_year=b.v_year 

     update data0362 set USED_PERIOD_3=isnull(b.TOTAL,0)
       FROM data0362 a
       inner join (select* from #tempBudg where v_month=3) b
         on a.rkey=b.budget_ptr and a.bud_year=b.v_year 

     update data0362 set USED_PERIOD_4=isnull(b.TOTAL,0)
       FROM data0362 a
       inner join (select* from #tempBudg where v_month=4) b
         on a.rkey=b.budget_ptr and a.bud_year=b.v_year 

     update data0362 set USED_PERIOD_5=isnull(b.TOTAL,0)
       FROM data0362 a
       inner join (select* from #tempBudg where v_month=5) b
         on a.rkey=b.budget_ptr and a.bud_year=b.v_year 

     update data0362 set USED_PERIOD_6=isnull(b.TOTAL,0)
       FROM data0362 a
       inner join (select* from #tempBudg where v_month=6) b
         on a.rkey=b.budget_ptr and a.bud_year=b.v_year 

     update data0362 set USED_PERIOD_7=isnull(b.TOTAL,0)
       FROM data0362 a
       inner join (select* from #tempBudg where v_month=7) b
         on a.rkey=b.budget_ptr and a.bud_year=b.v_year 

     update data0362 set USED_PERIOD_8=isnull(b.TOTAL,0)
       FROM data0362 a
       inner join (select* from #tempBudg where v_month=8) b
         on a.rkey=b.budget_ptr and a.bud_year=b.v_year 

     update data0362 set USED_PERIOD_9=isnull(b.TOTAL,0)
       FROM data0362 a
       inner join (select* from #tempBudg where v_month=9) b
         on a.rkey=b.budget_ptr and a.bud_year=b.v_year 

     update data0362 set USED_PERIOD_10=isnull(b.TOTAL,0)
       FROM data0362 a
       inner join (select* from #tempBudg where v_month=10) b
         on a.rkey=b.budget_ptr and a.bud_year=b.v_year 

     update data0362 set USED_PERIOD_11=isnull(b.TOTAL,0)
       FROM data0362 a
       inner join (select* from #tempBudg where v_month=11) b
         on a.rkey=b.budget_ptr and a.bud_year=b.v_year 

     update data0362 set USED_PERIOD_12=isnull(b.TOTAL,0)
       FROM data0362 a
       inner join (select* from #tempBudg where v_month=12) b
         on a.rkey=b.budget_ptr and a.bud_year=b.v_year
     
    if @@error<>0   
    begin  
        goto ErrHandle  
        RAISERROR ('¸üÐÂÇë¹ºÔ¤ËãÊ§°Ü', 16, 1)  
     end  
  
 Commit tran  
 Return (0)  
    
ErrHandle:  
 Rollback tran  
 return (1)  

go
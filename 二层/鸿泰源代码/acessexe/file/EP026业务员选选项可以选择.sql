  EP026业务员选选项可以选择
  if (ado001.IsEmpty) or(ado002.FieldByName('SALESANALYSIS').AsInteger=0) then
  begin
    radiogroup5.ItemIndex:=0;
    radiogroup5.Enabled:=False;
    btn1.Enabled:=False;
    edt1.Enabled:=False;
  end else
  if ado001.FieldByName('class').AsInteger=0 then
  begin
    edt1.Visible:=True;
    btn1.Visible:=True;
    edt1.Text:=ado001.fieldbyname('rep_code').AsString;
    StaticText1.Caption:=ado001.FieldValues['sales_rep_name'];
    edt1.Enabled:=False;
    radiogroup5.Enabled:=False;
    radiogroup5.ItemIndex:=1;
    btn1.Enabled:=false;
    StaticText1.Visible:=True;
  end ELSE
  	
  	
  ADO001 EP026;4
  
  CREATE PROCEDURE EP026;4
@user_ptr int
as
SELECT data0009.RKEY, REP_CODE, SALES_REP_NAME, ABBR_NAME, SUPERVISOR_PTR, CLASS, 
	data0009.EMPLOYEE_PTR, ADDRESS_LINE_1, ADDRESS_LINE_2, ADDRESS_LINE_3, 
	STATE, ZIP, PHONE, FAX, TELEX, CURRENCY_PTR, NOTE_PAD_PTR, 
	CONTACT_NAME_1, CONTACT_NAME_2, CONTACT_NAME_3, CONTACT_NAME_4, CONTACT_NAME_5, 
	CONTACT_NAME_6, CONT_PHONE_1, CONT_PHONE_2, CONT_PHONE_3, CONT_PHONE_4, 
	CONT_PHONE_5, CONT_PHONE_6, YTD_SALES, LYR_SALES, YTD_BILLING, LYR_BILLING, 
	VOLUME_1, VOLUME_2, VOLUME_3, VOLUME_4, COMMISSION_1, COMMISSION_2, 
	COMMISSION_3, COMMISSION_4, COMMISSION_5, PROJECTION_1, PROJECTION_2, 
	PROJECTION_3, PROJECTION_4, PROJECTION_5, PROJECTION_6, PROJECTION_7, 
	PROJECTION_8, PROJECTION_9, PROJECTION_10, PROJECTION_11, PROJECTION_12, 
	COMMISSION_DUE, DEBITS, TOOLING_FLAG, RUSH_CHRG_COMM_FLAG, SALES_REGION 
FROM Data0009 inner join data0073 on data0009.employee_ptr=data0073.employee_ptr
where data0073.rkey =@user_ptr
go


ADO002 EP026;5

CREATE PROCEDURE EP026;5
as
select SALESANALYSIS from data0192
go

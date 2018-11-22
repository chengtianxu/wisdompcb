 --ep082显示作业单数量不平衡，请向系统管理员报告该一信息
 if Adoquery1.fieldbyname('prod_status').asinteger=3 then
  if ADOQuery2.FieldByName('quan_sch').AsCurrency-ADOQuery2.FieldByName('QUAN_REJ').AsCurrency-ADOQuery2.FieldByName('quan_prod').AsCurrency<>  ADOQuery2.FieldByName('wip_qty').AsCurrency then
  begin
    Messagedlg(adoquery1.fieldbyname('work_order_number').asstring+'作业单数量不平衡，请向系统管理员报告该一信息！',mtinformation,[mbOk],0);
    exit;
  end;

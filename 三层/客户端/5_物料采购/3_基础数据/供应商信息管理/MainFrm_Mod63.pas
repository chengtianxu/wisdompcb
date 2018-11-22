unit MainFrm_Mod63;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, uCommFunc;

type
  TFrmMain_Mod63 = class(TfrmBaseMain)
    cdsMainrkey: TAutoIncField;
    cdsMaincode: TStringField;
    cdsMainsupplier_name: TStringField;
    cdsMainabbr_name: TStringField;
    cdsMainADDRESS2_FOR_FORM: TStringField;
    cdsMainstatus: TStringField;
    cdsMainADDRESS1_FOR_FORM: TStringField;
    cdsMainbrother_flag: TStringField;
    cdsMainttype: TStringField;
    cdsMainVMI: TStringField;
    cdsMainsuppier_ent_date: TDateTimeField;
    cdsMaincontact_name_1: TStringField;
    cdsMaincont_phone_1: TStringField;
    cdsMainphone: TStringField;
    cdsMainfax: TStringField;
    cdsMaintelex: TStringField;
    cdsMaincurr_name: TStringField;
    cdsMaincountry_name: TStringField;
    cdsMainemployee_name: TStringField;
    cdsMainupdate_date: TDateTimeField;
    cdsMainbilling_address_1: TStringField;
    cdsMaintax_id_number: TStringField;
    cdsMaindeveloper: TWideStringField;
    cdsMaininvalid_explain: TWideStringField;
    cdsMainpo_note_pad_ptr: TIntegerField;
    cdsMaindebmem_note_pad_ptr: TIntegerField;
    cdsMainrfq_note_pad_ptr: TIntegerField;
    cdsMaincommon_pad_ptr: TIntegerField;
    cdsMainanalysis_code1: TStringField;
    cdsMainEDI_OUT_NEW_PO: TSmallintField;
    cdsMainEDI_FLAG_FOR_PO: TSmallintField;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure pmZDPopup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    procedure CopyData();
    procedure IfExitAttachment();
    { Private declarations }
  public
    procedure GetData();override;
    procedure OnAfterModPost(Acds : TClientDataSet);
    { Public declarations }
  end;

var
  FrmMain_Mod63: TFrmMain_Mod63;

implementation

{$R *.dfm}

uses DetailFrm_Mod63, ChangRecordFrm_Mod63;

{ TFrmMain_Mod63 }



procedure TFrmMain_Mod63.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;
  FOrderby := ' order by d23.code desc';
  inherited;

end;


procedure TFrmMain_Mod63.IfExitAttachment;
var
  Lsql23 : string;
  LCds23 : TClientDataSet;
begin
  Lsql23 := 'select case when AttachFile IS NULL THEN 0 ELSE 1 END from data0023 where rkey =' + cdsMain.FieldByName('Rkey').AsString;
  LCds23 := TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySql(Lsql23,LCds23) then Exit;
    if (LCds23.fields[0].Value = 0) then
    begin
      FrmDetail_Mod63.Label74.Caption := '未上传附件';
    end
    else
    begin
      FrmDetail_Mod63.Label74.Caption := '已上传附件';
    end;
  finally
    LCds23.Free;
  end;
end;

procedure TFrmMain_Mod63.N1Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,63) then
  begin
    Exit;
  end;
  if FrmDetail_Mod63 = nil then
  begin
    FrmDetail_Mod63 := TFrmDetail_Mod63.Create(Self);
    FrmDetail_Mod63.FAfterUpdate := self.OnAfterModPost;
  end;
  FrmDetail_Mod63.F_status := 0;
  FrmDetail_Mod63.GetData('0');
  FrmDetail_Mod63.GetNew;
  FrmDetail_Mod63.ShowModal;
end;

procedure TFrmMain_Mod63.N2Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(2,63) then    //编辑
  begin
    Exit;
  end;
  if FrmDetail_Mod63 = nil then
  begin
    FrmDetail_Mod63 := TFrmDetail_Mod63.Create(Self);
    FrmDetail_Mod63.FAfterUpdate := self.OnAfterModPost;
  end;
  FrmDetail_Mod63.F_status := 1;
  FrmDetail_Mod63.GetData(cdsMain.FieldByName('rkey').AsString);
  IfExitAttachment;
  FrmDetail_Mod63.GetShow;

  FrmDetail_Mod63.ShowModal;
end;

procedure TFrmMain_Mod63.btnRefreshClick(Sender: TObject);
begin
  inherited;
  GetData;
end;

procedure TFrmMain_Mod63.CopyData;
var  i:word;
     Lsql23,Lsql24,Lsql04,Lsql023,Lsql024 : string;
     Lcds023,Lcds024 : TClientDataSet;
begin
  Lcds023 := TClientDataSet.Create(nil);
  Lcds024 := TClientDataSet.Create(nil);
  try
    Lsql23 := ' select rkey,code,supplier_name,abbr_name,billing_address_1,state ,zip,phone,fax,telex,'+
      ' contact_name_1,contact_name_2,contact_name_3,contact_name_4,contact_name_5,contact_name_6,'+
      ' cont_phone_1,cont_phone_2,cont_phone_3,cont_phone_4,cont_phone_5,cont_phone_6,'+
      ' email_for_contact1,email_for_contact2,email_for_contact3,email_for_contact4,'+
      ' email_for_contact5,email_for_contact6,LANGUAGE_FLAG,EDI_ID,ADDRESS2_FOR_FORM,'+
      ' payment_terms,discount,discount_days,discount2,discount2_days,put_all_inv_hold,'+
      ' tax_id_number,analysis_code1,analysis_code2,analysis_code3,suppier_ent_date,'+
      ' gen_email_address,ttype,brother_flag,update_date,status,ADDRESS1_FOR_FORM,TAX_2,TAX_1,'+
      ' currency_ptr,po_note_pad_ptr,debmem_note_pad_ptr,rfq_note_pad_ptr,common_pad_ptr,'+
      ' country_ptr,acc_payable_ptr,user_ptr,edi_out_new_po,developer,invalid_explain,EDI_FLAG_FOR_PO' +
      ' , Remark, RemarkSpec, IDKey'
      + #13#10 + 'from Data0023 where 1=2';
    Lsql24 := 'select RKEY,SUPPLIER_PTR,FACTORY_LOCATION,FACTORY_ADDRESS_1,STATE,ZIP,CONTACT,'+
              'PHONE,FAX,FOB,CITY_TAX_PTR,SHIPPING_METHOD,SHIPPING_LEAD_TIME,STATE_SHIP_TAX_FLAG,'+
              'STATE_MISC_TAX_FLAG,STATE_INVT_TAX_FLAG,LANGUAGE_FLAG,COUNTRY_PTR,EMAIL_FOR_CONTACT,D23_IDKey '+
              'from data0024 where 1=2' ;
    Lsql04 := ' select * from data0004 where table_name = ''DATA0023''';
    Lsql023 := ' select rkey,code,supplier_name,abbr_name,billing_address_1,state ,zip,phone,fax,telex,'+
      ' contact_name_1,contact_name_2,contact_name_3,contact_name_4,contact_name_5,contact_name_6,'+
      ' cont_phone_1,cont_phone_2,cont_phone_3,cont_phone_4,cont_phone_5,cont_phone_6,'+
      ' email_for_contact1,email_for_contact2,email_for_contact3,email_for_contact4,'+
      ' email_for_contact5,email_for_contact6,LANGUAGE_FLAG,EDI_ID,ADDRESS2_FOR_FORM,'+
      ' payment_terms,discount,discount_days,discount2,discount2_days,put_all_inv_hold,'+
      ' tax_id_number,analysis_code1,analysis_code2,analysis_code3,suppier_ent_date,'+
      ' gen_email_address,ttype,brother_flag,update_date,status,ADDRESS1_FOR_FORM,TAX_2,TAX_1,'+
      ' currency_ptr,po_note_pad_ptr,debmem_note_pad_ptr,rfq_note_pad_ptr,common_pad_ptr,'+
      ' country_ptr,acc_payable_ptr,user_ptr,edi_out_new_po,developer,invalid_explain,EDI_FLAG_FOR_PO'+
      ' , Remark, RemarkSpec , IDKey'
      + #13#10 + 'from Data0023 where rkey=' + cdsMainrkey.AsString;
    Lsql024 := 'select RKEY,SUPPLIER_PTR,FACTORY_LOCATION,FACTORY_ADDRESS_1,STATE,ZIP,CONTACT,'+
          'PHONE,FAX,FOB,CITY_TAX_PTR,SHIPPING_METHOD,SHIPPING_LEAD_TIME,STATE_SHIP_TAX_FLAG,'+
          'STATE_MISC_TAX_FLAG,STATE_INVT_TAX_FLAG,LANGUAGE_FLAG,COUNTRY_PTR,EMAIL_FOR_CONTACT,D23_IDKey '+
          'from data0024 where supplier_ptr=' + cdsMainrkey.AsString;
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql23,Lsql24,Lsql04,Lsql023,Lsql024]),
    [FrmDetail_Mod63.cds23,FrmDetail_Mod63.cds24,FrmDetail_Mod63.cds04,Lcds023,Lcds024]) then Exit;

    FrmDetail_Mod63.cds23.Append;
    for i := 2 to 63 do
      FrmDetail_Mod63.cds23.FieldValues[FrmDetail_Mod63.cds23.Fields[i].FieldName] := Lcds023.FieldValues[Lcds023.Fields[i].FieldName] ;

    while not Lcds024.Eof do
    begin
      FrmDetail_Mod63.cds24.Append;
      for I := 2 to 18 do
        FrmDetail_Mod63.cds24.FieldValues[FrmDetail_Mod63.cds24.Fields[i].FieldName] := Lcds024.FieldValues[Lcds024.Fields[i].FieldName] ;
      Lcds024.Next;
    end;

  finally
    Lcds023.Free;
    Lcds024.Free;
  end;

end;

procedure TFrmMain_Mod63.N3Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(5,63) then      //复制
  begin
    Exit;
  end;
  if FrmDetail_Mod63 = nil then
  begin
    FrmDetail_Mod63 := TFrmDetail_Mod63.Create(Self);
    FrmDetail_Mod63.FAfterUpdate := self.OnAfterModPost;
  end;
  FrmDetail_Mod63.F_status := 2;
//  FrmDetail_Mod63.GetData(cdsMain.FieldByName('rkey').AsString);
//  ShowMessage(cdsMain.FieldByName('rkey').AsString);
//  ShowMessage(cdsMain.FieldByName('po_note_pad_ptr').AsString);
  CopyData;
  FrmDetail_Mod63.GetShow;
  FrmDetail_Mod63.ShowModal;
end;

procedure TFrmMain_Mod63.N4Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(3,63) then      //检查
  begin
    Exit;
  end;
  if FrmDetail_Mod63 = nil then
  begin
    FrmDetail_Mod63 := TFrmDetail_Mod63.Create(Self);
//    FrmDetail_Mod63.FAfterUpdate := self.OnAfterModPost;
  end;
  FrmDetail_Mod63.F_status := 3;
  FrmDetail_Mod63.GetData(cdsMain.FieldByName('rkey').AsString);
  IfExitAttachment;
  FrmDetail_Mod63.StateReadOnly;
  FrmDetail_Mod63.GetShow;
  FrmDetail_Mod63.ShowModal;
end;

procedure TFrmMain_Mod63.N5Click(Sender: TObject);
var
  Lsql23 : string;
  Lcds23 : TClientDataSet;
begin
  inherited;
  if not gFunc.CheckUserAuth(4,63) then      //删除
  begin
    Exit;
  end;
//  LSql11 := 'select * from data0011 where rkey in ('+ cdsMainpo_note_pad_ptr.AsString +','+
//            cdsMaindebmem_note_pad_ptr.AsString + ',' + cdsMainrfq_note_pad_ptr.AsString
//            + ',' + cdsMaincommon_pad_ptr.AsString + ')';
  if MessageDlg('您确定要删除该供应商信息吗?',mtConfirmation,[mbYes, mbNo],0) =mrNo then Exit;
  Lsql23 := 'select * from data0023 where rkey = '+ cdsMainrkey.AsString;
//  LCds11 := TClientDataSet.Create(Self);
  Lcds23 := TClientDataSet.Create(Self);
  try
    gSvrIntf.IntfGetDataBySql(Lsql23,Lcds23);
//    if not LCds11.IsEmpty then
//      LCds11.Delete;
    if not Lcds23.IsEmpty then
      Lcds23.Delete;
//    LPostData := VarArrayCreate([0,1],varVariant);
//
////    if LCds11.ChangeCount > 0 then LPostData[0]:=LCds11.Delta;
//    if Lcds23.ChangeCount > 0 then LPostData[1]:=Lcds23.Delta;

    if gSvrIntf.IntfPostDataByTable('data0023',Lcds23.Delta) then
    begin
//      LCds11.MergeChangeLog;
      LCds23.MergeChangeLog;
      ShowMessage('删除记录成功');
    //btnRefreshClick(Sender);
    end
    else
    begin
      ShowMessage('删除记录不成功');
    end;
  finally
//    LCds11.Free;
    Lcds23.Free;
    btnRefreshClick(Self);
  end;
end;

procedure TFrmMain_Mod63.N6Click(Sender: TObject);
var
  Lsql318 : string;
  Lcds318 : TClientDataSet;
begin
  inherited;
  FrmChangeRecord_Mod63 := TFrmChangeRecord_Mod63.Create(Self);
  Lcds318 := TClientDataSet.Create(Self);
  try
    Caption := cdsMainabbr_name.AsString+':变更记录';
    Lsql318 := 'select user_login_name as USER_ID,USER_FULL_NAME,TRANS_DATE,TRANS_DESCRIPTION, '+
               'FROM_STRING,TO_STRING,file_number '+
               'from data0318 inner join data0073 on data0318.user_ptr=data0073.rkey '+
               'where supplier_ptr='+cdsmainrkey.AsString +' order by TRANS_DATE';
    gSvrIntf.IntfGetDataBySql(Lsql318,Lcds318);
    Lcds318.First;
    while not Lcds318.Eof do
    begin
      FrmChangeRecord_Mod63.Memo1.Lines.Add(Lcds318.fieldbyname('trans_date').AsString+
      '  系统用户:'+Lcds318.fieldbyname('user_id').AsString+'   '+
      Lcds318.fieldbyname('user_full_name').AsString+Lcds318.fieldbyname('TRANS_DESCRIPTION').AsString);

      FrmChangeRecord_Mod63.Memo1.Lines.Add('  原值: '+Lcds318.fieldbyname('from_string').AsString+
      '   变更后: '+Lcds318.fieldbyname('to_string').AsString+
      '   关联文件号:'+Lcds318.fieldbyname('file_number').AsString);
      Lcds318.Next;
    end;
    FrmChangeRecord_Mod63.ShowModal;
  finally
    FrmChangeRecord_Mod63.Free;
    Lcds318.Free;
  end;

end;

procedure TFrmMain_Mod63.OnAfterModPost(Acds: TClientDataSet);
begin
  btnRefreshClick(Self);
end;

procedure TFrmMain_Mod63.pmZDPopup(Sender: TObject);
var
  LArr: TArray<Integer>;
  I: Integer;
begin
  inherited;
  pmZD.Items[17].Enabled := False;
  pmZD.Items[18].Enabled := False;
  LArr := gFunc.GetUserModAuthIDArr(StrToInt(gvar.rkey73),63);
  for I := 0 to Length(LArr) - 1 do
  begin
    if  LArr[I]=6 then
    begin
      pmZD.Items[17].Enabled := True;
      pmZD.Items[18].Enabled := True;
//      pmZD.Items[17].Visible := True;
//      pmZD.Items[18].Visible := True;
      Break;
    end;
  end;
end;

end.

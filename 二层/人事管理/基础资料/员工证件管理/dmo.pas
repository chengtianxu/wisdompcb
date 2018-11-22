unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider,Variants,Dialogs,DBGridEh,StrUtils;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    ADOHrcertificate: TADODataSet;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOHrcertificate_1: TADODataSet;
    ADOHrcertificate_2: TADODataSet;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADOHrcertificate_1rkey: TAutoIncField;
    ADOHrcertificate_1code: TWideStringField;
    ADOHrcertificate_1item: TWideStringField;
    ADOHrcertificate_1type: TIntegerField;
    ADOHrcertificate_1employeecode: TWideStringField;
    ADOHrcertificate_1chinesename: TWideStringField;
    ADOHrcertificate_1ondutytime: TDateTimeField;
    ADOHrcertificate_1departmentname: TWideStringField;
    ADOHrcertificate_1position_item: TWideStringField;
    ADOHrcertificate_1startdate: TDateTimeField;
    ADOHrcertificate_1enddate: TDateTimeField;
    ADOHrcertificate_1inputdate: TDateTimeField;
    ADOHrcertificate_1employee_name: TStringField;
    ADOHrcertificate_1remark: TWideStringField;
    ADOHrcertificate_1status: TStringField;
    ADOHrcertificate_2rkey: TAutoIncField;
    ADOHrcertificate_2code: TWideStringField;
    ADOHrcertificate_2item: TWideStringField;
    ADOHrcertificate_2type: TIntegerField;
    ADOHrcertificate_2employeecode: TWideStringField;
    ADOHrcertificate_2chinesename: TWideStringField;
    ADOHrcertificate_2ondutytime: TDateTimeField;
    ADOHrcertificate_2departmentname: TWideStringField;
    ADOHrcertificate_2position_item: TWideStringField;
    ADOHrcertificate_2startdate: TDateTimeField;
    ADOHrcertificate_2enddate: TDateTimeField;
    ADOHrcertificate_2inputdate: TDateTimeField;
    ADOHrcertificate_2employee_name: TStringField;
    ADOHrcertificate_2remark: TWideStringField;
    ADOHrcertificate_2status: TStringField;
    ADOQuery2: TADOQuery;
    dspHrcertificate: TDataSetProvider;
    cdsHrcertificate: TClientDataSet;
    cdsHrcertificatecode: TWideStringField;
    cdsHrcertificateitem: TWideStringField;
    cdsHrcertificateemployeecode: TWideStringField;
    cdsHrcertificatechinesename: TWideStringField;
    cdsHrcertificateondutytime: TDateTimeField;
    cdsHrcertificatedepartmentname: TWideStringField;
    cdsHrcertificateposition_item: TWideStringField;
    cdsHrcertificatestartdate: TDateTimeField;
    cdsHrcertificateenddate: TDateTimeField;
    cdsHrcertificateinputdate: TDateTimeField;
    cdsHrcertificateemployee_name: TStringField;
    cdsHrcertificateremark: TWideStringField;
    cdsHrcertificatedetarkey: TAutoIncField;
    cdsHrcertificateemplreky: TIntegerField;
    cdsHrcertificatestatus1: TStringField;
    cdsHrcertificatetype: TIntegerField;
    cdsHrcertificatestatus: TIntegerField;
    ADOHrcertificatedetarkey: TAutoIncField;
    ADOHrcertificateitem: TWideStringField;
    ADOHrcertificateemplreky: TIntegerField;
    ADOHrcertificateemployeecode: TWideStringField;
    ADOHrcertificatechinesename: TWideStringField;
    ADOHrcertificateondutytime: TDateTimeField;
    ADOHrcertificatedepartmentname: TWideStringField;
    ADOHrcertificateposition_item: TWideStringField;
    ADOHrcertificateemployee_name: TStringField;
    ADOHrcertificatestatus1: TStringField;
    ADOHrcertificatecode: TWideStringField;
    ADOHrcertificatetype: TIntegerField;
    ADOHrcertificatestartdate: TDateTimeField;
    ADOHrcertificateenddate: TDateTimeField;
    ADOHrcertificateinputdate: TDateTimeField;
    ADOHrcertificateremark: TWideStringField;
    ADOHrcertificatestatus: TIntegerField;
    dt_v_employeemsg: TADODataSet;
    dt_v_employeemsgrkey: TIntegerField;
    dt_v_employeemsgchinesename: TWideStringField;
    dt_v_employeemsgemployeecode: TWideStringField;
    ADOHrcertificateemployeeid: TIntegerField;
    cdsHrcertificateemployeeid: TIntegerField;
    dt_dictid: TADODataSet;
    dt_dictidrkey: TAutoIncField;
    dt_dictiddictid: TIntegerField;
    dt_dictiditem: TWideStringField;
    dt_dictidMemo: TWideStringField;
    ADOHrcertificatedatadetail_ptr: TIntegerField;
    cdsHrcertificatedatadetail_ptr: TIntegerField;
    ADOHrcertificateopration_person: TIntegerField;
    cdsHrcertificateopration_person: TIntegerField;
    dt_v_employeemsgdepartmentname: TWideStringField;
    dt_v_employeemsgondutytime: TDateTimeField;
    dt_v_employeemsgposition_item: TWideStringField;
    dt_v_employeemsgstatus: TStringField;
    dt_0005: TADODataSet;
    dt_0005rkey: TAutoIncField;
    dt_0005employee_name: TStringField;
    ADOHrcertificatestts: TStringField;
    ADOHrcertificatetype1: TStringField;
    cdsHrcertificatestts: TStringField;
    cdsHrcertificatetype1: TStringField;
    cdsHrcertificate1: TClientDataSet;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    cdsHrcertificate1_employeecode: TWideStringField;
    WideStringField4: TWideStringField;
    DateTimeField1: TDateTimeField;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    StringField1: TStringField;
    WideStringField7: TWideStringField;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    procedure ADOHrcertificateAfterOpen(DataSet: TDataSet);
    procedure DataSource1StateChange(Sender: TObject);
    procedure cdsHrcertificatetypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsHrcertificatetypeSetText(Sender: TField;
      const Text: String);
    procedure cdsHrcertificateitemChange(Sender: TField);
    procedure cdsHrcertificateReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsHrcertificatestatusGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsHrcertificatestatusSetText(Sender: TField;
      const Text: String);
    procedure cdsHrcertificateAfterInsert(DataSet: TDataSet);
    procedure cdsHrcertificateAfterScroll(DataSet: TDataSet);
    procedure cdsHrcertificateBeforeClose(DataSet: TDataSet);
    procedure ADOHrcertificatesttsChange(Sender: TField);
    procedure cdsHrcertificatetype1Change(Sender: TField);
    procedure cdsHrcertificatesttsChange(Sender: TField);
    procedure cdsHrcertificate1AfterScroll(DataSet: TDataSet);
    procedure cdsHrcertificate1_employeecodeChange(Sender: TField);
    procedure cdsHrcertificateemployeecodeChange(Sender: TField);
    procedure cdsHrcertificateFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cdsHrcertificateAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses form_Main1,common, Main, form_Main2;

{$R *.dfm}

procedure TDM.ADOHrcertificateAfterOpen(DataSet: TDataSet);
begin
//  (DataSet as TADODataSet).Properties['Unique Table'].Value := 'Hrcertificate';  //没有这句，删除时报错
end;

procedure TDM.DataSource1StateChange(Sender: TObject);
begin
//  if Assigned(frm_Main1) then
//  with frm_Main1 do
//  begin
//    if  (cdsHrcertificate.State in[dsEdit,dsInsert])or(cdsHrcertificate.ChangeCount>0) then
//    begin
//      btInsert.Enabled:=False;
//      btEdit.Enabled:=False;
//      btPost.Enabled:=(StrToInt(vprev)in [2,4]);
//      btCancel.Enabled:=True;
//      btDelete.Enabled:=False;
//      btRefresh.Enabled:=False;
//      btNext.Enabled:=False;
//      btPrior.Enabled:=False;
//    //  BitBtn3.Enabled:=(StrToInt(vprev)in [2,4]);
//    end
//    else
//    begin
//      btInsert.Enabled:=(StrToInt(vprev)in [2,4]);
//      btEdit.Enabled:=(StrToInt(vprev)in [2,4]);
//      btPost.Enabled:=False;
//      btCancel.Enabled:=False;
//      btDelete.Enabled:=(StrToInt(vprev)in [2,4]);
//      btRefresh.Enabled:=True;
//      btNext.Enabled:=True;
//      btPrior.Enabled:=True;
// //     BitBtn3.Enabled:= False;
//    end;
//    BitBtn3.Enabled:=(StrToInt(vprev)in [2,4]);
//  end;


end;

procedure TDM.cdsHrcertificatetypeGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.Value=0 then
    Text:='个人'
  else
  if Sender.Value=1 then
    Text:='公司' ;
end;

procedure TDM.cdsHrcertificatetypeSetText(Sender: TField;
  const Text: String);
begin
  if Text= '个人' then
    Sender.Value:=0
  else
  if Text='公司' then
    Sender.Value:=1 ;
end;

procedure TDM.cdsHrcertificateitemChange(Sender: TField);
begin
  if   dt_dictid.Active=False then
  dt_dictid.Open;
  
  if Sender.IsNull then
  begin
    Sender.DataSet.FieldByName('datadetail_ptr') .Value:=null;
  end
  else
  if dt_dictid.Locate('item',Sender.Value,[]) then
  begin
    Sender.DataSet.FieldByName('datadetail_ptr') .Value:=dt_dictid.FieldByName('rkey') .Value;
  end
  else
  begin
    Sender.DataSet.FieldByName('item') .Value:=null;
    ShowMessage('证书名称不存在！！！');
  end;
end;

procedure TDM.cdsHrcertificateReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage('保存失败，原因是：'+E.Message);
end;

procedure TDM.cdsHrcertificatestatusGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if  Sender.Value=0 then
    Text:='无效'
  else
  if  Sender.Value=1 then
    Text:='有效'  ;
end;

procedure TDM.cdsHrcertificatestatusSetText(Sender: TField;
  const Text: String);
begin
  if Text='无效'   then
    Sender.Value:=0
  else
  if Text='有效'   then
    Sender.Value:=1 ;
end;

procedure TDM.cdsHrcertificateAfterInsert(DataSet: TDataSet);
var
  NowDate:TDateTime;
begin
  DataSet.FieldByName('startdate').Value:=DateToStr(Now);
  DataSet.FieldByName('enddate').Value:=DateToStr(Now+365);
  DataSet.FieldByName('opration_person').Value:= user_ptr;
  DataSet.FieldByName('employee_name').Value:= Frm_Main.str_employee_name ;
  DataSet.FieldByName('inputdate').Value:= getsystem_date(ADOQuery1,0);
  DataSet.FieldByName('stts').Value:='有效';
end;

procedure TDM.cdsHrcertificateAfterScroll(DataSet: TDataSet);
begin
  with cdsHrcertificate do
  Frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(RecNo)+'/总记录数:'+ IntToStr(RecordCount);
end;

procedure TDM.cdsHrcertificateBeforeClose(DataSet: TDataSet);
var
  i:Integer;
begin
 with   (DataSet as TClientDataSet) do
  if  IndexName<>'' then
  begin
    DeleteIndex(IndexName) ;               //清除已存在的索引

    with   Frm_Main   do                            //清除表格中的排序状态
    for i:=0 to  DBGridEh1.Columns.Count-1  do
    begin
      if  DBGridEh1.Columns[i].Title.SortMarker<> smNoneEh   then
      DBGridEh1.Columns[i].Title.SortMarker:= smNoneEh;
    end;
  end
end;

procedure TDM.ADOHrcertificatesttsChange(Sender: TField);
begin
  if Sender.IsNull then
  begin
    Sender.DataSet.FieldByName('status') .Value:=null;
  end
  else
  if Sender.Value='无效' then
  begin
    Sender.DataSet.FieldByName('status') .Value:=0;
  end
  else
  if Sender.Value='有效' then
  begin
    Sender.DataSet.FieldByName('status') .Value:=1;
  end
  else
    Sender.Value:=''   ;
end;

procedure TDM.cdsHrcertificatetype1Change(Sender: TField);
begin
  if Sender.IsNull then
  begin
    Sender.DataSet.FieldByName('type') .Value:=null;
  end
  else
  if Sender.Value='个人' then
  begin
    Sender.DataSet.FieldByName('type') .Value:=0;
  end
  else
  if Sender.Value='公司' then
  begin
    Sender.DataSet.FieldByName('type') .Value:=1;
  end
  else
    begin
    Sender.DataSet.FieldByName('type') .Value:=null;
    Sender.Value:=null;
    end;
end;

procedure TDM.cdsHrcertificatesttsChange(Sender: TField);
begin
  if Sender.IsNull then
  begin
    Sender.DataSet.FieldByName('status') .Value:=null;
  end
  else
  if Sender.Value='无效' then
  begin
    Sender.DataSet.FieldByName('status') .Value:=0;
  end
  else
  if Sender.Value='有效' then
  begin
    Sender.DataSet.FieldByName('status') .Value:=1;
  end
  else
    begin
    Sender.DataSet.FieldByName('status') .Value:=null;
    Sender .Value:=null;
    end;
end;

procedure TDM.cdsHrcertificate1AfterScroll(DataSet: TDataSet);
begin
  with  DataSet do
  Frm_Main2.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(RecNo)+'/总记录数:'+ IntToStr(RecordCount);

  frm_Main2.DataSource1StateChange(frm_Main2.DataSource1);
end;

procedure TDM.cdsHrcertificate1_employeecodeChange(Sender: TField);
begin
  if Sender.IsNull then
  begin
    Sender.DataSet.FieldByName('chinesename') .Value:=null;
    Sender.DataSet.FieldByName('employeeid') .Value:=null;
    Sender.DataSet.FieldByName('departmentname') .Value:=null;
   // Sender.DataSet.FieldByName('employeecode') .Value:=null;
    Sender.DataSet.FieldByName('ondutytime') .Value:=null;
    Sender.DataSet.FieldByName('position_item') .Value:=null;
    Sender.DataSet.FieldByName('status1') .Value:=null;
  end
  else
  if dt_v_employeemsg.Locate('employeecode',Sender.Value,[]) then
  begin
    Sender.DataSet.FieldByName('employeeid') .Value:=dt_v_employeemsg.FieldByName('rkey') .Value;
    Sender.DataSet.FieldByName('departmentname') .Value:=dt_v_employeemsg.FieldByName('departmentname') .Value;
    Sender.DataSet.FieldByName('chinesename') .Value:=dt_v_employeemsg.FieldByName('chinesename') .Value;
    Sender.DataSet.FieldByName('ondutytime') .Value:=dt_v_employeemsg.FieldByName('ondutytime') .Value;
    Sender.DataSet.FieldByName('position_item') .Value:=dt_v_employeemsg.FieldByName('position_item') .Value;
    Sender.DataSet.FieldByName('status1') .Value:=dt_v_employeemsg.FieldByName('status') .Value;
  end
  else
  begin
    Sender.DataSet.FieldByName('employeeid') .Value:=null;
    Sender.DataSet.FieldByName('departmentname') .Value:=null;
    Sender.DataSet.FieldByName('chinesename') .Value:=null;
    Sender.DataSet.FieldByName('ondutytime') .Value:=null;
    Sender.DataSet.FieldByName('position_item') .Value:=null;
    Sender.DataSet.FieldByName('status1') .Value:=null;
    ShowMessage('用户工号不存在！！！');
  end;
end;

procedure TDM.cdsHrcertificateemployeecodeChange(Sender: TField);
begin
  if Sender.IsNull then
  begin
    Sender.DataSet.FieldByName('employeeid') .Value:=null;
    Sender.DataSet.FieldByName('departmentname') .Value:=null;
    Sender.DataSet.FieldByName('chinesename') .Value:=null;
    Sender.DataSet.FieldByName('ondutytime') .Value:=null;
    Sender.DataSet.FieldByName('position_item') .Value:=null;
    Sender.DataSet.FieldByName('status1') .Value:=null;


  end
  else
  if dt_v_employeemsg.Locate('employeecode',Sender.Value,[]) then
  begin
    Sender.DataSet.FieldByName('employeeid') .Value:=dt_v_employeemsg.FieldByName('rkey') .Value;
    Sender.DataSet.FieldByName('departmentname') .Value:=dt_v_employeemsg.FieldByName('departmentname') .Value;
    Sender.DataSet.FieldByName('chinesename') .Value:=dt_v_employeemsg.FieldByName('chinesename') .Value;
    Sender.DataSet.FieldByName('ondutytime') .Value:=dt_v_employeemsg.FieldByName('ondutytime') .Value;
    Sender.DataSet.FieldByName('position_item') .Value:=dt_v_employeemsg.FieldByName('position_item') .Value;
    Sender.DataSet.FieldByName('status1') .Value:=dt_v_employeemsg.FieldByName('status') .Value;
  end
  else
  begin
    Sender.DataSet.FieldByName('employeeid') .Value:=null;
    Sender.DataSet.FieldByName('departmentname') .Value:=null;
    Sender.DataSet.FieldByName('chinesename') .Value:=null;
    Sender.DataSet.FieldByName('ondutytime') .Value:=null;
    Sender.DataSet.FieldByName('position_item') .Value:=null;
    Sender.DataSet.FieldByName('status1') .Value:=null;
    ShowMessage('用户名不存在！！！');
    frm_Main1.edt_employeecode.SetFocus;
  end;
end;

procedure TDM.cdsHrcertificateFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Trim(Frm_Main.Edit1.Text) <>'' then
  Accept:=(AnsiContainsText(DataSet.FieldByName(Frm_Main.preColumn.FieldName).AsString,Frm_Main.Edit1.Text )) ;
end;

procedure TDM.cdsHrcertificateAfterOpen(DataSet: TDataSet);
begin
  Frm_Main.Label3.Caption:=IntToStr(cdsHrcertificate.RecordCount);
end;

end.

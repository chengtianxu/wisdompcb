unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Variants,Dialogs, DBClient, Provider,DBGridEh,StrUtils,DateUtils;

type
  TDM = class(TDataModule)
    ADOConnection: TADOConnection;
    ADS567_Delete: TADODataSet;
    DataSource1: TDataSource;
    ADS567_DeleteDEPT_CODE: TStringField;
    ADS567_DeleteDEPT_NAME: TStringField;
    ADS567_DeleteFASSET_CODE: TStringField;
    ADS567_DeleteFASSET_NAME: TStringField;
    ADS567_DeleteFASSET_DESC: TStringField;
    ADS567_DeleteEMPL_CODE: TStringField;
    ADS567_DeleteEMPLOYEE_NAME: TStringField;
    ADS567_DeleteRKEY: TAutoIncField;
    ADS567_DeleteNUMBER: TStringField;
    ADS567_DeleteSTATUS: TWordField;
    ADS567_DeleteDEPT_PTR: TIntegerField;
    ADS567_DeleteFASSET_PTR: TIntegerField;
    ADS567_DeletePLACE: TStringField;
    ADS567_Deleteequipment_grade: TStringField;
    ADS567_Deletefailure_grade: TStringField;
    ADS567_Deletefailure_degree: TStringField;
    ADS567_Deletefailure_date: TDateTimeField;
    ADS567_DeleteEMPL_PTR: TIntegerField;
    ADS567_Deleteent_date: TDateTimeField;
    ADS567_Deletereferring_date: TDateTimeField;
    ADS567_DeleteCONTACT_NAME: TStringField;
    ADS567_DeleteCONTACT_PHONE: TStringField;
    ADS567_Deletedisposal_emplptr: TIntegerField;
    ADS567_Deletedisposal_date: TDateTimeField;
    ADS567_Deletemaintain_empl: TStringField;
    ADS567_Deletecomplete_date: TDateTimeField;
    ADS567_Deletevalidate_emplptr: TIntegerField;
    ADS567_Deletevalidate_date: TDateTimeField;
    ADS567_Deletevalidate_appraise: TStringField;
    ADS567_DeleteV_stat: TStringField;
    ADOQuery1: TADOQuery;
    AQ568: TADOQuery;
    DataSource2: TDataSource;
    AQ568rkey: TAutoIncField;
    AQ568failure_ptr: TIntegerField;
    AQ568part_name: TStringField;
    AQ568part_desc: TStringField;
    AQ568quantity: TBCDField;
    AQ568supplier_name: TStringField;
    AQ568amout: TBCDField;
    AQ568remart: TStringField;
    ADS567_Deletedisposal_emplcode: TStringField;
    ADS567_Deletedisposal_emplname: TStringField;
    ADS567_Deletefail_type: TStringField;
    ADS567_Deletefailure_circs: TStringField;
    ADS567_Deletemaintain_text: TStringField;
    ADS567_DeleteWHOUSE_PTR: TIntegerField;
    ADS567_Deletewarehouse_code: TStringField;
    ADS567_Deleteabbr_name: TStringField;
    ADS567_Deletesuspended_reason: TWideStringField;
    ADS567_Deletestoppage_time: TDateTimeField;
    ADS567_Deleterecovery_time: TDateTimeField;
    ADS567_Deletecompletion_emplcode: TStringField;
    ADS567_Deletecompletion_emplname: TStringField;
    ADS567_Deletecompletion_emplptr: TIntegerField;
    ADS567_Deletestop_house: TBCDField;
    ADS567_Deletemaintain_house: TBCDField;
    qry0577_1: TADOQuery;
    qry0577_1Rkey: TAutoIncField;
    qry0577_1rkey567: TIntegerField;
    qry0577_1stop_begin_date: TDateTimeField;
    qry0577_1stop_end_date: TDateTimeField;
    qry0577_1remark: TWideStringField;
    cmdUpdate1: TADOCommand;
    qry_841: TADOQuery;
    qry_841USER_FULL_NAME: TStringField;
    qry_841Status: TStringField;
    qry_841Record_date: TDateTimeField;
    qry_841remark: TWideStringField;
    qry_841_1: TADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    WideStringField1: TWideStringField;
    ADS567_Deletevalidate_Description: TStringField;
    ADS567_Deletetslr: TStringField;
    ADS567_Deletethlr: TStringField;
    ADS567_DeleteD073_ptr: TIntegerField;
    AQ842: TADOQuery;
    DS842: TDataSource;
    dsp842: TDataSetProvider;
    cds842: TClientDataSet;
    cds842Work_ptr: TIntegerField;
    cds842WorkDate: TDateTimeField;
    cds842BeginTime: TDateTimeField;
    cds842EndTime: TDateTimeField;
    cds842TimeCons: TBCDField;
    cds842TimeRest: TBCDField;
    cds842Empl_ptr: TIntegerField;
    cds842Status: TIntegerField;
    cds842WorkTime: TBCDField;
    cds842Remark: TStringField;
    cds842EMPLOYEE_NAME: TStringField;
    cds842MainexecStat: TStringField;
    AQ842rkey: TAutoIncField;
    AQ842Work_ptr: TIntegerField;
    AQ842WorkDate: TDateTimeField;
    AQ842BeginTime: TDateTimeField;
    AQ842EndTime: TDateTimeField;
    AQ842TimeCons: TBCDField;
    AQ842TimeRest: TBCDField;
    AQ842Empl_ptr: TIntegerField;
    AQ842Status: TIntegerField;
    AQ842WorkTime: TBCDField;
    AQ842Remark: TStringField;
    AQ842EMPLOYEE_NAME: TStringField;
    AQ842MainexecStat: TStringField;
    AQ005: TADOQuery;
    AQ005RKEY: TAutoIncField;
    AQ005EMPL_CODE: TStringField;
    AQ005EMPLOYEE_NAME: TStringField;
    AQ842EMPL_CODE: TStringField;
    cds842EMPL_CODE: TStringField;
    cds0005: TClientDataSet;
    dsp0005: TDataSetProvider;
    cds0005RKEY: TAutoIncField;
    cds0005EMPL_CODE: TStringField;
    cds0005EMPLOYEE_NAME: TStringField;
    AQ832: TADOQuery;
    dsp832: TDataSetProvider;
    cds832: TClientDataSet;
    cds832RKEY: TIntegerField;
    cds832MainExecStat: TStringField;
    AQ832RKEY: TIntegerField;
    AQ832MainExecStat: TStringField;
    cds842rkey: TAutoIncField;
    qry0843: TADOQuery;
    qry0843Rkey: TAutoIncField;
    qry0843Work_ptr: TIntegerField;
    qry0843stop_begin_date: TDateTimeField;
    qry0843stop_end_date: TDateTimeField;
    qry0843remark: TWideStringField;
    QryResultTime: TADOQuery;
    ADOQuery2: TADOQuery;
    AQ0034: TADOQuery;
    AQ0015: TADOQuery;
    AQ0015WAREHOUSE_CODE: TStringField;
    AQ0015ABBR_NAME: TStringField;
    AQ0034DEPT_CODE: TStringField;
    AQ0034DEPT_NAME: TStringField;
    ad567Copy: TADOQuery;
    dt0417: TADODataSet;
    dt0417FASSET_CODE: TStringField;
    dt0417FASSET_NAME: TStringField;
    ADS567_DeleteD846_ptr: TIntegerField;
    ADS567_DeleteStaff_Sum_house: TBCDField;
    ADS567_DeleteFaultName: TStringField;
    ADS567_DeletestdDate: TBCDField;
    qry_D0846: TADOQuery;
    qry_D0846rkey: TAutoIncField;
    qry_D0846FaultName: TStringField;
    qry_D0846stdDate: TBCDField;
    qry_D0846All: TADOQuery;
    AutoIncField1: TAutoIncField;
    StringField3: TStringField;
    qry_D0846AllstdDate: TBCDField;
    ADS567_DeleteAchiRate: TFloatField;
    cdsTemp: TClientDataSet;
    cds567: TClientDataSet;
    dsp567: TDataSetProvider;
    dt567: TADODataSet;
    cds567FaultName: TStringField;
    cds567stdDate: TBCDField;
    cds567DEPT_CODE: TStringField;
    cds567DEPT_NAME: TStringField;
    cds567FASSET_CODE: TStringField;
    cds567FASSET_NAME: TStringField;
    cds567FASSET_DESC: TStringField;
    cds567EMPL_CODE: TStringField;
    cds567EMPLOYEE_NAME: TStringField;
    cds567warehouse_code: TStringField;
    cds567abbr_name: TStringField;
    cds567V_stat: TStringField;
    cds567disposal_emplcode: TStringField;
    cds567disposal_emplname: TStringField;
    cds567completion_emplcode: TStringField;
    cds567completion_emplname: TStringField;
    cds567tslr: TStringField;
    cds567thlr: TStringField;
    cds567RKEY: TAutoIncField;
    cds567NUMBER: TStringField;
    cds567STATUS: TSmallintField;
    cds567DEPT_PTR: TIntegerField;
    cds567FASSET_PTR: TIntegerField;
    cds567PLACE: TStringField;
    cds567equipment_grade: TStringField;
    cds567failure_grade: TStringField;
    cds567failure_degree: TStringField;
    cds567failure_date: TDateTimeField;
    cds567EMPL_PTR: TIntegerField;
    cds567ent_date: TDateTimeField;
    cds567referring_date: TDateTimeField;
    cds567CONTACT_NAME: TStringField;
    cds567CONTACT_PHONE: TStringField;
    cds567failure_circs: TStringField;
    cds567disposal_emplptr: TIntegerField;
    cds567disposal_date: TDateTimeField;
    cds567maintain_empl: TStringField;
    cds567maintain_text: TStringField;
    cds567complete_date: TDateTimeField;
    cds567validate_emplptr: TIntegerField;
    cds567validate_date: TDateTimeField;
    cds567validate_appraise: TStringField;
    cds567fail_type: TStringField;
    cds567WHOUSE_PTR: TIntegerField;
    cds567suspended_reason: TWideStringField;
    cds567stoppage_time: TDateTimeField;
    cds567recovery_time: TDateTimeField;
    cds567completion_emplptr: TIntegerField;
    cds567stop_house: TBCDField;
    cds567maintain_house: TBCDField;
    cds567validate_Description: TStringField;
    cds567D846_ptr: TIntegerField;
    cds567Staff_Sum_house: TBCDField;
    cds567AchiRate: TBCDField;
    dt567FaultName: TStringField;
    dt567stdDate: TBCDField;
    dt567DEPT_CODE: TStringField;
    dt567DEPT_NAME: TStringField;
    dt567FASSET_CODE: TStringField;
    dt567FASSET_NAME: TStringField;
    dt567FASSET_DESC: TStringField;
    dt567EMPL_CODE: TStringField;
    dt567EMPLOYEE_NAME: TStringField;
    dt567warehouse_code: TStringField;
    dt567abbr_name: TStringField;
    dt567V_stat: TStringField;
    dt567disposal_emplcode: TStringField;
    dt567disposal_emplname: TStringField;
    dt567completion_emplcode: TStringField;
    dt567completion_emplname: TStringField;
    dt567tslr: TStringField;
    dt567thlr: TStringField;
    dt567RKEY: TAutoIncField;
    dt567NUMBER: TStringField;
    dt567STATUS: TWordField;
    dt567DEPT_PTR: TIntegerField;
    dt567FASSET_PTR: TIntegerField;
    dt567PLACE: TStringField;
    dt567equipment_grade: TStringField;
    dt567failure_grade: TStringField;
    dt567failure_degree: TStringField;
    dt567failure_date: TDateTimeField;
    dt567EMPL_PTR: TIntegerField;
    dt567ent_date: TDateTimeField;
    dt567referring_date: TDateTimeField;
    dt567CONTACT_NAME: TStringField;
    dt567CONTACT_PHONE: TStringField;
    dt567failure_circs: TStringField;
    dt567disposal_emplptr: TIntegerField;
    dt567disposal_date: TDateTimeField;
    dt567maintain_empl: TStringField;
    dt567maintain_text: TStringField;
    dt567complete_date: TDateTimeField;
    dt567validate_emplptr: TIntegerField;
    dt567validate_date: TDateTimeField;
    dt567validate_appraise: TStringField;
    dt567fail_type: TStringField;
    dt567WHOUSE_PTR: TIntegerField;
    dt567suspended_reason: TWideStringField;
    dt567stoppage_time: TDateTimeField;
    dt567recovery_time: TDateTimeField;
    dt567completion_emplptr: TIntegerField;
    dt567stop_house: TBCDField;
    dt567maintain_house: TBCDField;
    dt567validate_Description: TStringField;
    dt567D846_ptr: TIntegerField;
    dt567Staff_Sum_house: TBCDField;
    qry_data0468: TADOQuery;
    qry_data0468number: TStringField;
    qry_data0468INV_PART_NUMBER: TStringField;
    qry_data0468INV_PART_DESCRIPTION: TStringField;
    qry_data0468unit_name: TStringField;
    qry_data0468QUAN_BOM: TFloatField;
    qry_data0468QUAN_ISSUED: TFloatField;
    dt567validate_emplname: TStringField;
    cds567validate_emplname: TStringField;
    qry0073: TADOQuery;
    qry0073USER_LOGIN_NAME: TStringField;
    qry0073EMPLOYEE_PTR: TIntegerField;
    dt567Location: TStringField;
    dt567D840_ptr: TIntegerField;
    cds567Location: TStringField;
    cds567D840_ptr: TIntegerField;
    QryD840: TADOQuery;
    QryD840rkey: TAutoIncField;
    QryD840Location: TStringField;
    dt567D417_Location: TStringField;
    dt567D417_D840_ptr: TIntegerField;
    cds567D417_Location: TStringField;
    cds567D417_D840_ptr: TIntegerField;
    qry0843ResultTime: TADOQuery;
    adsTemp: TADODataSet;
    dspTemp: TDataSetProvider;
    qry577: TADOQuery;
    qry577Rkey: TAutoIncField;
    qry577rkey567: TIntegerField;
    qry577stop_begin_date: TDateTimeField;
    qry577stop_end_date: TDateTimeField;
    qry577remark: TWideStringField;
    dt567D073_ptr: TIntegerField;
    dt567EquiType: TBooleanField;
    cds567D073_ptr: TIntegerField;
    cds567EquiType: TBooleanField;
    cds0849: TClientDataSet;
    cds0849D419_ptr: TIntegerField;
    cds0849D073_ptr: TIntegerField;
    cds0849FormName: TStringField;
    cds0849GridName: TStringField;
    cds0849FieldName: TStringField;
    cds0849FieldCaption: TStringField;
    cds0849FieldOrder: TIntegerField;
    cds0849FieldWidth: TIntegerField;
    cds0849IsDisplay: TBooleanField;
    dsp0849: TDataSetProvider;
    dt0849: TADODataSet;
    dt0849D419_ptr: TIntegerField;
    dt0849D073_ptr: TIntegerField;
    dt0849GridName: TStringField;
    dt0849FieldName: TStringField;
    dt0849FieldCaption: TStringField;
    dt0849FieldOrder: TIntegerField;
    dt0849FieldWidth: TIntegerField;
    dt0849IsDisplay: TBooleanField;
    dt0849FormName: TStringField;
    AQ842DayShift: TWordField;
    cds842DayShift: TSmallintField;
    cds567GZSJ: TBCDField;
    procedure ADS567_DeleteBeforeClose(DataSet: TDataSet);
    procedure ADS567_Deletecomplete_dateChange(Sender: TField);
    procedure ADS567_Deletestop_houseChange(Sender: TField);
    procedure ADS567_DeleteAfterScroll(DataSet: TDataSet);
    procedure qry0577_1AfterInsert(DataSet: TDataSet);
    procedure qry0577_1AfterPost(DataSet: TDataSet);
    procedure qry0577_1BeforeDelete(DataSet: TDataSet);
    procedure qry0577_1BeforeInsert(DataSet: TDataSet);
    procedure qry0577_1BeforePost(DataSet: TDataSet);
    procedure cds842BeforeScroll(DataSet: TDataSet);
    procedure cds842ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds842AfterInsert(DataSet: TDataSet);
    procedure cds842AfterPost(DataSet: TDataSet);
    procedure cds842EMPL_CODEChange(Sender: TField);
    procedure cds842EMPLOYEE_NAMEChange(Sender: TField);
    procedure cds842StatusChange(Sender: TField);
    procedure cds842BeforePost(DataSet: TDataSet);
    procedure cds842EndTimeChange(Sender: TField);
    procedure cds842TimeRestChange(Sender: TField);
    procedure DataSource1StateChange(Sender: TObject);
    procedure cds842AfterScroll(DataSet: TDataSet);
    procedure qry0843BeforePost(DataSet: TDataSet);
    procedure qry0843AfterPost(DataSet: TDataSet);
    procedure qry0843AfterInsert(DataSet: TDataSet);
    procedure dsp842AfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure ADS567_DeleteAfterClose(DataSet: TDataSet);
    procedure ADS567_DeleteCalcFields(DataSet: TDataSet);
    procedure ADS567_DeleteAchiRateGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cds842BeforeCancel(DataSet: TDataSet);
    procedure cds842AfterCancel(DataSet: TDataSet);
    procedure cds567CalcFields(DataSet: TDataSet);
    procedure cds567complete_dateChange(Sender: TField);
    procedure cds567AfterClose(DataSet: TDataSet);
    procedure cds567AfterOpen(DataSet: TDataSet);
    procedure cds567AfterScroll(DataSet: TDataSet);
    procedure cds567BeforeClose(DataSet: TDataSet);
    procedure cds567stop_houseChange(Sender: TField);
    procedure cds567AchiRateGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dsp567GetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cds567STATUSChange(Sender: TField);
    procedure cds567ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds567FaultNameChange(Sender: TField);
    procedure cds567FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cds567LocationChange(Sender: TField);
    procedure cds567BeforePost(DataSet: TDataSet);
    procedure qry577AfterInsert(DataSet: TDataSet);
    procedure qry577AfterPost(DataSet: TDataSet);
    procedure qry577BeforePost(DataSet: TDataSet);
    procedure qry577BeforeScroll(DataSet: TDataSet);
    procedure cds842BeginTimeChange(Sender: TField);
  private
//    Beingprocessed:Boolean;
    StateIsCancel :Boolean;
    procedure MsgError(msg:string);
    
    { Private declarations }
  public
    v567Rkey :Integer;

    Function  SQLResultValue(FDataSet:TADOQuery;strSQL:string):string;
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main,  formPause,common; // , formSelect  , formPause1

{$R *.dfm}



Function  TDM.SQLResultValue(FDataSet:TADOQuery;strSQL:string):string;
begin
  with  FDataSet do
  begin
    Result:='';
    Close;
    SQL.Clear;
    SQL.Text:=strSQL;
    Open;
    if  FieldList[0].IsNull  then
      Result:=''
    else
    Result:=FieldList[0].Value;
    Close;
  end;
end;

procedure TDM.MsgError(msg:string);
begin
  messagedlg(msg,mterror,[mbok],0);
end;

procedure TDM.ADS567_DeleteBeforeClose(DataSet: TDataSet);
begin
  v567Rkey:=cDS567RKEY.Value;
end;

procedure TDM.ADS567_Deletecomplete_dateChange(Sender: TField);
var
  strSQL:string;
begin
  with CDS567 do
  if(FieldByName('complete_date').IsNull=False) then     //如果完工时间不是空，
  begin                                                  //完工时间-受理日期-暂停时间
    strSQL:= 'select  cast(DATEDIFF(Minute, disposal_date,'
               +QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',FieldByName('complete_date').AsDateTime))
               +')as dec(10,2))/60-isnull(stop_house,0) '
       +' from data0567 where rkey='+CDS567.FieldByName('rkey').AsString ;
//    if (State in [dsInsert,dsEdit]) then
//      Post;
//    Edit;
//    ShowMessage( strSQL);
//    ShowMessage((Form1.SQLResultValue(dm.ADOQuery1,strSQL)));
    cDS567maintain_house.AsString :=Form1.SQLResultValue(ADOQuery1,strSQL);     //维修使用小时=完工时间-受理日期-暂停时间
//    if  (ADS567.State in [dsInsert,dsEdit]) then
//    ADS567.Post;
  end
  else
  begin
    fieldbyName('maintain_house').value:=null;
  end;

end;

procedure TDM.ADS567_Deletestop_houseChange(Sender: TField);
begin
  cDS567complete_dateChange(nil);
end;

procedure TDM.ADS567_DeleteAfterScroll(DataSet: TDataSet);
begin
  if frmPause.Showing then
  begin
    with  qry577 do
    begin
      Close;
      Parameters.ParamByName('vRkey567').Value:=cDS567RKEY.Value;
      Open;
     // ShowMessage('qry0577 Open');
    end;
  end;
  with cds842 do
  begin
    Close;
    Params.ParamByName('vWork_ptr').Value:=cDS567RKEY.Value;
    Open;
  end;
  Form1.SetStatus;
end;

procedure TDM.qry0577_1AfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('rkey567').Value:=DM.cDS567RKEY.Value;
  end;
end;

procedure TDM.qry0577_1AfterPost(DataSet: TDataSet);
var
  strSQL:string;
  isPause:Boolean;
  NowDate:TDateTime;
begin
  with dm.ADOConnection  do
  try
//    isPause:=False;
//    with  DM.ADOQuery1 do
//    begin
//      Clone(qry0577);
//      while not Eof do
//      begin
//        if fieldByName('stop_end_date').isnull then
//        begin
//          isPause:=True;
//          Break;
//        end;
//        Next;
//      end;
//    end;
//
//    with  DM  do
//    begin
//      cDS567.Edit;
//      NowDate:=getsystem_date(dm.adoquery1,0);
//      
//      if isPause=True then
//      begin
//        cDS567STATUS.AsInteger:=6 ;               //修改状态为已暂停
////        with  cds842   do         //将雇员记录中的暂停功能取消
////        begin
////          try
////            cds842.DisableControls ;
////            First;
////            while not Eof do
////            begin
////              if cds842Status.AsInteger=3 then
////              begin
////                if DM.cds842rkey.IsNull then
////                DM.cds842.Refresh;
////
////                with ADOQuery1 do
////                begin
////                  Close;
////                  SQL.Clear;                                                      //FormatDateTime('yyyy-m-d h:n:s',NowDate)
////                  SQL.Text:='insert into DATA0843([Work_ptr],[stop_begin_date],[remark]) '
////                  +' values('+cds842.FieldByName('rkey').AsString+','+QuotedStr(FormatDateTime('yyyy-m-d h:n:s',NowDate))+','+QuotedStr(qry0577remark.AsString)+')';
////
////                  ExecSQL;
////                end;
////
////                with DM.cds842 do
////                begin
////                  Edit;
////                  FieldByName('Status').Value:=6;     //将状态改为“已暂停 ”     6	已暂停
////                  Post;
////                  if  DM.cds842.ApplyUpdates(0)<> 0 then
////                  RollbackTrans;
////                end;
////
////              end;
////              Next;
////            end;
////          finally
////            cds842.EnableControls;
////          end;
////        end;
//      end
//      else
//      begin
//        cDS567STATUS.AsInteger:=2;           //修改状态为执行中
//        with cds842 do                       //添加一行新的雇员工作记录
//        if Active then
//        begin
//          Append;
//          if cds0005.Active=False then
//            cds0005.Open;
//          if cds0005.Locate('rkey',frmPause.vEmplRkey,[])   then
//          begin
//            FieldByName('EMPL_CODE').Value:=cds0005EMPL_CODE.Value;
//            FieldByName('EMPLOYEE_NAME').Value:=cds0005EMPLOYEE_NAME.Value;
//            Post;
//            ApplyUpdates(0);
//          end;
//        end;
////        with  cds842   do    //将雇员记录中的暂停功能取消
////        begin
////          try
////            cds842.DisableControls ;
////            First;
////            while not Eof do
////            begin
////              if cds842Status.AsInteger=6 then
////              begin
////                if DM.cds842rkey.IsNull then
////                DM.cds842.Refresh;
////
////                if Form1.b_Processing then   //只有用户在点击需要同步处理维修人员的暂停记录时，才执行下列代码。
////                begin
////                  with DM.ADOQuery1 do
////                  begin
////                    Close;
////                    SQL.Clear;
////                    SQL.Text:='update DATA0843 set [stop_end_date]= '+QuotedStr(FormatDateTime('yyyy-m-d h:n:s',NowDate))
////                    +' where Work_ptr=' +dm.cds842.FieldByName('rkey').AsString
////                    +' and [stop_end_date] is null ';
////                   // ShowMessage(SQL.Text);
////                    ExecSQL;
////                  end;
////
////                  with DM.ADOQuery1 do
////                  begin
////                    Close;
////                    SQL.Clear;
////                    SQL.Text:='select isnull(cast(sum(datediff(minute,[stop_begin_date],[stop_end_date]))as dec(10,2))/60,0)'
////                    +' from DATA0843 where Work_ptr=' +dm.cds842.FieldByName('rkey').AsString;
////                    Open;
////                  end;
////
////                  with DM.cds842 do
////                  begin
////                    Edit;
////                    FieldByName('Status').Value:=3;     //将状态改为“执行中 ”     3	执行中
////                    FieldByName('TimeCons').Value := DM.ADOQuery1.Fields[0].Value;  //暂停时间
////                    Post;
////                    if  DM.cds842.ApplyUpdates(0)<> 0 then
////                    RollbackTrans;
////                  end;
////                end;
////              end;
////              Next;
////            end;
////          finally
////            cds842.EnableControls;
////            Form1.b_Processing:=False;//复位。
////          end;
////        end;
//      end;
//      cDS567.Post;
//      if cDS567.ApplyUpdates(0)<>0 then
//      RollbackTrans;
//
//      with  DM.cmdUpdate1 do            //在DATA0841表添加一行改变状态的记录。
//      begin
//        CommandText:='insert into [dbo].[DATA0841]([D567_ptr],[User_ptr],[Status_ptr],[Record_date])'
//              +'values('+DM.cDS567RKEY.AsString+','+rkey73+','+dm.cDS567STATUS.AsString+','
//              +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',dm.cDS567disposal_date.Value))+')';
//        //ShowMessage(CommandText);
//        Execute;
//      end;
//    end;

    with qry577 do
    begin
      if FieldByName('stop_end_date').IsNull=False then
      begin
        strSQL:= 'select isnull(cast(sum(datediff(minute,[stop_begin_date],[stop_end_date]))as dec(10,2))/60,0)  '
           +' from data0577 where rkey567='+dm.cDS567.FieldByName('rkey').AsString ;

        with DM.cDS567 do
        begin
          Edit;                             // StrToFloat
          FieldByName('stop_house').Value:= (form1.SQLResultValue(DM.ADOQuery1,strSQL));
          Post;
          if ApplyUpdates(0)<>0 then
          RollbackTrans;
        end;
      end;
    end;

    if DM.ADOConnection.InTransaction    then
    DM.ADOConnection.CommitTrans;
  except
    on e:Exception do
    begin
      DM.ADOConnection.RollbackTrans;
      ShowMessage('提交失败！'+#13#10+e.Message);
    end;
  end;
  DM.cDS567.Close;
  DM.cDS567.Open;
  frmPause.SetButtonStatus(qry577.State in [dsEdit,dsInsert]);;
end;

procedure TDM.qry0577_1BeforeDelete(DataSet: TDataSet);
begin
//  if DM.cDS567.FieldByName('STATUS').AsInteger in[3,4] then      //如果已完工 已验收 ，删除前中止
//  Abort;   ?
end;

procedure TDM.qry0577_1BeforeInsert(DataSet: TDataSet);
begin
//  if DM.cDS567.FieldByName('STATUS').AsInteger in[3,4] then      //如果已完工 已验收，插入前中止
//  Abort;
end;

procedure TDM.qry0577_1BeforePost(DataSet: TDataSet);
var
  vNUMBER:string;
begin

  if cds567STATUS.AsInteger=2 then   //2 已受理
  begin
    cdsTemp.Data:=cds842.Data;
    cdsTemp.First;
    with  cdsTemp do
    while not Eof do
    begin
      if cdsTemp.FieldByName('Status').AsInteger=3 then
      begin

        ShowMessage('当前保养单还存在状态是“执行中”的雇员记录！！！');
        Abort;
      end;
      Next;
    end;
  end
  else
  if cds567STATUS.AsInteger=6 then   //6 已暂停
  begin
    if Form1.EmployeeStatusCheck(IntToStr(frmPause.vEmplRkey),vNUMBER) then
    begin
     // ShowMessage('该雇员在维修单：“'+vNUMBER+'”存在未完成的记录！！！');
      Abort;
    end;
  end;
//  if qry0577.State=dsInsert then
//  begin
//    if Form1.EmployeeStatusCheck(IntToStr(frmPause.vEmplRkey),vNUMBER) then
//    begin
//     // ShowMessage('该雇员在维修单：“'+vNUMBER+'”存在未完成的记录！！！');
//      Abort;
//    end;
//  end
//  else
//  if qry0577.State=dsEdit then
//  begin
//
//  end;

  if qry577remark.IsNull then
  begin
    MsgError('“'+qry577remark.DisplayLabel+'”不能为空！');
    Abort;
  end;
  
  with   DM.cDS567   do
  begin         //如果暂停开始时间<=disposal_date	受理日期
    if (DataSet.FieldByName('stop_begin_date').IsNull=False)and(FieldByName('disposal_date').IsNull=False)then
    if  DataSet.FieldByName('stop_begin_date').AsDateTime <=
               FieldByName('disposal_date').AsDateTime then
    begin
      MsgError('“'+DataSet.FieldByName('stop_begin_date').DisplayLabel
               +'”不能小于或等于“'+ FieldByName('disposal_date').DisplayLabel+'”');
      Abort;
    end;

    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey from data0577 where rkey567= '+dm.cDS567RKEY.AsString);   //是否存在不等于当前记录的且结束时间>=开始时间
      if qry577.State=dsInsert then
        SQL.Add(' and stop_end_date>='+QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',qry577.FieldByName('stop_begin_date').Value)))
      else
        SQL.Add('and rkey < '+qry577rkey.AsString+' and stop_end_date>='
                  +QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',qry577.FieldByName('stop_begin_date').NewValue)));            //查询当前暂停记录中是否有大于当前时间的记录
     // ShowMessage(SQL.Text);
      Open;
      if not IsEmpty then
      begin
        MsgError('本次的暂停开始时间不能小于上次的结束时间！');
        Abort;
      end;
    end;

    if (DataSet.FieldByName('stop_end_date').NewValue<>DataSet.FieldByName('stop_end_date').OldValue)
                       and(VarIsNull(DataSet.FieldByName('stop_end_date').NewValue)=False)then      //如果结束时间有更改且结束时间不为空。
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey from data0577 where rkey567= '+dm.cDS567RKEY.AsString);
      SQL.Add('and rkey > '+qry577rkey.AsString);
      SQL.Add(' and stop_begin_date<='+QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',qry577.FieldByName('stop_end_date').NewValue)));            //查询当前暂停记录中是否有大于当前时间的记录
     // ShowMessage(SQL.Text);
      Open;
      if not IsEmpty then
      begin
        MsgError('本次的结束时间不能大于和等于下次的暂停开始时间！');
        Abort;
      end;
    end;

    if (not DataSet.FieldByName('stop_end_date').IsNull)and(not DataSet.FieldByName('stop_begin_date').IsNull) then
    begin                                             {如果暂停结束时间<=暂停开始时间}
      if DataSet.FieldByName('stop_end_date').AsDateTime <=
               DataSet.FieldByName('stop_begin_date').AsDateTime then
      begin
        MsgError('“'+DataSet.FieldByName('stop_end_date').DisplayLabel
               +'”不能小于或等于“'+DataSet.FieldByName('stop_begin_date').DisplayLabel+'”！');
        Abort;
      end;
    end;

    if FieldByName('STATUS').AsInteger in[3,4] then         //  如果状态是“已完工”
    begin
      if FieldByName('complete_date').AsDateTime <=                          //如果ADS567.complete_date完工时间<=暂停开始时间
               DataSet.FieldByName('stop_begin_date').AsDateTime then
      begin
        MsgError('“'+FieldByName('complete_date').DisplayLabel
               +'”不能小于或等于“'+DataSet.FieldByName('stop_begin_date').DisplayLabel+'”！');
        Abort;
      end;
    end;
  end;

  with dm.ADOConnection  do
  begin
    if InTransaction    then
      RollbackTrans;
    BeginTrans;
  end;
end;

procedure TDM.cds842BeforeScroll(DataSet: TDataSet);
var
  f_Staff_Sum_house :real;
begin
  with cds842 do
  if StateIsCancel=False then
  if (state in [dsInsert,dsEdit])or(ChangeCount>0)then
  begin
    if cds842.State in [dsInsert,dsEdit ]then
    cds842.Post;

    if DM.cds567STATUS.AsInteger in [3,4] then
    begin
      DM.cdsTemp.Close;               //关闭后复制数据。
      DM.cdsTemp.Data:= DM.cds842.Data;
      with  DM.cdsTemp do
      begin
        First;
        f_Staff_Sum_house:=0;
        while not Eof do
        begin
          if FieldByName('WorkTime').Value>0  then    //工作时间
          f_Staff_Sum_house:= f_Staff_Sum_house+ FieldByName('WorkTime').Value;
          Next;
        end;
        if DM.cDS567.State<>dsEdit then DM.cDS567.Edit;
        DM.cDS567Staff_Sum_house.Value:=  f_Staff_Sum_house ;
        DM.cDS567.Post;
      end;
    end;
      DM.ADOConnection.BeginTrans;
      if DM.cds842.ApplyUpdates(0)=0 then
      begin
        if DM.cDS567.ApplyUpdates(0)=0 then
          DM.ADOConnection.CommitTrans
        else
          DM.ADOConnection.RollbackTrans;
      end
      else
        begin
          DM.ADOConnection.RollbackTrans;
          Abort;
        end
  end;
end;

procedure TDM.cds842ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage('保存失败'+e.Message);
end;

procedure TDM.cds842AfterInsert(DataSet: TDataSet);
begin
  with  cds842 do
  begin
    FieldByName('Work_ptr').Value:=cDS567RKEY.Value;
    FieldByName('WorkDate').Value:=Date;
    FieldByName('BeginTime').Value:=getsystem_date(dm.adoquery1,0);
    FieldByName('Status').Value:=3;
    FieldByName('TimeRest').Value:=2.5;
  end;
  Form1.ColNotReadOnlyFocus(Form1,cds842);
end;

procedure TDM.cds842AfterPost(DataSet: TDataSet);
begin
{  with DM.cds842 do
  if changeCount >0 then
  if ApplyUpdates(0)   <>0then
    Abort; }
end;

procedure TDM.cds842EMPL_CODEChange(Sender: TField);
begin
  with cds0005 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;
    if Sender.IsNull then
    begin
      if Sender.DataSet.FieldByName('EMPLOYEE_NAME').isnull=False then
      Sender.DataSet.FieldByName('EMPLOYEE_NAME').Value:=null;
      if Sender.DataSet.FieldByName('Empl_ptr').isnull=False then
      Sender.DataSet.FieldByName('Empl_ptr').Value:=null ;
    end
    else
    begin
      if Locate('EMPL_CODE',Sender.Value,[loCaseInsensitive]) then
        begin
        Sender.DataSet.FieldByName('Empl_ptr').Value := FieldByName('rkey').Value ;
        Sender.DataSet.FieldByName('EMPLOYEE_NAME').Value:= FieldByName('EMPLOYEE_NAME').Value ;
        end
      else
        begin
          if Sender.DataSet.FieldByName('Empl_ptr').isnull=False then
          Sender.DataSet.FieldByName('Empl_ptr').Value:=null;
          if Sender.DataSet.FieldByName('EMPLOYEE_NAME').isnull=False then
          Sender.DataSet.FieldByName('EMPLOYEE_NAME').Value:=null ;
        Sender.Value:=null;
        ShowMessage('雇员代码不存在！！！');
        end;
    end;
  end;
end;

procedure TDM.cds842EMPLOYEE_NAMEChange(Sender: TField);
begin
//  with cds0005 do
//  begin
//    if Active=False then
//    Open;
//
//    if Filtered then
//    Filtered:=False;
//
//    with Sender.DataSet do
//    if not(State in [dsEdit,dsInsert]) then
//    Edit;
//
//    if Sender.IsNull then
//    begin
//      Sender.DataSet.FieldByName('EMPL_CODE').Value:=null;
//      Sender.DataSet.FieldByName('Empl_ptr').Value:=null ;
//    end
//    else
//    begin
//      if Locate('EMPLOYEE_NAME',Sender.Value,[loCaseInsensitive]) then
//        begin
//        Sender.DataSet.FieldByName('Empl_ptr').Value := FieldByName('rkey').Value ;
//        Sender.DataSet.FieldByName('EMPL_CODE').Value:= FieldByName('EMPL_CODE').Value ;
//        end
//      else
//        begin
//          if Sender.DataSet.FieldByName('Empl_ptr').IsNull=False then
//          Sender.DataSet.FieldByName('Empl_ptr').Value:=null;
//          if Sender.DataSet.FieldByName('EMPL_CODE').IsNull=False then
//          Sender.DataSet.FieldByName('EMPL_CODE').Value:=null ;
//        Sender.Value:=null;
//        ShowMessage('雇员姓名不存在！！！');
//        end;
//    end;
//  end;
end;

procedure TDM.cds842StatusChange(Sender: TField);
begin
  with  cds832  do
  begin
    if Active=False then
    Open;
    cds842.FieldByName('MainExecStat').Value:= Lookup('rkey', Sender.Value,'MainExecStat');
  end;

end;

procedure TDM.cds842BeforePost(DataSet: TDataSet);
var
  strMsg,vNUMBER:string;
begin
//  if cds842BeginTime.Value>=cds842EndTime.Value then
//  begin
//    ShowMessage('结束时间不能小于或等于开始时间！！！');
//    Abort;
//  end;
{  if DataSet.State=dsInsert then
  if Form1.EmployeeStatusCheck(cds842Empl_ptr.AsString,vNUMBER) then
  begin
    ShowMessage('该雇员在维修单：“'+vNUMBER+'”存在未完成的记录！！！');
    Abort;
  end;

  with cds842 do
  begin
    if FieldByName('WorkDate').IsNull then
    strMsg:=FieldByName('WorkDate').DisplayLabel+'：字段的值不能为空！！！'+#13;
    if FieldByName('Empl_ptr').IsNull then
    strMsg:=strMsg+FieldByName('EMPLOYEE_NAME').DisplayLabel+'：字段的值不能为空！！！'+#13;
  end;
  if strMsg  <>'' then
  begin
    strMsg:=Copy(strMsg,0,Length(strMsg)-1) ;
    ShowMessage(strMsg);
    Abort;
  end;  }
end;

procedure TDM.cds842EndTimeChange(Sender: TField);
var
  beginTime,endTime:Integer;
begin
  QryResultTime.Close;
  QryResultTime.Parameters.ParamByName('vbeginTime').Value:=cds842BeginTime.Value;
  QryResultTime.Parameters.ParamByName('vEndTime').Value:=cds842EndTime.Value;
  QryResultTime.Open;
  cds842TimeRest.Value:= QryResultTime.FieldList[0].Value;

{  if (cds842BeginTime.IsNull=False) then
  endTime:= HourOf(cds842endTime.AsDateTime) ;

  if (endTime>=8) and (endTime<20) then  //大于和等于8点到小于20点
    begin
      if cds842DayShift.Value<>1 then
      begin
        cds842.FieldByName('DayShift').Value:=null;
        ShowMessage('请重输入你的班次！！！');
        //Abort;
      end;
    end
  else
    begin
      if cds842DayShift.Value<>2 then
      begin
        cds842.FieldByName('DayShift').Value:=null;
        ShowMessage('请重输入你的班次！！！');
       // Abort;
      end;
    end;   }
//  ShowMessage(IntToStr(HourOf( Sender.AsDateTime)));
end;

procedure TDM.cds842TimeRestChange(Sender: TField);
var
  strSQL:string;
begin
  inherited;
  with  cds842 do
  if FieldByName('EndTime').IsNull=False then
  begin
    strSQL:='SELECT datediff( minute ,'+QuotedStr(FormatDateTime('yyyy-m-d h:n:s',FieldByName('BeginTime').Value))
         +','+QuotedStr(FormatDateTime('yyyy-m-d h:n:s',FieldByName('EndTime').Value))+' )';
    if FieldByName('TimeCons').Value>0 then   //暂停时间
      strSQL:=strSQL+'-'+  FloatToStr(FieldByName('TimeCons').Value*60) ;
    if FieldByName('TimeRest').Value>0 then   //中途休息时间
      strSQL:=strSQL+'-'+  FloatToStr(FieldByName('TimeRest').Value*60) ;
  //  ShowMessage(strSQL);
    cds842.FieldByName('WorkTime').Value:=StrToFloat(Form1.SQLResultValue(ADOQuery1,strSQL))/60;//实际工作时间
  end;
end;

procedure TDM.DataSource1StateChange(Sender: TObject);
begin
  Form1.SetStatus;
end;

procedure TDM.cds842AfterScroll(DataSet: TDataSet);
begin
  with  DM.qry0843 do
  begin
    Close;
    Parameters.ParamByName('Work_ptr').Value:=DM.cds842rkey.Value;
    Open;
  end;
  Form1.SetStatus;
end;

procedure TDM.qry0843BeforePost(DataSet: TDataSet);
begin {
  with  cDS567  do
  begin         //如果暂停开始时间<=AdmiTime	受理日期
//    if (DataSet.FieldByName('stop_begin_date').IsNull=False)and(FieldByName('AdmiTime').IsNull=False)then
//    if  DataSet.FieldByName('stop_begin_date').AsDateTime <=
//               FieldByName('AdmiTime').AsDateTime then
//    begin
//      MsgError('“'+DataSet.FieldByName('stop_begin_date').DisplayLabel
//               +'”不能小于或等于“'+ FieldByName('AdmiTime').DisplayLabel+'”');
//      Abort;
//    end;

    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey from DATA0843 where Work_ptr= '+cds842RKEY.AsString);   //是否存在不等于当前记录的且结束时间>=开始时间
      if qry0843.State=dsInsert then
        SQL.Add(' and stop_end_date>='+QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',qry0843.FieldByName('stop_begin_date').Value)))
      else
        SQL.Add('and rkey < '+cds842rkey.AsString+' and stop_end_date>='
                  +QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',qry0843.FieldByName('stop_begin_date').NewValue)));            //查询当前暂停记录中是否有大于当前时间的记录
      //ShowMessage(SQL.Text);
      Open;
      if not IsEmpty then
      begin
        MsgError('本次的暂停开始时间不能小于上次的结束时间！');
        Abort;
      end;
    end;

    if (DataSet.FieldByName('stop_end_date').NewValue<>DataSet.FieldByName('stop_end_date').OldValue)
                       and(VarIsNull(DataSet.FieldByName('stop_end_date').NewValue)=False)then      //如果结束时间有更改且结束时间不为空。
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
//      SQL.Add('select rkey from DATA0838 where Work_ptr= '+frmWorkRecord.qryMainRKEY.AsString);
//      SQL.Add('and rkey > '+qryMainrkey.AsString);
//      SQL.Add(' and stop_begin_date<='+QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',qryMain.FieldByName('stop_end_date').NewValue)));            //查询当前暂停记录中是否有大于当前时间的记录
//     // ShowMessage(SQL.Text);

      SQL.Add('select rkey from DATA0843 where Work_ptr= '+cds842RKEY.AsString);
      SQL.Add('and rkey > '+qry0843RKEY.AsString);
      SQL.Add(' and stop_begin_date<='+QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',DataSet.FieldByName('stop_end_date').NewValue)));            //查询当前暂停记录中是否有大于当前时间的记录
      //ShowMessage(SQL.Text);
      Open;
      if not IsEmpty then
      begin
        MsgError('本次的结束时间不能大于和等于下次的暂停开始时间！');
        Abort;
      end;
    end;

    if (not DataSet.FieldByName('stop_end_date').IsNull)and(not DataSet.FieldByName('stop_begin_date').IsNull) then
    begin                                             //如果暂停结束时间<=暂停开始时间
      if DataSet.FieldByName('stop_end_date').AsDateTime <=
               DataSet.FieldByName('stop_begin_date').AsDateTime then
      begin
        MsgError('“'+DataSet.FieldByName('stop_end_date').DisplayLabel
               +'”不能小于或等于“'+DataSet.FieldByName('stop_begin_date').DisplayLabel+'”！');
        Abort;
      end;
    end;

    if FieldByName('STATUS').AsInteger in[4] then         //  如果状态是“已完工”
    begin
      if FieldByName('CompTime').AsDateTime <=                          //如果ADS567.complete_date完工时间<=暂停开始时间
               DataSet.FieldByName('stop_begin_date').AsDateTime then
      begin
        MsgError('“'+FieldByName('CompTime').DisplayLabel
               +'”不能小于或等于“'+DataSet.FieldByName('stop_begin_date').DisplayLabel+'”！');
        Abort;
      end;
    end;
  end;

  with dm.ADOConnection  do
  begin
    if InTransaction    then
      RollbackTrans;
    BeginTrans;
  end;    }

end;

procedure TDM.qry0843AfterPost(DataSet: TDataSet);
var
  strSQL:string;
  isPause:Boolean;
begin {
  with dm.ADOConnection  do
  try
    isPause:=False;
    with  ADOQuery1 do
    begin
      Clone(qry0843);
      while not Eof do
      begin
        if fieldByName('stop_end_date').isnull then
        begin
          isPause:=True;
          Break;
        end;
        Next;
      end;
    end;

    with  cds842  do
    begin
      Edit;
      if isPause=True then
      begin
        FieldByName('STATUS').AsInteger:=6 ;               //修改状态为已暂停
      end
      else
      begin
        FieldByName('STATUS').AsInteger:=3;           //修改状态为执行中
      end;
      Post;
      if  ApplyUpdates(0)<> 0 then
      RollbackTrans;
    end;

    if isPause=False then
    //if qryMain.FieldByName('stop_end_date').IsNull=False then
    begin
      strSQL:= 'select isnull(cast(sum(datediff(minute,[stop_begin_date],[stop_end_date]))as dec(10,2))/60,0)  '
         +' from DATA0843 where Work_ptr='+cds842.FieldByName('rkey').AsString ;
      cds842.Edit;
      cds842.FieldByName('TimeCons').Value:= StrToFloat(SQLResultValue(ADOQuery2,strSQL));
      cds842.Post;
      if  cds842.ApplyUpdates(0)<> 0 then
      RollbackTrans;
    end;


    if InTransaction    then
    CommitTrans;
  except
    on e:Exception do
    begin
      RollbackTrans;
      ShowMessage('提交失败！'+#13#10+e.Message);
    end;
  end;   }
 // frmPause1.SetButtonStatus(qry0843.State in [dsEdit,dsInsert]);

//  with dm.ADOConnection  do
//  try
//    isPause:=False;
//    with  DM.ADOQuery1 do
//    begin
//      Clone(qry0843);
//      while not Eof do
//      begin
//        if fieldByName('stop_end_date').isnull then
//        begin
//          isPause:=True;
//          Break;
//        end;
//        Next;
//      end;
//    end;
//
//    with  DM  do
//    begin
//      cds842.Edit;
//      NowDate:=Form1.GetSmallDatetime(DM.ADOQuery1);
//      
//      if isPause=True then
//      begin
//        cds842STATUS.AsInteger:=6 ;               //修改状态为已暂停
//
//      end
//      else
//      begin
//        cds842STATUS.AsInteger:=2;           //修改状态为执行中
//
//      end;
//      cds842.Post;
//    end;
//    
//    with qry0843 do
//    begin
//      if FieldByName('stop_end_date').IsNull=False then
//      begin
//        strSQL:= 'select isnull(cast(sum(datediff(minute,[stop_begin_date],[stop_end_date]))as dec(10,2))/60,0)  '
//           +' from data0577 where rkey567='+dm.ADS567.FieldByName('rkey').AsString ;
//        with DM.cds842 do
//        begin
//          Edit;
//          FieldByName('stop_house').Value:= StrToFloat(form1.SQLResultValue(DM.ADOQuery1,strSQL));
//          Post;
//        end;
//      end;
//    end;
//
//    if InTransaction    then
//    CommitTrans;
//  except
//    on e:Exception do
//    begin
//      RollbackTrans;
//      ShowMessage('提交失败！'+#13#10+e.Message);
//    end;
//  end;
//  DM.cds842.Close;
//  DM.cds842.Open;
//  frmPause1.SetButtonStatus;

end;

procedure TDM.qry0843AfterInsert(DataSet: TDataSet);
begin
  qry0843Work_ptr.Value:=cds842rkey.Value;
end;

procedure TDM.dsp842AfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  if UpdateKind= ukInsert then     
  begin
     with ADOQuery1  do
     begin
       Close;
       SQL.Text:='select @@identity';
       Open;
       DeltaDS.FieldByName('rkey').ReadOnly:=False;
       DeltaDS.FieldByName('rkey').NewValue:=ADOQuery1.Fields[0].Value;
       Close;
     end;
  end;
end;

procedure TDM.ADS567_DeleteAfterClose(DataSet: TDataSet);
begin
  cds842.Close;
end;

procedure TDM.ADS567_DeleteCalcFields(DataSet: TDataSet);
begin
  if (cDS567Staff_Sum_house.Value>0)and(cDS567stdDate.Value>0) then
  cDS567.FieldByName('AchiRate').Value:= cDS567stdDate.Value /cDS567Staff_Sum_house.Value;
end;

procedure TDM.ADS567_DeleteAchiRateGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin                            //显示时保留2位小数
  Text := FloatToStr(round(Sender.AsFloat * 10000)/100) + '%';//FloatToStr((Sender.AsFloat * 100)) + '%';
end;

procedure TDM.cds842BeforeCancel(DataSet: TDataSet);
begin
  StateIsCancel:=True;
end;

procedure TDM.cds842AfterCancel(DataSet: TDataSet);
begin
  StateIsCancel:=False;
end;

procedure TDM.cds567CalcFields(DataSet: TDataSet);
begin
  if (cDS567Staff_Sum_house.Value>0)and(cDS567stdDate.Value>0) then
  cDS567.FieldByName('AchiRate').Value:= cDS567stdDate.Value /cDS567Staff_Sum_house.Value;
  if  (cds567ent_date.IsNull=False)and(cds567complete_date.IsNull=False )then
  cds567GZSJ.Value:=MinutesBetween(cds567ent_date.Value,cds567complete_date.Value)/60;//分    ent_date,T1.complete_date

end;

procedure TDM.cds567complete_dateChange(Sender: TField);
var
  strSQL:string;
begin

  with CDS567 do
  if(FieldByName('complete_date').IsNull=False) then     //如果完工时间不是空，
  begin                                                  //完工时间-受理日期-暂停时间
    strSQL:= 'select  cast(DATEDIFF(Minute,'
               +QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',FieldByName('disposal_date').AsDateTime))+','
               +QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',FieldByName('complete_date').AsDateTime))
               +')as dec(10,2))/60-isnull('
               +FloatToStr(FieldByName('stop_house').AsFloat)+',0) ' ;
//       +' from data0567 where rkey='+CDS567.FieldByName('rkey').AsString ;
    //ShowMessage(strSQL);
    cDS567maintain_house.AsString :=Form1.SQLResultValue(ADOQuery1,strSQL);     //维修使用小时=完工时间-受理日期-暂停时间
  end
  else
  begin
    fieldbyName('maintain_house').value:=null;
  end;
end;

procedure TDM.cds567AfterClose(DataSet: TDataSet);
begin
  cds842.Close;
end;

procedure TDM.cds567AfterOpen(DataSet: TDataSet);
begin
  if v567Rkey>0 then
  DataSet.Locate('rkey',v567Rkey,[])  ;
end;

procedure TDM.cds567AfterScroll(DataSet: TDataSet);
begin
  if F_IsBatchOperating=False then//不是批处理。
  begin
    with qry_data0468 do
    if  Form1.CheckBox8.Checked then
    begin
      Close;
      Parameters.ParamByName('vd567_ptr').Value:=DM.cds567RKEY.Value;
      Open;
    end;

//    if frmPause.Showing then
//    begin
//      with  qry577 do
//      begin
//        Close;
//        Parameters.ParamByName('vRkey567').Value:=cDS567RKEY.Value;
//        Open;
//       // ShowMessage('qry0577 Open');
//      end;
//    end;
    with cds842 do
    begin
      Close;
      Params.ParamByName('vWork_ptr').Value:=cDS567RKEY.Value;
      Open;
    end;
    Form1.SetStatus;
  end;  
end;

procedure TDM.cds567BeforeClose(DataSet: TDataSet);
var
  i:Integer;
begin
   v567Rkey:=cDS567RKEY.Value;

  with   (DataSet as TClientDataSet) do
  if  IndexName<>'' then
  DeleteIndex(IndexName) ;               //清除已存在的索引

  with   Form1.DBGridEh1   do
  for i:=0 to Columns.Count-1  do      //清除表格中的排序状态
  begin
    if  Columns[i].Title.SortMarker<> smNoneEh   then
    Columns[i].Title.SortMarker:= smNoneEh;
  end;
end;

procedure TDM.cds567stop_houseChange(Sender: TField);
begin
  cDS567complete_dateChange(nil);
end;

procedure TDM.cds567AchiRateGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := FloatToStr(round(Sender.AsFloat * 10000)/100) + '%';//FloatToStr((Sender.AsFloat * 100)) + '%';
end;

procedure TDM.dsp567GetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
  TableName:='DATA0567';
end;

procedure TDM.cds567STATUSChange(Sender: TField);
begin
{  if  Sender.AsInteger=  0  then
    DM.cds567V_stat.Value:= '未提交'
  else
  if  Sender.AsInteger=  1  then
    DM.cds567V_stat.Value:= '待受理'
  else
  if  Sender.AsInteger=  2  then
    DM.cds567V_stat.Value:= '已受理'
  else
  if  Sender.AsInteger=  3  then
    DM.cds567V_stat.Value:= '已完工'
  else
  if  Sender.AsInteger=  4  then
    DM.cds567V_stat.Value:= '已验收'
  else
  if  Sender.AsInteger=  5  then
    DM.cds567V_stat.Value:= '被退回'
  else
  if  Sender.AsInteger=  6  then
    DM.cds567V_stat.Value:= '已暂停'
  else
  if  Sender.AsInteger=  8  then
    DM.cds567V_stat.Value:= '验收退回'  ;  }

end;

procedure TDM.cds567ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage('保存失败'+e.Message);
end;

procedure TDM.cds567FaultNameChange(Sender: TField);
begin
  with qry_D0846 do
  if Active=False then
  Open;

  if qry_D0846.Filtered then
  qry_D0846.Filtered:=False;

  with Sender.DataSet do
  if not(State in [dsEdit,dsInsert]) then
  Edit;

  if Sender.IsNull then
  begin
      cds567.FieldByName('FaultName').Value:=null ;
      cds567.FieldByName('stdDate').Value:=null;
  end
  else
  begin
    if qry_D0846.Locate('FaultName',Sender.Value,[]) then
      begin
      cds567D846_ptr.Value := qry_D0846.FieldByName('rkey').Value ;
      cds567stdDate.Value:= qry_D0846.FieldByName('stdDate').Value ;
      end
    else
      begin
      cds567.FieldByName('D846_ptr').Value:=null;
      cds567.FieldByName('FaultName').Value:=null ;
      cds567.FieldByName('stdDate').Value:=null;
      ShowMessage('故障名称不存在！！！');
      end;
  end;
end;

procedure TDM.cds567FilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if Trim(form1.Edit1.Text) <>'' then
//  if CheckBox2.Checked then
//    Accept:= UpperCase(Trim(DataSet.FieldByName(FilterFieldName).AsString))=UpperCase(Trim(Edit1.Text) )
//  else     //字符串比较不区分大小写
    Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(Form1.FilterFieldName).AsString),UpperCase(Form1.Edit1.Text )) ;
end;

procedure TDM.cds567LocationChange(Sender: TField);
begin
  with qryD840 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;

    if Sender.IsNull then
    begin
        cds567.FieldByName('D840_ptr').Value:=null ;
    end
    else
    begin
      if Locate('Location',Sender.Value,[]) then
        begin
        cds567D840_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        cds567.FieldByName('D840_ptr').Value:=null;
        ShowMessage('设备责任小组不存在！！！');
        end;
    end;
  end;
end;

procedure TDM.cds567BeforePost(DataSet: TDataSet);
begin
//  if cds567disposal_date.Value>=cds567complete_date.Value then
//  begin
//    ShowMessage('完工日期不能小于或等于受理日期！！！');
//    Abort;
//  end;
end;

procedure TDM.qry577AfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('rkey567').Value:=DM.cDS567RKEY.Value;
  end;
end;

procedure TDM.qry577AfterPost(DataSet: TDataSet);
var
  strSQL:string;
  isPause:Boolean;
  NowDate:TDateTime;
begin
  with dm.ADOConnection  do
  try
    with qry577 do
    begin
      if FieldByName('stop_end_date').IsNull=False then
      begin
        strSQL:= 'select isnull(cast(sum(datediff(minute,[stop_begin_date],[stop_end_date]))as dec(10,2))/60,0)  '
           +' from data0577 where rkey567='+dm.cDS567.FieldByName('rkey').AsString ;

        with DM.cDS567 do
        begin
          Edit;                             // StrToFloat
          FieldByName('stop_house').Value:= (form1.SQLResultValue(DM.ADOQuery1,strSQL));
          Post;
          if ApplyUpdates(0)<>0 then
          RollbackTrans;
        end;
      end;
    end;

    if DM.ADOConnection.InTransaction    then
    DM.ADOConnection.CommitTrans;
  except
    on e:Exception do
    begin
      DM.ADOConnection.RollbackTrans;
      ShowMessage('提交失败！'+#13#10+e.Message);
    end;
  end;
  DM.cDS567.Close;
  DM.cDS567.Open;
  qry577.Refresh;
//  qry577.Open;
 // frmPause.SetButtonStatus(qry577.State in [dsEdit,dsInsert]);

end;

procedure TDM.qry577BeforePost(DataSet: TDataSet);
var
  vNUMBER:string;
begin

  if cds567STATUS.AsInteger=2 then   //2 已受理
  begin
    cdsTemp.Data:=cds842.Data;
    cdsTemp.First;
    with  cdsTemp do
    while not Eof do
    begin
      if cdsTemp.FieldByName('Status').AsInteger=3 then
      begin
        ShowMessage('当前保养单还存在状态是“执行中”的雇员记录！！！');
        Abort;
      end;
      Next;
    end;
  end
  else
  if cds567STATUS.AsInteger=6 then   //6 已暂停
  begin
    if Form1.EmployeeStatusCheck(IntToStr(frmPause.vEmplRkey),vNUMBER) then
    begin
     // ShowMessage('该雇员在维修单：“'+vNUMBER+'”存在未完成的记录！！！');
      Abort;
    end;
  end;

  if qry577remark.IsNull then
  begin
    MsgError('“'+qry577remark.DisplayLabel+'”不能为空！');
    Abort;
  end;
  
  with   DM.cDS567   do
  begin         //如果暂停开始时间<=disposal_date	受理日期
    if (DataSet.FieldByName('stop_begin_date').IsNull=False)and(FieldByName('disposal_date').IsNull=False)then
    if  DataSet.FieldByName('stop_begin_date').AsDateTime <=
               FieldByName('disposal_date').AsDateTime then
    begin
      MsgError('“'+DataSet.FieldByName('stop_begin_date').DisplayLabel
               +'”不能小于或等于“'+ FieldByName('disposal_date').DisplayLabel+'”');
      Abort;
    end;

    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey from data0577 where rkey567= '+dm.cDS567RKEY.AsString);   //是否存在不等于当前记录的且结束时间>=开始时间
      if qry577.State=dsInsert then
        SQL.Add(' and stop_end_date>='+QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',qry577.FieldByName('stop_begin_date').Value)))
      else
        SQL.Add('and rkey < '+qry577rkey.AsString+' and stop_end_date>='
                  +QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',qry577.FieldByName('stop_begin_date').NewValue)));            //查询当前暂停记录中是否有大于当前时间的记录
     // ShowMessage(SQL.Text);
      Open;
      if not IsEmpty then
      begin
        MsgError('本次的暂停开始时间不能小于上次的结束时间！');
        Abort;
      end;
    end;

    if (DataSet.FieldByName('stop_end_date').NewValue<>DataSet.FieldByName('stop_end_date').OldValue)
                       and(VarIsNull(DataSet.FieldByName('stop_end_date').NewValue)=False)then      //如果结束时间有更改且结束时间不为空。
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey from data0577 where rkey567= '+dm.cDS567RKEY.AsString);
      SQL.Add('and rkey > '+qry577rkey.AsString);
      SQL.Add(' and stop_begin_date<='+QuotedStr(FormatDateTime('YYYY/MM/DD hh:mm',qry577.FieldByName('stop_end_date').NewValue)));            //查询当前暂停记录中是否有大于当前时间的记录
     // ShowMessage(SQL.Text);
      Open;
      if not IsEmpty then
      begin
        MsgError('本次的结束时间不能大于和等于下次的暂停开始时间！');
        Abort;
      end;
    end;

    if (not DataSet.FieldByName('stop_end_date').IsNull)and(not DataSet.FieldByName('stop_begin_date').IsNull) then
    begin                                             {如果暂停结束时间<=暂停开始时间}
      if DataSet.FieldByName('stop_end_date').AsDateTime <=
               DataSet.FieldByName('stop_begin_date').AsDateTime then
      begin
        MsgError('“'+DataSet.FieldByName('stop_end_date').DisplayLabel
               +'”不能小于或等于“'+DataSet.FieldByName('stop_begin_date').DisplayLabel+'”！');
        Abort;
      end;
    end;

    if FieldByName('STATUS').AsInteger in[3,4] then         //  如果状态是“已完工”
    begin
      if FieldByName('complete_date').AsDateTime <=                          //如果ADS567.complete_date完工时间<=暂停开始时间
               DataSet.FieldByName('stop_begin_date').AsDateTime then
      begin
        MsgError('“'+FieldByName('complete_date').DisplayLabel
               +'”不能小于或等于“'+DataSet.FieldByName('stop_begin_date').DisplayLabel+'”！');
        Abort;
      end;
    end;
  end;

  with dm.ADOConnection  do
  begin
    if InTransaction    then
      RollbackTrans;
    BeginTrans;
  end;
end;

procedure TDM.qry577BeforeScroll(DataSet: TDataSet);
begin
//
end;

procedure TDM.cds842BeginTimeChange(Sender: TField);
var
  beginTime:Integer;
begin
  QryResultTime.Close;
  QryResultTime.Parameters.ParamByName('vbeginTime').Value:=cds842BeginTime.Value;
  QryResultTime.Parameters.ParamByName('vEndTime').Value:=cds842EndTime.Value;
  QryResultTime.Open;
  cds842TimeRest.Value:= QryResultTime.FieldList[0].Value;

//  if (cds842BeginTime.IsNull=False) then //    and(cds842DayShift.IsNull )
//  beginTime:= HourOf(cds842BeginTime.AsDateTime) ;
//
//  if (beginTime>=8) and (beginTime<20) then  //大于和等于8点到小于20点
//    cds842DayShift.Value:=1
//  else
//    cds842DayShift.Value:=2;
end;

end.

unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus,
  Mask, DBCtrlsEh;

type
  TFrm_Main = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    BtnRefresh: TBitBtn;
    BtnClose: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BtnQuery: TBitBtn;
    BtnFieldsVisable: TBitBtn;
    Edt_Fielter: TEdit;
    Lab_Fielter: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label14: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox6: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    BitBtn15: TBitBtn;
    PopupMenu2: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    Edt_WorkOrder: TEdit;
    Label2: TLabel;
    cbb_DeptName: TComboBox;
    Label3: TLabel;
    Cbb_WorkName: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Edt_un_Applican: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edt_MainExecStat: TEdit;
    Label10: TLabel;
    Edt_AcceTime: TEdit;
    Label11: TLabel;
    Edt_un_AccePeop: TEdit;
    Label12: TLabel;
    Edt_ForeTime: TEdit;
    Label13: TLabel;
    Edt_ActuCons: TEdit;
    Label15: TLabel;
    Edt_Efficien: TEdit;
    Label16: TLabel;
    Mem_Remark: TMemo;
    Mem_WorkExpl: TMemo;
    N7: TMenuItem;
    DBDTE_AdmiTime: TDBDateTimeEditEh;
    DBDTE_CompTime: TDBDateTimeEditEh;
    Label22: TLabel;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure BtnFieldsVisableClick(Sender: TObject);
    procedure DBGridEh1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edt_FielterChange(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure cbb_DeptNameExit(Sender: TObject);
    procedure Cbb_WorkNameExit(Sender: TObject);
    procedure Mem_WorkExplExit(Sender: TObject);
    procedure Edt_ForeTimeExit(Sender: TObject);
    procedure Edt_ForeTimeKeyPress(Sender: TObject; var Key: Char);
    procedure Mem_RemarkExit(Sender: TObject);
    procedure DBDTE_AdmiTimeExit(Sender: TObject);
    procedure DBDTE_CompTimeExit(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
  private
    PreColumn:TColumnEh;
//    RK419:Integer;
    strStatusValue,ssql,sql_text : string;
    function find_error(v_rkey,v_status:Integer):Boolean;
    function EmployeeStatusCheck(vEmpl_ptr:string):Boolean;
    procedure check837status();
    { Private declarations }
  public
    clickNum,QueryClick :Integer;
    dteBegin,dteBeginTime,dteEnd,dteEndTime:TDateTime;
    strsql:string;
    { Public declarations }
  end;

var
  Frm_Main: TFrm_Main;

implementation

uses damo,common,DB, ColsDisplaySet_unt, QuerySet, formGetUserRights,
  Recordt, task, HistoryAdd, Employee,DateUtils, ProjectTime;

{$R *.dfm}

procedure TFrm_Main.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  self.Caption:=application.Title;
// rkey73:='2551';
// user_ptr := '3054';
// vprev := '4';
end;

procedure TFrm_Main.FormShow(Sender: TObject);
begin
  PreColumn := DBGridEh1.Columns[0];
   
//  with DM.tmp do
//  begin
//    Close;
//    SQL.Text:='select * from data0419 where programe='+QuotedStr(Extractfilename(application.exename));
//    Open;
//    if not IsEmpty then
//      Rk419:=FieldByName('rkey').AsInteger
//    else
//      Rk419:=-1;//2570;
//  end;
  sql_text := DM.ADS835.CommandText;
//  clickNum :=0;
//  QueryClick :=0;
  DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)-100;
  DateTimePicker2.Date := common.getsystem_date(dm.tmp,0);
  strStatusValue :=' and data0835.status in (1,3,4,6) ';
  DM.ADS835.Close;
  dm.ADS835.CommandText := sql_text+strStatusValue+ssql+' and ((data0835.AdmiTime >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0835.AdmiTime <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+') or data0835.AdmiTime is null)';
  DM.ADS835.Open;
  DM.ADS837.Open;
  PageControl1.ActivePage := TabSheet1;

  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select EMPLOYEE_PTR,USER_FULL_NAME,USER_LOGIN_NAME from data0073 where  rkey='+rkey73;
    Open;
    user_ptr:=Fields[0].AsString;
    StatusBar1.Panels[1].Text:='用户名：'+trim(FieldValues['USER_FULL_NAME'])+' ('+trim(FieldValues['USER_LOGIN_NAME'])+')';
//    Log_USER_FULL_NAME:=FieldValues['USER_FULL_NAME'];
//    Log_USER_LOGIN_NAME:=FieldValues['USER_LOGIN_NAME'];
    Close;
  end;

  ResetGridColumns(Self,DM.ADOConnection1,StrToInt(rkey73),StrToInt(vprev)=2);

end;

procedure TFrm_Main.BtnRefreshClick(Sender: TObject);
var
  rkey835:integer;
begin
  rkey835 := DM.ADS835RKEY.Value;
  dm.ADS835.Close;
  dm.ADS835.Prepared;
  dm.ADS835.Open;
  if rkey835>0 then
  dm.ADS835.Locate('rkey',rkey835,[]);

end;

procedure TFrm_Main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS835.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TFrm_Main.BtnFieldsVisableClick(Sender: TObject);
begin
  show_ColsDisplaySet_frm (Self,DBGridEh1,StrToInt(rkey73)) ;
end;

procedure TFrm_Main.DBGridEh1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  SaveColsInfo(Self,StrToInt(rkey73));
end;

procedure TFrm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(DM.ADS835.CommandText);
end;

procedure TFrm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (Column.Title.SortMarker = smDownEh) or (Column.Title.SortMarker = smNoneEh) then
  begin
    Column.Title.SortMarker := smUpEh;
    DM.ADS835.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    DM.ADS835.IndexFieldNames := Column.FieldName+' DESC';
  end;

  if(PreColumn.FieldName<>Column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    Label1.Caption := Column.Title.Caption;
    Edt_Fielter.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clRed;
    PreColumn := Column;
  end
  else
  Edt_Fielter.SetFocus;
end;

procedure TFrm_Main.Edt_FielterChange(Sender: TObject);
begin
  if trim(Edt_Fielter.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(Edt_Fielter.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TFrm_Main.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(DM.ADS837.CommandText);
end;

procedure TFrm_Main.CheckBox1Click(Sender: TObject);
begin
  strStatusValue :='';
  if CheckBox1.Checked then
    strStatusValue := '1,';
  if CheckBox2.Checked then
    strStatusValue:=strStatusValue+'2,';
  if CheckBox3.Checked then
    strStatusValue:=strStatusValue+'3,';
  if CheckBox4.Checked then
    strStatusValue:=strStatusValue+'4,';
  if CheckBox6.Checked then
    strStatusValue:=strStatusValue+'6,';


  if strStatusValue <> '' then
    strStatusValue := ' and Data0835.Status in ('+copy(strStatusValue,0,Length(strStatusValue)-1)+')'+#13
  else
    strStatusValue := ' and Data0835.Status in (9)'+#13;

  With DM.ADS835 do
  begin
    Close;
    CommandText := sql_text+strStatusValue+ssql+' and ((data0835.AdmiTime >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0835.AdmiTime <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+') or data0835.AdmiTime is null)';
    Open;
  end;
end;

procedure TFrm_Main.DateTimePicker1Exit(Sender: TObject);
begin
  With DM.ADS835 do
  begin
    Close;
    CommandText := sql_text+strStatusValue+ssql+' and ((data0835.AdmiTime >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0835.AdmiTime <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+') or data0835.AdmiTime is null)';
    Open;
  end;
end;

procedure TFrm_Main.DateTimePicker1CloseUp(Sender: TObject);
begin
  Edt_Fielter.SetFocus;
end;

procedure TFrm_Main.DateTimePicker2Exit(Sender: TObject);
begin
  With DM.ADS835 do
  begin
    Close;
    CommandText := sql_text+strStatusValue+ssql+' and ((data0835.AdmiTime >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0835.AdmiTime <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+') or data0835.AdmiTime is null)';
    Open;
  end;
end;

procedure TFrm_Main.DateTimePicker2CloseUp(Sender: TObject);
begin
  Edt_Fielter.SetFocus;
end;

procedure TFrm_Main.BtnQueryClick(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySet.ShowModal=mrok then
  begin
    dm.ADS835.Close;
    dm.ADS835.CommandText := sql_text;
    ssql:='';
    for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
    ssql := ssql+ frmQuerySet.SGrid1.Cells[2,i]+#13;
    dm.ADS835.CommandText := sql_text+strStatusValue+ssql+' and ((data0835.AdmiTime >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0835.AdmiTime <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+') or data0835.AdmiTime is null)';
    dm.ADS835.Open;
  end;

end;

procedure TFrm_Main.N7Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin   //GetUserRights
  if GetUserRights(Self,DM.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'重置登陆用户名') then
  begin
    vprev:= vUser_rights;
    rkey73:=vUsernameRkey;
    user_ptr:=vEmployeeRkey;
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select d3.USER_FULL_NAME,d3.USER_LOGIN_NAME,d3.EMPLOYEE_PTR,d5.EMPLOYEE_NAME,d5.EMPL_CODE '
          +' from data0073 as d3 left join data0005 d5 on d3.EMPLOYEE_PTR=d5.rkey where d3.rkey='+rkey73;
    DM.tmp.Open;
    StatusBar1.Panels[1].Text:='用户名：'+trim(DM.tmp.FieldValues['USER_FULL_NAME'])+' ('+trim(DM.tmp.FieldValues['USER_LOGIN_NAME'])+')';
    DM.tmp.Close;
    ShowMessage('你已重置当前程序的登陆用户名，操作完成后务必关闭！！！');
  end;

end;

procedure TFrm_Main.N6Click(Sender: TObject);
begin
  frm_Recordt:=Tfrm_Recordt.Create(Application);
//  if not frm_Recordt.ADS839.IsEmpty then
  with frm_Recordt do
  begin
    with  ads839 do
    begin
      Close;
      Parameters.ParamByName('TableName').Value:='data0835';
      Parameters.ParamByName('Record_rkey').Value:=dm.ads835rkey.Value;
      Open;
    end;
    ShowModal;
  end;
end;

procedure TFrm_Main.PageControl1Change(Sender: TObject);
begin
  BtnRefresh.Click;
//  if (PageControl1.ActivePageIndex=1) and (not DM.ADs567.IsEmpty) and(CheckBox8.Checked) then
//  begin
//    DM.ADs468.Close;
//    DM.ADs468.Parameters[0].Value:=DM.ADS567RKEY.Value;
//    DM.ADs468.Open;
//  end;

  Edt_WorkOrder.Text := DM.ADS835WorkOrder.Value;

  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,DeptName from data0830';
    Open;
    First;
  end;
  cbb_DeptName.Items.Clear;
  while not DM.tmp.Eof do
  begin
    cbb_DeptName.Items.AddObject(DM.tmp.FieldValues['DeptName'],Pointer(DM.tmp.FieldByName('rkey').asinteger));
    DM.tmp.Next;
  end;
  cbb_DeptName.ItemIndex := cbb_DeptName.Items.IndexOf(DM.ADS835DeptName.Value);

  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,WorkName from data0836';
    Open;
    First;
  end;
  Cbb_WorkName.Items.Clear;
  while not DM.tmp.Eof do
  begin
    Cbb_WorkName.Items.AddObject(DM.tmp.FieldValues['WorkName'],Pointer(DM.tmp.FieldByName('rkey').asinteger));
    DM.tmp.Next;
  end;
  Cbb_WorkName.ItemIndex := Cbb_WorkName.Items.IndexOf(DM.ADS835WorkName.Value);

  Mem_WorkExpl.Lines.Text:=DM.ADS835WorkExpl.Value;
  Edt_un_Applican.Text := DM.ADS835un_Applican.Value;
  DBDTE_AdmiTime.Text := DM.ADS835AdmiTime.AsString;
  DBDTE_CompTime.Text := DM.ADS835CompTime.AsString;
  Edt_MainExecStat.Text := DM.ADS835MainExecStat.Value;
  Edt_AcceTime.Text := DM.ADS835AcceTime.AsString;
  Edt_un_AccePeop.Text := DM.ADS835un_AccePeop.Value;
  Edt_ForeTime.Text := DM.ADS835ForeTime.AsString;
  Edt_ActuCons.Text := DM.ADS835ActuCons.AsString;
  Edt_Efficien.Text := DM.ADS835Efficien.AsString;
  Mem_Remark.Lines.Text := DM.ADS835Remark.Value;
end;

procedure TFrm_Main.N1Click(Sender: TObject);
begin
  if (StrToInt(vprev) in[2,3,4])=False then
  begin
    ShowMessage('你没有新增的权限！');
    Exit;
  end;
  Frm_Task := TFrm_Task.Create(Application);
  if Frm_Task.ShowModal=mrok then
  begin
    dm.ADS835.Close;
    dm.ADS835.Open;
    dm.ADS835.Locate('rkey',Frm_Task.Rkey835,[]);
    ShowMsg('新增操作成功!',1);
  end;
end;

procedure TFrm_Main.cbb_DeptNameExit(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := ' select rkey,Dept_ptr from data0835  where rkey='+dm.ADS835rkey.AsString;
    Open;
    Edit;
    FieldByName('Dept_ptr').Value := Integer(cbb_DeptName.Items.Objects[cbb_DeptName.ItemIndex]);
    Post;
  end;
end;

procedure TFrm_Main.Cbb_WorkNameExit(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := ' select rkey,Work_ptr from data0835  where rkey='+dm.ADS835rkey.AsString;
    Open;
    Edit;
    FieldByName('Work_ptr').Value := Integer(Cbb_WorkName.Items.Objects[Cbb_WorkName.ItemIndex]);
    Post;
  end;
end;

procedure TFrm_Main.Mem_WorkExplExit(Sender: TObject);
begin

  with DM.tmp do
  begin
    Close;
    SQL.Text := ' select rkey,WorkExpl from data0835  where rkey='+dm.ADS835rkey.AsString;
    Open;
    Edit;
    FieldByName('WorkExpl').Value := Mem_WorkExpl.Lines.Text;
    Post;
  end;
end;

procedure TFrm_Main.Edt_ForeTimeExit(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := ' select rkey,ForeTime from data0835  where rkey='+dm.ADS835rkey.AsString;
    Open;
    Edit;
    if Edt_ForeTime.Text <> '' then
    begin
      FieldByName('ForeTime').Value := Edt_ForeTime.Text;
    end
    else
    begin
      FieldByName('ForeTime').Value := 0;
    end;
    Post;
  end;
end;

procedure TFrm_Main.Edt_ForeTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then abort//判断是否输入数字
  else
  if key = chr(46) then
  if pos('.',Edt_ForeTime.Text)>0then abort;//第二列小数点'.'不能重复
end;

procedure TFrm_Main.Mem_RemarkExit(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := ' select rkey,Remark from data0835  where rkey='+dm.ADS835rkey.AsString;
    Open;
    Edit;
    FieldByName('Remark').Value := Mem_Remark.Lines.Text;
    Post;
  end;
end;

procedure TFrm_Main.DBDTE_AdmiTimeExit(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := ' select rkey,AdmiTime from data0835  where rkey='+dm.ADS835rkey.AsString;
    Open;
    Edit;
    FieldByName('AdmiTime').Value := DBDTE_AdmiTime.Text;
    Post;
  end;
end;

procedure TFrm_Main.DBDTE_CompTimeExit(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := ' select rkey,CompTime from data0835  where rkey='+dm.ADS835rkey.AsString;
    Open;
    Edit;
    FieldByName('CompTime').Value := DBDTE_CompTime.Text;
    Post;
  end;
end;

function TFrm_Main.find_error(v_rkey, v_status: Integer): Boolean;
begin
  with dm.tmp do
  begin
    Close;
    sql.Text:='select rkey from data0835 where rkey='+inttostr(v_rkey)+
              ' and status='+inttostr(v_status);
    open;
  end;
  if dm.tmp.IsEmpty then
    Result:=True
  else
    result:=false;
end;

procedure TFrm_Main.N3Click(Sender: TObject);
var
  NowDate:TDateTime;
begin
  if (StrToInt(vprev) in[2,3,4])=False then
  begin
    ShowMessage('你没有开始受理的权限！');
    Exit;
  end;
  if  Self.find_error(dm.ADS835rkey.Value,dm.ADS835Status.Value) then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;
//  IsSenderMsg:=True;
  NowDate:=getsystem_date(DM.tmp,0);
  try
    DM.ADOConnection1.BeginTrans;
    with DM.tmp do
    begin
      Close;
      SQL.Text :=' update data0835 set status=3,AdmiPeop='+QuotedStr(rkey73)+',AdmiTime='+
      QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',NowDate))+' where rkey='+dm.ADS835rkey.AsString;
      ExecSQL;
      Close;
      SQL.Text := 'insert into data0839(TableName, User_ptr, Status_ptr, Record_date,Record_rkey) values(''data0835'','+
      QuotedStr(rkey73)+',3,'+QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',NowDate))+','+dm.ADS835rkey.AsString+')';
      ExecSQL;
    end;
    DM.ADOConnection1.CommitTrans;
    BtnRefreshClick(Self);
  except
    on E:Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      ShowMessage('提交失败！'+#13#10+e.Message);
    end;
  end;
end;

procedure TFrm_Main.N2Click(Sender: TObject);
var
  num:Integer;
begin
  if (strtoint(vprev)=1)  then
    messagedlg('对不起!您没有该程序的删除权限',mtinformation,[mbok],0)
  else
  if MessageDlg('您确定要删除该任务吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    num:=0;
    try
      DM.ADOConnection1.BeginTrans;
      with DM.tmp do
      begin
        Close;
        SQL.Text := 'delete data0837 where data0837.work_ptr ='+dm.ADS835rkey.AsString;
        ExecSQL;
      end;
      with DM.tmp do
      begin
        Close;
        SQL.Text := 'delete data0835 where data0835.rkey ='+dm.ADS835rkey.AsString;
        if ExecSQL>0 then
        begin
          num :=1;
        end;
      end;
      DM.ADOConnection1.CommitTrans;
      if num=1 then
      begin
        common.ShowMsg('删除操作成功！',1);
        self.BtnRefreshClick(Sender);
      end;
    except
      on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
        DM.ADOConnection1.RollbackTrans;
      end;
    end;
  end;
end;



function TFrm_Main.EmployeeStatusCheck(vEmpl_ptr: string): Boolean;
begin
  Result:=False;
  with DM.tmp do
  begin
    Close;
    SQL.Text:='select data0835.WorkOrder,Data0005.EMPLOYEE_NAME from Data0837 inner join data0835 on Data0837.work_ptr=data0835.rkey '
        +'INNER JOIN  Data0005 ON Data0837.Empl_ptr = Data0005.RKEY where Data0837.empl_ptr='+vEmpl_ptr+' and Data0837.status=3';
    Open;

    if IsEmpty=False then         //如果该雇员存在未完成的记录，返回值为真
    begin
     // vNUMBER:= FieldByName('WorkOrder').AsString;
      ShowMessage('雇员:“'+FieldByName('EMPLOYEE_NAME').AsString+'“在工作单：“'+FieldByName('WorkOrder').AsString+'”存在未完成的记录！！！');
      Result:=True;
    end;
  end;
end;

procedure TFrm_Main.N12Click(Sender: TObject);
var
  BeginDateTime:TDateTime;
begin
  if (strtoint(vprev)in [2,3,4])=False then
  begin
    messagedlg('对不起,您没有添加雇员的权限！',mtinformation,[mbok],0)  ;
    Exit ;
  end;
  if  Self.find_error(dm.ADS835rkey.Value,dm.ADS835Status.Value) then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;

  frm_HistoryAdd := Tfrm_HistoryAdd.Create(Application);
  if frm_HistoryAdd.ShowModal=mrok then
  begin
    try
      BeginDateTime := getsystem_date(DM.tmp,0);
      frm_HistoryAdd.CDS837.DisableControls;

      frm_HistoryAdd.CDS837.First;
      while not frm_HistoryAdd.CDS837.Eof do
      begin
        if frm_HistoryAdd.DBGridEh2.FieldColumns['selected'].Field.AsBoolean=True then
        if EmployeeStatusCheck(frm_HistoryAdd.CDS837Empl_ptr.AsString) then
        begin
          frm_HistoryAdd.CDS837.Next;
          Continue;
        end;
        if frm_HistoryAdd.DBGridEh2.FieldColumns['selected'].Field.AsBoolean=True then
        begin
          with DM.tmp do
          begin
            Close;
            SQL.Text :='insert into data0837(Work_ptr,WorkDate,BeginTime,Empl_ptr,Status) values('+
            DM.ADS835rkey.AsString+','+QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',frm_HistoryAdd.DBDTE_CompTime.Value))+','+
            QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',BeginDateTime))+','+frm_HistoryAdd.CDS837Empl_ptr.AsString+',3) ';
            ExecSQL;
          end;
        end;
        frm_HistoryAdd.CDS837.Next;
      end;
    finally
      frm_HistoryAdd.CDS837.EnableControls;
    end;

  end;
  BtnRefreshClick(Sender);
end;

procedure TFrm_Main.N8Click(Sender: TObject);
begin
  if (strtoint(vprev)in [2,3,4])=False then
  begin
    messagedlg('对不起,您没有添加雇员的权限！',mtinformation,[mbok],0)  ;
    Exit ;
  end;
  if  Self.find_error(dm.ADS835rkey.Value,dm.ADS835Status.Value) then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;
  try
    Frm_Employee := TFrm_Employee.Create(Application);
    Frm_Employee.v_status :=0;
    if Frm_Employee.ShowModal = mrok then
    begin
      dm.ADS837.Close;
      dm.ADS837.Open;
      dm.ADS837.Locate('rkey',Frm_Employee.rkey837,[]);
      ShowMsg('新增操作成功!',1);
    end;
  finally
    Frm_Employee.Free;
  end;
end;

procedure TFrm_Main.check837status;
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,status from data0837 where rkey='+dm.ADS837rkey.AsString;
    Open;
    if IsEmpty then
    begin
      ShowMessage('此记录已经删除,请刷新');
      Abort;
    end;
    if FieldByName('status').Value<>DM.ADS837Status.Value then
    begin
      ShowMessage('此记录状态已经改变,请刷新');
      Abort;
    end;
  end;
end;

procedure TFrm_Main.N9Click(Sender: TObject);
begin
  if DM.ADS837.IsEmpty then
  Exit;
  check837status();
  try
    Frm_Employee := TFrm_Employee.Create(Application);
    Frm_Employee.v_status :=1;
    Frm_Employee.rkey837 := DM.ADS837rkey.Value;
    Frm_Employee.Edit1.Text := DM.ADS837EMPL_CODE.Value;
    Frm_Employee.Edit1.Tag := DM.ADS837Empl_ptr.Value;
    Frm_Employee.LabEmployee.Caption := DM.ADS837EMPLOYEE_NAME.Value;
    Frm_Employee.DateTimePicker3.Date := DM.ADS837WorkDate.Value;
    Frm_Employee.DateTimePicker1.Date := DM.ADS837BeginTime.Value;
    Frm_Employee.DateTimePicker2.Time :=DM.ADS837BeginTime.Value;
    if not DM.ADS837EndTime.IsNull then
    Frm_Employee.DBDateTimeEditEh1.Value := DM.ADS837EndTime.Value;
    Frm_Employee.Edt_timereset.Text := DM.ADS837TimeRest.AsString;
    Frm_Employee.Memo_Remark.Lines.Text := DM.ADS837Remark.Value;
    if Frm_Employee.ShowModal = mrok then
    begin
      BtnRefreshClick(Sender);
      dm.ADS837.Close;
      dm.ADS837.Open;
      dm.ADS837.Locate('rkey',Frm_Employee.rkey837,[]);
      ShowMsg('编辑操作成功!',1);
    end;

  finally
    Frm_Employee.Free;
  end;
end;

procedure TFrm_Main.N10Click(Sender: TObject);
begin
  if (strtoint(vprev)=1)  then
    messagedlg('对不起!您没有该程序的删除权限',mtinformation,[mbok],0)
  else
  if MessageDlg('您确定要删除该任务吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    try
      with DM.tmp do
      begin
        Close;
        SQL.Text := 'delete data0837 where data0837.rkey ='+dm.ADS837rkey.AsString;
        if ExecSQL>0 then
        begin
          common.ShowMsg('删除操作成功！',1);
          self.BtnRefreshClick(Sender);
        end;
      end;
    except
     on E: Exception do
     begin
       messagedlg(E.Message,mterror,[mbcancel],0);
     end;
    end;
  end;
end;

procedure TFrm_Main.N11Click(Sender: TObject);
var
  Endtime:TDateTime;
  rkey837:Integer;
begin
  if DM.ADS837.IsEmpty then
  Exit;
  Endtime := common.getsystem_date(DM.ADOQuery1,0);
  if (strtoint(vprev)in [2,3,4])=False then
  begin
    messagedlg('对不起,您没有结束雇员的权限！',mtinformation,[mbok],0)  ;
    Exit ;
  end;
  if  Endtime < DM.ADS837BeginTime.Value then
  begin
    ShowMessage('结束日期不能小于开始日期,请重新编辑开始日期！！！');
    Exit;
  end;
  if DM.ADS837Status.Value=7 then
  begin
    ShowMessage('本条记录已操作，请选择下一条');
    DM.ADS837.Next;
    Exit;
  end;
  if  Self.find_error(dm.ADS835rkey.Value,dm.ADS835Status.Value) then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;
  check837status();

  try
    DM.ADOConnection1.BeginTrans;
    with DM.tmp do
    begin
      Close;
      SQL.Text :='select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,data0832.MainExecStat,'+
                 ' Data0837.rkey, Data0837.Work_ptr, Data0837.WorkDate, Data0837.BeginTime,'+
                 ' Data0837.EndTime, Data0837.TimeCons, Data0837.TimeRest,'+
                 ' Data0837.Empl_ptr, Data0837.Status, Data0837.WorkTime, Data0837.Remark'+
                 ' from data0837 join data0005 on data0837.Empl_ptr=data0005.rkey '+
                 ' join data0832 on data0837.Status=data0832.rkey where Data0837.rkey='+dm.ADS837rkey.AsString;
      Open;

      Edit;
      FieldByName('EndTime').Value := Endtime;
      FieldByName('status').Value := 7;

  //    FieldByName('WorkTime').Value := MinutesBetween(DM.ADS842BeginTime.Value,Endtime)/60.0-FieldByName('TimeRest').Value;
  //    Post;
      DM.QryResultTime.Close;
      DM.QryResultTime.Parameters.ParamByName('vbeginTime').Value:=DM.ADS837BeginTime.Value;
      DM.QryResultTime.Parameters.ParamByName('vEndTime').Value:=Endtime;
      DM.QryResultTime.Open;
      FieldByName('TimeRest').Value:= DM.QryResultTime.FieldList[0].Value;
      FieldByName('WorkTime').Value := MinutesBetween(DM.ADS837BeginTime.Value,Endtime)/60.0-DM.QryResultTime.FieldList[0].Value;
      Post;
    end;
    DM.ADOConnection1.CommitTrans;
    rkey837 := DM.ADS837rkey.Value;
    DM.ADS837.Close;
    DM.ADS837.Open;
    DM.ADS837.Locate('rkey',rkey837,[]);
  except
    on E:Exception do
    begin
      ShowMessage('提交失败！'+#13#10+e.Message);
      DM.ADOConnection1.RollbackTrans;
    end;
  end;
end;

procedure TFrm_Main.N4Click(Sender: TObject);
var
  worktime:TDateTime;
begin
  if (strtoint(vprev)in [2,3,4])=False then
  begin
    messagedlg('对不起,您没有提交验收的权限！',mtinformation,[mbok],0)  ;
    Exit ;
  end;
  if  Self.find_error(dm.ADS835rkey.Value,dm.ADS835Status.Value) then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;

  if not (DM.ADS835.IsEmpty) then
  begin
    with DM.ADS837 do
    begin
      First;
      while not Eof do
      begin
        if FieldByName('Status').AsInteger=3 then
        begin
          ShowMessage('当前工作单还存在状态是“执行中”的雇员记录！！！');
          Exit;
        end;
        Next;
      end;
    end;
  end;
  
  if messagebox(Self.Handle,'你确定要提交验收吗？','询问',MB_yesno+MB_iconquestion)=idNo then
    Exit ;

  try
    DM.ADOConnection1.BeginTrans;
    with DM.tmp do
    begin
      Close;
      SQL.Text := 'select rkey,status,CompTime,ActuCons from data0835 where rkey='+dm.ADS835rkey.AsString;
      Open;
      Edit;
      FieldByName('status').Value := 4;
      FieldByName('CompTime').Value := getsystem_date(DM.ADOQuery1,0);

      worktime:=0;

      DM.ADOQuery1.Close;
      DM.ADOQuery1.SQL.Text:='select rkey,status,WorkTime,begintime,EndTime,TimeRest from data0837 where data0837.work_ptr ='+dm.ADS835rkey.AsString;
      DM.ADOQuery1.Open;
      DM.ADOQuery1.First;
      while not DM.ADOQuery1.Eof do
      begin
        if DM.ADOQuery1.FieldByName('WorkTime').Value>0  then    //工作时间
          worktime:= worktime+ DM.ADOQuery1.FieldByName('WorkTime').Value
        else if   DM.ADOQuery1.FieldByName('WorkTime').Value =null then
          worktime := worktime + HoursBetween(dm.ADOQuery1.FieldByName('begintime').Value,dm.ADOQuery1.FieldByName('EndTime').Value)-dm.ADOQuery1.FieldByName('TimeRest').Value;
        DM.ADOQuery1.Next;
      end;
      FieldByName('ActuCons').Value:=  worktime ;
      Post;
    end;
    with DM.tmp do
    begin
      Close;
      SQL.Text := 'insert into data0839(TableName, User_ptr, Status_ptr, Record_date,Record_rkey) values(''data0835'','+
      QuotedStr(rkey73)+',4,'+QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',getsystem_date(DM.ADOQuery1,0)))+','+dm.ADS835rkey.AsString+')';
      ExecSQL;
    end;
    DM.ADOConnection1.CommitTrans;
    BtnRefreshClick(Sender);
  except
    on E:Exception do
    begin
      messagedlg(E.Message,mterror,[mbcancel],0);
      dm.ADOConnection1.RollbackTrans;
    end;
  end
end;

procedure TFrm_Main.N5Click(Sender: TObject);
begin
  if (strtoint(vprev)in [2,3,4])=False then
  begin
    messagedlg('对不起,您没有提交验收的权限！',mtinformation,[mbok],0)  ;
    Exit ;
  end;
  if  Self.find_error(dm.ADS835rkey.Value,dm.ADS835Status.Value) then
  begin
    ShowMessage('状态已经改变，请刷新');
    Exit;
  end;
  if messagebox(Self.Handle,'你确定要验收通过吗？','询问',MB_yesno+MB_iconquestion)=idNo then
    Exit ;
  try
    DM.ADOConnection1.BeginTrans;
    with dm.tmp do
    begin
      Close;
      SQL.Text :='update data0835 set status=2,AcceTime='+ QuotedStr(FormatDateTime('yyyy-MM-dd HH:mm:ss',getsystem_date(DM.ADOQuery1,0)))
      +',AccePeop= '+rkey73+ ' where rkey='+dm.ADS835rkey.AsString;
      ExecSQL;

      Close;
      SQL.Text := 'insert into data0839(TableName, User_ptr, Status_ptr, Record_date,Record_rkey) values(''data0835'','+
      QuotedStr(rkey73)+',2,'+QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',getsystem_date(DM.ADOQuery1,0)))+','+dm.ADS835rkey.AsString+')';
      ExecSQL;
    end;
    DM.ADOConnection1.CommitTrans;
    BtnRefreshClick(Sender);
  except
    on e:Exception do
    begin
      messagedlg(E.Message,mterror,[mbcancel],0);
      DM.ADOConnection1.CommitTrans;
    end;
  end;
end;

procedure TFrm_Main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled := (StrToInt(vprev)in [2,3,4]) ;
  N2.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS835Status.Value in [1]);
  N3.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS835Status.Value in [1]);
  N4.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS835Status.Value in [3]);
  N5.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS835Status.Value in [4]);
end;

procedure TFrm_Main.PopupMenu2Popup(Sender: TObject);
begin
  N12.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS835Status.Value in [3]);
  N8.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS835Status.Value in [3]);
  N9.Enabled := (StrToInt(vprev)in [4]) and (DM.ADS835Status.Value in [2,3,4]);
  N10.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS837Status.Value in [3]);
  N11.Enabled := (StrToInt(vprev)in [2,3,4]) and (DM.ADS837Status.Value in [3]);
end;

procedure TFrm_Main.BitBtn15Click(Sender: TObject);
begin
  if  Assigned(frm_ProjectTime)=False then
    frm_ProjectTime := Tfrm_ProjectTime.Create(Application);
  frm_ProjectTime.ShowModal;
  inc(clickNum);    //clickNum 为点击次数，第一次点击的时候加载默认sql

end;

end.




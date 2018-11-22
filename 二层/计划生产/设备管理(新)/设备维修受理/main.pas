unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGridEh, Menus,
  DBGrids;

type
  Tfrm_main = class(TForm)
    Panel1: TPanel;
    BtnClose: TBitBtn;
    BtnRefresh: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BtnQuery: TBitBtn;
    BtnFieldsVisable: TBitBtn;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Panel4: TPanel;
    BtnAdd: TButton;
    BtnEdit: TButton;
    Btndelete: TButton;
    BtnPersonEnd: TButton;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    Label2: TLabel;
    edt_number: TEdit;
    Label3: TLabel;
    Edt_DEPT_NAME: TEdit;
    Label5: TLabel;
    edt_FASSET_CODE: TEdit;
    Label6: TLabel;
    Edt_FASSET_PTR: TEdit;
    Label7: TLabel;
    edt_EquiType: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edt_V_stat: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label28: TLabel;
    Label26: TLabel;
    Label29: TLabel;
    Edt_EMPLOYEE_NAME: TEdit;
    Edt_ent_date: TEdit;
    Edt_failure_date: TEdit;
    Edt_failure_grade: TEdit;
    Edt_failure_degree: TEdit;
    edt_PLACE: TEdit;
    Memo_failure_circs: TMemo;
    Label27: TLabel;
    Label10: TLabel;
    edt_abbr_name: TEdit;
    Label39: TLabel;
    Edt_FaultName: TEdit;
    Label42: TLabel;
    Label44: TLabel;
    Label32: TLabel;
    Label30: TLabel;
    Label13: TLabel;
    Label31: TLabel;
    Label40: TLabel;
    Edt_disposal_emplname: TEdit;
    Edt_disposal_date: TEdit;
    Edt_maintain_empl: TEdit;
    Memo_maintain_text: TMemo;
    Cbb_fail_type: TComboBox;
    Edt_stdDate: TEdit;
    Edt_Location: TEdit;
    Label43: TLabel;
    Label45: TLabel;
    Label41: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label38: TLabel;
    Label15: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Edt_completion_emplname: TEdit;
    Edt_complete_date: TEdit;
    Edt_AchiRate: TEdit;
    Edt_stop_house: TEdit;
    Edt_maintain_house: TEdit;
    Edt_Staff_Sum_house: TEdit;
    Edt_validate_emplname: TEdit;
    Edt_validate_date: TEdit;
    Memo_validate_appraise: TMemo;
    Memo_validate_Description: TMemo;
    Panel5: TPanel;
    CheckBox8: TCheckBox;
    DBGrid1: TDBGrid;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    Label21: TLabel;
    Edit2: TEdit;
    UpDown1: TUpDown;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label14: TLabel;
    DateTimePicker2: TDateTimePicker;
    N19: TMenuItem;
    N20: TMenuItem;
    StatusBar1: TStatusBar;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFieldsVisableClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure Cbb_fail_typeExit(Sender: TObject);
    procedure Memo_maintain_textExit(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtndeleteClick(Sender: TObject);
    procedure BtnPersonEndClick(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Edt_maintain_emplExit(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
  private
    PreColumn:TColumnEh;
    empl_code,empl_name:string;
    RK419:Integer;
    strStatusValue,ssql,sql_text : string;
    procedure CancelAcceptance(vEmployeeRkey,vUsernameRkey,vUser_rights:string);
    procedure Exec_EndPause(vEmployeeRkey,vUsernameRkey:string);
    procedure Exec_CompleteWork(vUsernameRkey,vEmployeeRkey,vUser_rights:string);
    procedure Exec_CancelWork(vUsernameRkey,vEmployeeRkey,vUser_rights:string);
    procedure CheckEditNull();
    procedure check842status();
    procedure CheckTime();
    procedure Assignment(Endtime:TDateTime);
//    procedure ModifyTimeRest();
    function find_error(v_rkey,v_status:Integer):Boolean;
    { Private declarations }
  public
    strsql:string;
    clickNum,QueryClick:Integer;
    function  EmployeeStatusCheck(vEmpl_ptr:string;out vNUMBER:string):Boolean;
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses damo,common,DB,ComObj, Excel97, QuerySet, formResetUsername, Edit, formInputDlg,
  unusual_cate, TimeQuery,StrUtils,DateUtils, Pause, Recordt
  , ColsDisplaySet_unt, form_msg;

{$R *.dfm}

procedure Tfrm_main.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
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
// vprev := '4'
end;



procedure Tfrm_main.FormShow(Sender: TObject);
//var
//  i:Integer;
//  item:TMenuItem;
begin
  PreColumn := DBGridEh1.Columns[0];
   
  with DM.tmp do
  begin
    Close;
    SQL.Text:='select * from data0419 where programe='+QuotedStr(Extractfilename(application.exename));
    Open;
    if not IsEmpty then
      Rk419:=FieldByName('rkey').AsInteger
    else
      Rk419:=-1;//2570;
  end;
  sql_text := DM.ADS567.CommandText;
  clickNum :=0;
  QueryClick :=0;
  DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)-7;
  DateTimePicker2.Date := common.getsystem_date(dm.tmp,0);
  strStatusValue :=' and data0567.status in (1,2,3,6) ';
  DM.ADS567.Close;
  dm.ADS567.CommandText := sql_text+strStatusValue+ssql+' and (data0567.failure_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0567.failure_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+')';
  DM.ADS567.Open;
  DM.ADS842.Open;
  PageControl1.ActivePage := TabSheet1;

   StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS567.RecNo)+'/总记录数:'+ IntToStr(DM.ADS567.RecordCount);
  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select EMPLOYEE_PTR,USER_FULL_NAME,USER_LOGIN_NAME from data0073 where  rkey='+rkey73;
    Open;
//    user_ptr:=Fields[0].AsString;
    StatusBar1.Panels[1].Text:='用户名：'+trim(FieldValues['USER_FULL_NAME'])+' ('+trim(FieldValues['USER_LOGIN_NAME'])+')';
//    Log_USER_FULL_NAME:=FieldValues['USER_FULL_NAME'];
//    Log_USER_LOGIN_NAME:=FieldValues['USER_LOGIN_NAME'];
    Close;
  end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='select empl_code,EMPLOYEE_NAME from data0005 '+
             'where rkey='+user_ptr;
    Open;
    self.empl_code:=fieldbyname('empl_code').AsString;
    self.empl_name:=fieldbyname('EMPLOYEE_NAME').AsString;
  end;
  ResetGridColumns(Self,DM.ADOConnection1,StrToInt(rkey73),StrToInt(vprev)=2);
  DBGridEh1.FrozenCols :=5;
end;

procedure Tfrm_main.BtnFieldsVisableClick(Sender: TObject);
begin
    show_ColsDisplaySet_frm (Self,DBGridEh1,StrToInt(rkey73)) ;
end;

procedure Tfrm_main.BtnRefreshClick(Sender: TObject);
var
  rkey567:integer;
begin
  rkey567 := DM.ADS567RKEY.Value;
  dm.ADS567.Close;
  dm.ADS567.Prepared;
  dm.ADS567.Open;
  if rkey567>0 then
  dm.ADS567.Locate('rkey',rkey567,[]);
end;

procedure Tfrm_main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS567.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;



procedure Tfrm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (Column.Title.SortMarker = smDownEh) or (Column.Title.SortMarker = smNoneEh) then
  begin
    Column.Title.SortMarker := smUpEh;
    DM.ADS567.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    DM.ADS567.IndexFieldNames := Column.FieldName+' DESC';
  end;
 
  if(PreColumn.FieldName<>Column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    Label1.Caption := Column.Title.Caption;
    Edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clRed;
    PreColumn := Column;
  end
  else
  Edit1.SetFocus;
end;

procedure Tfrm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(DM.ADS567.CommandText);
end;

procedure Tfrm_main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if dm.ADS567STATUS.Value = 2 then
    DBGridEh1.Canvas.Font.Color := clred
  else
  if dm.ADS567STATUS.Value = 1 then
    DBGridEh1.Canvas.Font.Color := clTeal //cllime
  else
  if dm.ADS567STATUS.Value = 0 then
    DBGridEh1.Canvas.Font.Color := clfuchsia
  else
  if dm.ADS567STATUS.Value = 3 then
  DBGridEh1.Canvas.Font.Color := clGreen;

  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_main.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(DM.ADS842.CommandText);
end;

procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure Tfrm_main.CheckBox1Click(Sender: TObject);
begin
  strStatusValue :='';
  if CheckBox1.Checked then
    strStatusValue := '0,';
  if CheckBox2.Checked then
    strStatusValue:=strStatusValue+'1,';
  if CheckBox3.Checked then
    strStatusValue:=strStatusValue+'2,';
  if CheckBox4.Checked then
    strStatusValue:=strStatusValue+'3,';
  if CheckBox5.Checked then
    strStatusValue:=strStatusValue+'4,';
  if CheckBox6.Checked then
    strStatusValue:=strStatusValue+'5,';
  if CheckBox7.Checked then
    strStatusValue:=strStatusValue+'6,';

  if strStatusValue <> '' then
    strStatusValue := ' and Data0567.status in ('+copy(strStatusValue,0,Length(strStatusValue)-1)+')'+#13
  else
    strStatusValue := ' and Data0567.status in (9)'+#13;

  With DM.ADS567 do
  begin
    Close;
    dm.ADS567.CommandText := sql_text+strStatusValue+ssql+' and (data0567.failure_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0567.failure_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+')';;
    Open;
  end;
end;

procedure Tfrm_main.BtnQueryClick(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySet.ShowModal=mrok then
  begin
    dm.ADS567.Close;
    dm.ADS567.CommandText := sql_text;
    ssql:='';
    for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
    ssql := ssql+ frmQuerySet.SGrid1.Cells[2,i]+#13;
    dm.ADS567.CommandText := sql_text+strStatusValue+ssql+' and (data0567.failure_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0567.failure_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+')';
    dm.ADS567.Open;
  end;

end;

procedure Tfrm_main.PageControl1Change(Sender: TObject);
begin
  BtnRefresh.Click;
  if (PageControl1.ActivePageIndex=1) and (not DM.ADs567.IsEmpty) and(CheckBox8.Checked) then
  begin
    DM.ADs468.Close;
    DM.ADs468.Parameters[0].Value:=DM.ADS567RKEY.Value;
    DM.ADs468.Open;
  end;
  edt_number.Text := DM.ADS567NUMBER.Value;
  Edt_DEPT_NAME.Text := DM.ADS567DEPT_NAME.Value;
  edt_FASSET_CODE.Text := DM.ADS567FASSET_CODE.Value;
  Edt_FASSET_PTR.Text := DM.ADS567FASSET_NAME.Value;
  edt_EquiType.Text := DM.ADS567EquiType.Value;
  edt_PLACE.Text := DM.ADS567PLACE.Value;
  Edt_EMPLOYEE_NAME.Text := DM.ADS567EMPLOYEE_NAME.Value;
  Edt_ent_date.Text := DM.ADS567ent_date.AsString;
  Edt_failure_date.Text := DM.ADS567failure_dat.AsString;
  Edt_failure_grade.Text := DM.ADS567failure_grade.Value;
  Memo_failure_circs.Text := DM.ADS567failure_circs.Value;
  edt_abbr_name.Text := DM.ADS567abbr_name.Value;
  Edt_failure_degree.Text := DM.ADS567failure_degree.Value;
  Edt_FaultName.Text := DM.ADS567FaultName.Value;
  edt_V_stat.Text := DM.ADS567V_stat.Value;
  Edt_disposal_emplname.Text := DM.ADS567disposal_emplname.Value;
  Edt_maintain_empl.Text := DM.ADS567maintain_empl.Value;
  Edt_stdDate.Text := DM.ADS567stdDate.AsString;
  Edt_Location.Text := DM.ADS567Location.Value;
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'SELECT rkey,unusual_cate FROM DATA0043';
    Open;
    First;
  end;
  Cbb_fail_type.Items.Clear;
  while not DM.tmp.Eof do
  begin
    Cbb_fail_type.Items.AddObject(DM.tmp.FieldValues['unusual_cate'],Pointer(DM.tmp.FieldByName('rkey').asinteger));
    DM.tmp.Next;
  end;
  Cbb_fail_type.ItemIndex := Cbb_fail_type.Items.IndexOf(DM.ADS567fail_type.Value);
 // Cbb_fail_type.Text := DM.ADS567fail_type.Value;
  Edt_disposal_date.Text :=DM.ADS567disposal_date.AsString;
  Memo_maintain_text.Lines.Text := DM.ADS567maintain_text.Value;
  Edt_completion_emplname.Text := DM.ADS567completion_emplname.Value;
  Edt_complete_date.Text := DM.ADS567complete_date.AsString;
  Edt_stop_house.Text := DM.ADS567stop_house.AsString;
  Edt_maintain_house.Text := DM.ADS567maintain_house.AsString;
  Edt_Staff_Sum_house.Text := DM.ADS567Staff_Sum_house.AsString;
  if (dm.ADS567Staff_Sum_house.AsFloat <>0) and (Edt_stdDate.Text <> '')then
    Edt_AchiRate.Text :=FormatFloat('0.00',DM.ADS567stdDate.Value/dm.ADS567Staff_Sum_house.AsFloat*100)+'%'
  else
    Edt_AchiRate.Text := '';
  Edt_validate_emplname.Text := DM.ADS567validate_emplname.Value;
  Edt_validate_date.Text := DM.ADS567validate_date.AsString;
  Memo_validate_appraise.Text := DM.ADS567validate_appraise.Value;
  Memo_validate_Description.Text := DM.ADS567validate_Description.Value;
end;

procedure Tfrm_main.CheckBox8Click(Sender: TObject);
begin
  with DM.ADS468 do
  if  CheckBox8.Checked then
  begin
    if Parameters.ParamByName('vd567_ptr').Value<>DM.ADS567RKEY.Value then
    begin
      Close;
      Parameters.ParamByName('vd567_ptr').Value:=DM.ADS567RKEY.Value;
      Open;
    end
    else
      Open;
  end
  else
    Close;
end;

procedure Tfrm_main.Cbb_fail_typeExit(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,fail_type from data0567 where rkey='+dm.ADS567RKEY.AsString;
    Open;
    Edit;
    FieldByName('fail_type').Value := Cbb_fail_type.Text;
    Post;
  end;
  
end;

procedure Tfrm_main.Memo_maintain_textExit(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,maintain_text from data0567 where rkey='+dm.ADS567RKEY.AsString;
    Open;
    Edit;
    FieldByName('maintain_text').Value := Memo_maintain_text.Lines.Text;
    Post;
  end;

end;

procedure Tfrm_main.Edt_maintain_emplExit(Sender: TObject);
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,maintain_empl from data0567 where rkey='+dm.ADS567RKEY.AsString;
    Open;
    Edit;
    FieldByName('maintain_empl').Value := Edt_maintain_empl.Text;
    Post;
  end;
end;

function Tfrm_main.EmployeeStatusCheck(vEmpl_ptr: string;
  out vNUMBER: string): Boolean;
begin
  Result:=False;
  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select NUMBER from data0842 join data0567 on data0842.work_ptr=data0567.rkey where data0842.empl_ptr='
      +vEmpl_ptr+' and data0842.status=3';
    Open;
    if IsEmpty=False then         //如果该雇员存在未完成的记录，返回值为真
    begin
      ShowMessage('你在维修单：“'+FieldByName('NUMBER').AsString+'”中有执行中的状态！！！') ;
      Result:=True;
    end;

    Close;
    SQL.Clear;
    SQL.Text:='select CONVERT(varchar(100),PlanMainDate, 23)+'' ''+DeviNumb+'' ''+MainCycl as NUMBER'
         +' from data0831 join data0848 on data0848.work_ptr=data0831.rkey '
         +' where data0848.empl_ptr='+vEmpl_ptr+' and data0848.[status]=3';
    Open;
    if IsEmpty=False then         //如果该雇员存在未完成的记录，返回值为真
    begin
      ShowMessage('你在保养单：“'+FieldByName('NUMBER').AsString+'”中有执行中的状态！！！') ;
      Result:=True;
    end;
  end;
end;

procedure Tfrm_main.BtnAddClick(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights,vNUMBER:string;
begin
  check842status();
  if DM.ADS567STATUS.Value <> 2 then
  begin
    ShowMessage('不是已受理状态');
    Exit;
  end;


  if ShowResetUsernameForm(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'输入用户名和密码') then
  begin
    if (strtoint(vUser_rights)in [2,3,4])=False then
    begin
      messagedlg('对不起,您没有添加雇员的权限！',mtinformation,[mbok],0)  ;
      Exit ;
    end;
    if EmployeeStatusCheck(vEmployeeRkey,vNUMBER) then
    begin
      Exit;
    end;

    if DM.ADS842.IsEmpty=False then
    with DM.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey  from data0842 where Work_ptr='+dm.ADS842Work_ptr.AsString
      +' and  WorkDate=CONVERT(VARCHAR(10),GETDATE(),120) and Empl_ptr='+vEmployeeRkey+' and EndTime>=getDate()' ;
      Open;

      if IsEmpty=False then
      begin
        ShowMessage('你今天在本维修单已存在工作记录，本次的开始时间不能小于'+#13+'或等于上次的结束时间，因此无法添加！！！');
        Exit;
      end;
    end;
    try
//      frm_Edit := Tfrm_Edit.Create(Application);
//      frm_Edit.v_state := 0;
//      frm_Edit.transferEmployeeRkey(vEmployeeRkey);
//      frm_Edit.DateTimePicker1.DateTime := common.getsystem_date(DM.tmp,0);
//      frm_Edit.DateTimePicker2.DateTime := common.getsystem_date(DM.tmp,0);
//      frm_Edit.Edt_timereset.Text := '0';
////      frm_Edit.Edt_DayShift.Text := '1';
//      if frm_Edit.ShowModal=mrok then
//      begin
//        DM.ADS842.Close;
//        DM.ADS842.Open;
//        DM.ADS842.Locate('rkey',frm_Edit.rkey842,[]);
//        ShowMessage('新增操作成功');
//      end;
      with DM.tmp do
      begin
        Close;                                              //自动添加维修受理的维修人员记录。
        SQL.Text:='insert into data0842(Work_ptr,WorkDate,BeginTime,Empl_ptr,Status)values('
        +DM.ADS567RKEY.AsString+',CONVERT(VARCHAR(10),GETDATE(),120),'
        + QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',getsystem_date(DM.ADOQuery1,0)))
        +','+vEmployeeRkey+','+'3' +')' ;
        ExecSQL;
        ShowMessage('新增操作成功');
      end;
    finally
      BtnRefreshClick(Sender);
    end;
  end;
end;

procedure Tfrm_main.check842status;
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,status from data0842 where rkey='+dm.ADS842rkey.AsString;
    Open;
    if IsEmpty then
    begin
      ShowMessage('此记录已经删除,请刷新');
      Abort;
    end;
    if FieldByName('status').Value<>DM.ADS842Status.Value then
    begin
      ShowMessage('此记录状态已经改变,请刷新');
      Abort;
    end;
  end;
end;

procedure Tfrm_main.BtnEditClick(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  if DM.ADS842.IsEmpty then
  Exit;
  check842status();
  if ShowResetUsernameForm(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'编辑',
          dm.ADS842EMPL_CODE.Value) then
  begin
    if (strtoint(vUser_rights)in [4])=False then
    begin
      messagedlg('对不起,您没有权限！',mtinformation,[mbok],0)  ;
      Exit ;
    end;
//    if DM.ADS842Empl_ptr.AsInteger <> StrToInt(vEmployeeRkey )then
//    begin
//      messagedlg('对不起,您只能操作自己的工时记录！',mtinformation,[mbok],0)  ;
//      Exit ;
//    end;
    try
      frm_Edit := Tfrm_Edit.Create(Application);
      frm_Edit.v_state := 1;
    //    frm_Edit.transferEmployeeRkey(vEmployeeRkey);
      frm_Edit.rkey842 := DM.ADS842rkey.Value;
      frm_Edit.DateTimePicker1.Date := DM.ADS842BeginTime.Value;
      frm_Edit.DateTimePicker2.Time := DM.ADS842BeginTime.Value;

      frm_Edit.Edt_timereset.Text := DM.ADS842TimeRest.AsString;
//      frm_Edit.Edt_DayShift.Text := DM.ADS842DayShift.AsString;
      frm_Edit.Memo_Remark.Lines.Text := DM.ADS842Remark.Value;
      if frm_Edit.ShowModal=mrok then
      begin
        DM.ADS842.Close;
        DM.ADS842.Open;
        DM.ADS842.Locate('rkey',frm_Edit.rkey842,[]);
        ShowMessage('编辑操作成功');
      end;
    finally
      frm_Edit.Free;
    end;
  end;
end;

procedure Tfrm_main.BtndeleteClick(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights,emplcode:string;
  UniqueRecord:Boolean;
begin
  UniqueRecord:=False;
  with DM.ADS842 do
  if (Active)and( not IsEmpty) then
  begin
    if recordcount=1 then
    begin
      if  messagedlg('唯一保养人即将删除，你确定将维修单将退回到待受理状态吗?',mtconfirmation,[mbyes,mbcancel],0)=mrCancel then
      begin
        Exit;
      end
      else
      begin
        UniqueRecord:=True;
      end;
    end;
    check842status();
    if ShowResetUsernameForm(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'删除',
          dm.ADS842EMPL_CODE.Value) then
    begin
      if (strtoint(vUser_rights)in [2,3,4])=False then
      begin
        messagedlg('对不起,您没有权限！',mtinformation,[mbok],0)  ;
        Exit ;
      end;
      if DM.ADS842Empl_ptr.AsInteger<> StrToInt(vEmployeeRkey )then
      begin
        messagedlg('对不起,您只能操作自己的工时记录！',mtinformation,[mbok],0)  ;
        Exit ;
      end;

      with DM.tmp do
      begin
        Close;
        SQL.Text := 'select data0567.maintain_empl,data0567.disposal_emplptr,data0567.fail_type,DATA0567.disposal_date,'+
             'DATA0567.maintain_text,Data0842.rkey, Data0842.Work_ptr, Data0842.WorkDate, Data0842.BeginTime,'+
             'Data0842.EndTime, Data0842.TimeCons, Data0842.TimeRest, Data0842.Empl_ptr,'+
             'Data0842.Status, Data0842.WorkTime, Data0842.Remark, Data0842.DayShift,'+
             'data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,MainexecStat,data0567.status as d567_status'+#13+
             'from Data0842 left join data0005 on Data0842.Empl_ptr=data0005.rkey '+
             'join data0832 on Data0842.Status=data0832.rkey inner join data0567 on '+
             'dbo.Data0842.Work_ptr = dbo.DATA0567.RKEY where data0842.rkey ='+dm.ADS842rkey.AsString;
//             +' and data0842.Work_ptr='+dm.ADS567RKEY.AsString;
        Open;
        if UniqueRecord then
        begin
          Edit;
          FieldByName('Status').Value := 1;
          FieldByName('d567_status').Value:= 1;
          FieldByName('maintain_empl').Value:= '';
          FieldByName('disposal_emplptr').Value:=null;
          FieldByName('fail_type').Value:='';
          FieldByName('disposal_date').Value:=null ;
          FieldByName('maintain_text').Value:='';
          Post;
        end;

        Close;
        SQL.Text := 'delete data0842 where rkey ='+dm.ADS842rkey.AsString;
        if ExecSQL>0 then
        begin
          common.ShowMsg('删除操作成功！',1);
//2018-8-27tang
            DM.tmp.Close;
            DM.tmp.SQL.Text := 'select Data0842.rkey,Data0842.work_ptr,data0005.EMPL_CODE,data0005.EMPLOYEE_NAME'+
             ' from Data0842 left join data0005 on Data0842.Empl_ptr=data0005.rkey where Data0842.work_ptr='+dm.ADS567RKEY.AsString;
            DM.tmp.Open;
            emplcode := '';
            DM.tmp.First;
            while not DM.tmp.Eof do
            begin
              if Pos(DM.tmp.FieldByName('EMPLOYEE_NAME').Value,emplcode)<1 then
              begin
                emplcode := emplcode+ DM.tmp.FieldByName('EMPLOYEE_NAME').Value+',';
              end;
              DM.tmp.Next;
            end;
            emplcode := Copy(emplcode,1,Length(emplcode)-1);
            DM.ADOQuery1.Close;
            DM.ADOQuery1.SQL.Text := 'select rkey,maintain_empl from data0567 where rkey='+  dm.ADS567RKEY.AsString;
            DM.ADOQuery1.Open;
            DM.ADOQuery1.Edit;
            DM.ADOQuery1.FieldByName('maintain_empl').Value:=emplcode;
            DM.ADOQuery1.Post;
//end 2018-8-27
        end;
        self.BtnRefreshClick(Sender);
      end;
    end;
  end;
end;

procedure Tfrm_main.CheckEditNull;
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,fail_type,maintain_text from data0567 where rkey ='+ DM.ADS567RKEY.AsString;
    Open;
  end;

//  if DM.tmp.FieldByName('fail_type').Value=null then
//  begin
//    messagedlg('对不起,请选择异常类别!',mtinformation,[mbok],0);
//    PageControl1.TabIndex:=1;
//    PageControl1Change(Self);
//    Abort;
//  end;
  if Cbb_fail_type.ItemIndex=-1 then
  begin
    messagedlg('对不起,请选择异常类别!',mtinformation,[mbok],0);
    PageControl1.TabIndex:=1;
    PageControl1Change(Self);
    Abort;
  end;
  
  if DM.tmp.FieldByName('maintain_text').AsString='' then
  begin
    messagedlg('对不起,请输入维修记录!',mtinformation,[mbok],0);
    PageControl1.TabIndex:=1;
    PageControl1Change(Self);
//    Memo_maintain_text.SetFocus;
    Abort;
  end;
end;

procedure Tfrm_main.CheckTime;
var
  BeginTime,endTime,S:Integer;
  NowDate:TDateTime;
begin
  NowDate := common.getsystem_date(DM.tmp,0);
  if (DM.ADS842BeginTime.IsNull=False) then
    BeginTime:= HourOf(DM.ADS842BeginTime.AsDateTime)
  else
    BeginTime := HourOf(NowDate);
  if (DM.ADS842EndTime.IsNull=False) then
    endTime:= HourOf(DM.ADS842EndTime.AsDateTime)
  else
    endTime:= HourOf(NowDate);

  if ((BeginTime<8) and  (endTime>=8))or(MinutesBetween(DM.ADS842BeginTime.Value,NowDate)>720) then
  begin
    S:=Show_Msg(Self,'请重新确认你的班次',['']);
    with DM.tmp do
    begin
      Close;
      SQL.Text :='select  Data0842.rkey, Data0842.Work_ptr, Data0842.WorkDate, Data0842.BeginTime,'+
       'Data0842.EndTime, Data0842.TimeCons, Data0842.TimeRest, Data0842.Empl_ptr,'+
       'Data0842.Status, Data0842.WorkTime, Data0842.Remark, Data0842.DayShift,'+
      ' data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,MainexecStat '+
       'from    Data0842 left join data0005 on Data0842.Empl_ptr=data0005.rkey'+
       ' join data0832 on Data0842.Status=data0832.rkey where data0842.rkey='+dm.ADS842rkey.AsString;
      Open;
    end;
    if s=1 then
      begin
        DM.tmp.Edit;
        DM.tmp.FieldByName('DayShift').Value := 1;
        DM.tmp.Post;
      end
    else
    if  S=2 then
      begin
        DM.tmp.Edit;
        DM.tmp.FieldByName('DayShift').Value := 2;
        DM.tmp.Post;
      end
    else
      Abort;
  end;
end;

//procedure Tfrm_main.ModifyTimeRest;
//var
//  Endtime:TDateTime;
//begin
//  Endtime:= getsystem_date(DM.tmp,0);
//  if MinutesBetween(DM.ADS842BeginTime.Value,Endtime)/60.0<DM.ADS842TimeRest.Value then
//  begin
//    ShowMessage('总共耗时小于休息时间，休息时间自动变为0');
//    with DM.tmp do
//    begin
//      Close;
//      SQL.Text := 'select  Data0842.rkey, Data0842.Work_ptr, Data0842.WorkDate, Data0842.BeginTime,'+
//       'Data0842.EndTime, Data0842.TimeCons, Data0842.TimeRest, Data0842.Empl_ptr,'+
//       'Data0842.Status, Data0842.WorkTime, Data0842.Remark, Data0842.DayShift,'+
//       'data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,MainexecStat'+#13+
//       'from Data0842 left join data0005 on Data0842.Empl_ptr=data0005.rkey '+
//       'join data0832 on Data0842.Status=data0832.rkey where data0842.rkey ='+dm.ADS842rkey.AsString;
//      Open;
//      Edit;
//      FieldByName('TimeRest').Value := 0;
//      Post;
//    end;
//  end;
//end;

procedure Tfrm_main.Assignment(Endtime:TDateTime);
var
  emplcode:string;
  rkey842:Integer;
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select  Data0842.rkey, Data0842.Work_ptr, Data0842.WorkDate, Data0842.BeginTime,'+
     'Data0842.EndTime, Data0842.TimeCons, Data0842.TimeRest, Data0842.Empl_ptr,'+
     'Data0842.Status, Data0842.WorkTime, Data0842.Remark, Data0842.DayShift,'+
     'data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,MainexecStat'+#13+
     'from Data0842 left join data0005 on Data0842.Empl_ptr=data0005.rkey '+
     'join data0832 on Data0842.Status=data0832.rkey where data0842.rkey ='+dm.ADS842rkey.AsString;
    Open;
    Edit;
    FieldByName('EndTime').Value := Endtime;
    FieldByName('status').Value := 7;
//    FieldByName('WorkTime').Value := HourOf(Endtime - DM.ADS842BeginTime.Value -dm.ADS842TimeRest.Value);
//    FieldByName('WorkTime').Value := MinutesBetween(DM.ADS842BeginTime.Value,Endtime)/60.0-dm.ADS842TimeRest.Value;
//    FieldByName('WorkTime').Value := MinutesBetween(DM.ADS842BeginTime.Value,Endtime)/60.0-FieldByName('TimeRest').Value;
    Post;
    rkey842 := DM.ADS842rkey.Value;
    DM.ADS842.Close;
    DM.ADS842.Open;
    DM.ADS842.Locate('rkey',rkey842,[]);
    DM.QryResultTime.Close;
    DM.QryResultTime.Parameters.ParamByName('vbeginTime').Value:=DM.ADS842BeginTime.Value;
    DM.QryResultTime.Parameters.ParamByName('vEndTime').Value:=DM.ADS842EndTime.Value;
    DM.QryResultTime.Open;
    Edit;
    FieldByName('TimeRest').Value:= DM.QryResultTime.FieldList[0].Value;
    Post;
    Edit;
    FieldByName('WorkTime').Value := MinutesBetween(DM.ADS842BeginTime.Value,Endtime)/60.0-FieldByName('TimeRest').Value;
    Post;
//    ShowMessage(DM.ADS842EndTime.AsString);
//    ShowMessage(DM.ADS842TimeRest.AsString);
  end;

//  ShowMessage(dm.ADS842EndTime.AsString);
  DM.tmp.Close;
  DM.tmp.SQL.Text := 'select Data0842.rkey,Data0842.work_ptr,data0005.EMPL_CODE,data0005.EMPLOYEE_NAME'+
   ' from Data0842 left join data0005 on Data0842.Empl_ptr=data0005.rkey where Data0842.work_ptr='+dm.ADS567RKEY.AsString;
  DM.tmp.Open;
  emplcode := '';
  DM.tmp.First;
  while not DM.tmp.Eof do
  begin
    if Pos(DM.tmp.FieldByName('EMPLOYEE_NAME').Value,emplcode)<1 then
    begin
      emplcode := emplcode+ DM.tmp.FieldByName('EMPLOYEE_NAME').Value+',';
    end;
    DM.tmp.Next;
  end;
  emplcode := Copy(emplcode,1,Length(emplcode)-1);
  DM.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text := 'select rkey,maintain_empl from data0567 where rkey='+  dm.ADS567RKEY.AsString;
  DM.ADOQuery1.Open;
  DM.ADOQuery1.Edit;
  DM.ADOQuery1.FieldByName('maintain_empl').Value:=emplcode;
  DM.ADOQuery1.Post;
end;

procedure Tfrm_main.BtnPersonEndClick(Sender: TObject);
var
  Endtime,worktime,maintaintime:TDateTime;
  rkey842:Integer;
  islast : Boolean;
  strReason,vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  if DM.ADS842.IsEmpty then
  Exit;
  Endtime := common.getsystem_date(DM.tmp,0);

  if  Endtime < DM.ADS842BeginTime.Value then
  begin
    ShowMessage('结束日期不能小于开始日期,请重新编辑开始日期！！！');
    Exit;
  end;
  if DM.ADS842Status.Value=7 then
  begin
    ShowMessage('本条记录已操作，请选择下一条');
    DM.ADS842.Next;
    Exit;
  end;
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,status from data0567 where rkey='+dm.ADS567RKEY.AsString;
    Open;
    if FieldByName('status').Value<>dm.ADS567STATUS.Value then
    begin
      ShowMessage('状态已经改变，请刷新');
      Exit;
    end;
  end;
  check842status();
  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from DATA0577 where rkey567='+dm.ADS567RKEY.AsString
             +' and stop_end_date>'+QuotedStr(FormatDateTime('yyyy-m-d h:n:s',Endtime)));
    Open;
    if IsEmpty=False then
    begin
      ShowMessage('暂停结束时间晚于当前系统时间！！！');
      Exit;
    end;
    Close;
    SQL.Text := 'select rkey,status from data0842 where data0842.work_ptr ='+dm.ADS567RKEY.AsString;
    Open;
    islast := True;
    First;
    while not Eof do
    begin
      if (DM.tmp.FieldByName('status').Value<>7) and (DM.tmp.FieldByName('rkey').Value <> DM.ADS842rkey.Value) then
      begin
        islast:=False;
        break;
      end;
      Next;
    end;
  end;

  try
    if islast=False then
    begin
      if ShowResetUsernameForm(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,
      '雇员维修记录结束',dm.ADS842EMPL_CODE.Value) then
      begin
        if (strtoint(vUser_rights)in [2,3,4])=False then
        begin
          messagedlg('对不起,您没有结束雇员的权限！',mtinformation,[mbok],0)  ;
          Exit ;
        end;
        if DM.ADS842Empl_ptr.AsInteger<> StrToInt(vEmployeeRkey )then
        begin
          messagedlg('对不起,您只能操作自己的工时记录！',mtinformation,[mbok],0)  ;
          Exit ;
        end;
        CheckTime();
        Assignment(Endtime);
//        ModifyTimeRest;
      end;
    end
    else
    begin
     // BtnRefreshClick(Sender);
      if messagedlg('这是最后一行状态是“执行中”的雇员记录，你要完工该维修受理单吗?'+#13
                 +'完工点YES，暂停点NO。',mtconfirmation,[mbyes,mbno],0)=mrYes then
      begin
        with DM.tmp do
        begin
          Close;
          SQL.Text := 'select rkey,fail_type,maintain_text from data0567 where rkey ='+ DM.ADS567RKEY.AsString;
          Open;
        end;
//        PageControl1.TabIndex:=1;
        rkey842 := DM.ADS842rkey.Value;
        PageControl1Change(Self);
        CheckEditNull();
        DM.ADS842.Locate('rkey',rkey842,[]);

//        if DM.ADS842Empl_ptr.AsInteger<> StrToInt(user_ptr )then
        if ShowResetUsernameForm(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'维修单完工',dm.ADS842EMPL_CODE.Value) then
        begin
          if (strtoint(vUser_rights)in [2,3,4])=False then
          begin
            messagedlg('对不起,您没有结束雇员的权限！',mtinformation,[mbok],0)  ;
            Exit ;
          end;
          if DM.ADS842Empl_ptr.AsInteger<> StrToInt(vEmployeeRkey )then
          begin
            messagedlg('对不起,您只能操作自己的工时记录！',mtinformation,[mbok],0);
            Exit ;
          end;
          CheckTime();
//          ModifyTimeRest;
          try
            DM.ADOConnection1.BeginTrans;
            Assignment(Endtime);
            with DM.tmp do
            begin
              Close;
              SQL.Text := 'select rkey,status,completion_emplptr,complete_date,maintain_house,Staff_Sum_house from data0567 where rkey='+dm.ADS567RKEY.AsString;
              Open;
              Edit;
              FieldByName('status').Value := 3;
              FieldByName('completion_emplptr').Value := DM.ADS842Empl_ptr.Value;
              FieldByName('complete_date').Value := Endtime;
              FieldByName('maintain_house').Value := HoursBetween(DM.ADS842BeginTime.Value,Endtime);
              worktime:=0;
              maintaintime:=0;
              DM.ADOQuery1.Close;
              DM.ADOQuery1.SQL.Text:='select rkey,status,WorkTime,begintime,EndTime,TimeRest from data0842 where data0842.work_ptr ='+dm.ADS567RKEY.AsString;
              DM.ADOQuery1.Open;
              DM.ADOQuery1.First;
              while not DM.ADOQuery1.Eof do
              begin
                if DM.ADOQuery1.FieldByName('WorkTime').Value>0  then    //工作时间
                  worktime:= worktime+ DM.ADOQuery1.FieldByName('WorkTime').Value
                else if   DM.ADOQuery1.FieldByName('WorkTime').Value =null then
                  worktime := worktime + HoursBetween(DM.ADS842BeginTime.Value,Endtime)-dm.ADOQuery1.FieldByName('TimeRest').Value;
                DM.ADOQuery1.Next;
              end;
              FieldByName('Staff_Sum_house').Value:=  worktime ;

              DM.ADOQuery1.First;
              while not DM.ADOQuery1.Eof do
              begin
                if DM.ADOQuery1.FieldByName('EndTime').Value<>null  then    //工作时间 MinutesBetween(DM.ADS842BeginTime.Value,Endtime)/60.0
                maintaintime:= maintaintime+ (MinutesBetween(DM.ADOQuery1.FieldByName('begintime').Value,DM.ADOQuery1.FieldByName('EndTime').Value)/60.0);
                DM.ADOQuery1.Next;
              end;
              FieldByName('maintain_house').Value:=  maintaintime ;
              Post;

            end;
            with  DM.tmp do            //在DATA0841表添加一行改变状态的记录。
            begin
              Close;
              SQL.Text:='insert into dbo.DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date)'
                    +'values('+DM.ADS567RKEY.AsString+','+vUsernameRkey+','+'3'+','
                    +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',Endtime))+')';
              ExecSQL;
            end;
            DM.ADOConnection1.CommitTrans;

          except
            on e:Exception do
            begin
              DM.ADOConnection1.RollbackTrans;
              ShowMessage('提交失败！'+#13#10+e.Message);
            end;
          end;
        end;
      end
      else
      begin
        if InputDlg(Self.Handle,'暂停','输入暂停原因',strReason) then
        begin
          if ShowResetUsernameForm(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,
          '维修单暂停',dm.ADS842EMPL_CODE.Value) then
          begin
            if (strtoint(vUser_rights)in [2,3,4])=False then
            begin
              messagedlg('对不起,您没有结束雇员的权限！',mtinformation,[mbok],0)  ;
              Exit ;
            end;
            if DM.ADS842Empl_ptr.AsInteger<> StrToInt(vEmployeeRkey )then
            begin
              messagedlg('对不起,您只能操作自己的工时记录！',mtinformation,[mbok],0)  ;
              Exit ;
            end;
            CheckTime();
//            ModifyTimeRest;

            try
              DM.ADOConnection1.BeginTrans;
              with DM.tmp do
              begin
                Close;
                SQL.Text := 'update data0567 set status=6 where rkey='+dm.ADS567RKEY.AsString;
                ExecSQL;

                Close;
                SQL.Text:='insert into DATA0577(rkey567,stop_begin_date,remark) values('
                           +DM.ADS567RKEY.AsString+',CONVERT(varchar(100),GETDATE(),120)'+','+QuotedStr(strReason)+')';
                ExecSQL;

                Close;
                SQL.Text:='insert into DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date)'
                        +'values('+DM.ADS567RKEY.AsString+','+vUsernameRkey+','+'6'+','
                        +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',Endtime))+')';
                ExecSQL;
              end;
              Assignment(Endtime);
              DM.ADOConnection1.CommitTrans;
            except
              on e:Exception do
              begin
                DM.ADOConnection1.RollbackTrans;
                ShowMessage('提交失败！'+#13#10+e.Message);
              end;
            end;
          end;
        end;
      end;
    end;
  finally
     BtnRefresh.Click;
  end;

end;

procedure Tfrm_main.BitBtn14Click(Sender: TObject);
begin
  Frm_unusual_cate:=TFrm_unusual_cate.Create(Application);
//  Frm_unusual_cate.ADO43.Open;
  Frm_unusual_cate.ShowModal;
end;

procedure Tfrm_main.BitBtn15Click(Sender: TObject);
begin
  if  Assigned(Frm_TimeQuery)=False then
  Frm_TimeQuery := TFrm_TimeQuery.Create(Application);
//  Frm_TimeQuery.ADS.Close;
//  Frm_TimeQuery.ADS.Open;

  Frm_TimeQuery.ShowModal;
  inc(clickNum);   //clickNum 为点击次数，第一次点击的时候加载默认sql
end;

procedure Tfrm_main.PopupMenu3Popup(Sender: TObject);
begin
  if DM.ADS567STATUS.Value=2 then
  begin
    N1.Enabled := True;
    if  DM.ADS842MainexecStat.Value = '执行中' then
    begin
      N2.Enabled := True;
      N3.Enabled := True;
      N4.Enabled := True;
    end
    else
    begin
      N2.Enabled := False;
      N3.Enabled := False;
      N4.Enabled := False;
    end;
  end
  else
  begin
    N1.Enabled := False;
    N2.Enabled := False;
    N3.Enabled := False;
    N4.Enabled := False;
  end;
end;

function Tfrm_main.find_error(v_rkey, v_status: Integer): Boolean;
begin
  with dm.tmp do
  begin
    Close;
    sql.Text:='select rkey from data0567 where rkey='+inttostr(v_rkey)+
              ' and status='+inttostr(v_status);
    open;
  end;
  if dm.tmp.IsEmpty then
    Result:=True
  else
    result:=false;
end;

procedure Tfrm_main.N5Click(Sender: TObject);
var
  vNUMBER:string;
  BeginTime:TDateTime;
begin
  try
    if (strtoint(vprev)=1)  then
      messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
    else
    if  Self.find_error(dm.ADS567RKEY.Value,dm.ADS567STATUS.Value) then
    begin
      ShowMessage('状态已经改变，请刷新');
      Exit;
    end
    else
    begin
      if EmployeeStatusCheck(user_ptr,vNUMBER)  then
      begin
        Exit;
      end;
      if messagebox(Self.Handle,'你确定要开始受理吗？','询问',MB_YESNO)=idNo then
      begin
        Exit;
      end;

      try
        DM.ADOConnection1.BeginTrans;
        with dm.tmp do
        begin
          Close;
          SQL.Text :='select rkey,disposal_emplptr,maintain_empl,disposal_date,STATUS'+
          ',D840_ptr from data0567 where rkey='+dm.ADS567RKEY.AsString;
          Open;
          DM.ADOQuery1.Close;
          DM.ADOQuery1.SQL.Text :='select rkey,employee_name from data0005 where rkey='+user_ptr;
          DM.ADOQuery1.Open;
          Edit;
          FieldByName('disposal_emplptr').Value:=StrToInt(user_ptr);
          FieldByName('maintain_empl').Value:= DM.ADOQuery1.FieldByName('employee_name').Value;
          FieldByName('disposal_date').Value:= getsystem_date(dm.adoquery1,0);
          FieldByName('STATUS').Value:=2;
//          if  DM.ADS567D417_D840_ptr.IsNull=False then
//          FieldByName('D840_ptr').Value :=  DM.ADS567D417_D840_ptr.Value;
          Post;
          BeginTime := FieldByName('disposal_date').Value;
        end;

        with DM.tmp do
        begin
          Close;     //在DATA0841表添加一行改变状态的记录。
          SQL.Text:='insert into dbo.DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date)'
                +'values('+dm.ADS567RKEY.AsString+','+rkey73+','+'2'+','
                +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',BeginTime))+')';
          ExecSQL;
          Close;                                              //自动添加维修受理的维修人员记录。
          SQL.Text:='insert into data0842(Work_ptr,WorkDate,BeginTime,Empl_ptr,Status)values('
          +DM.ADS567RKEY.AsString+',CONVERT(VARCHAR(10),GETDATE(),120),'
          + QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',BeginTime))
          +','+user_ptr+','+'3' +')' ;
          ExecSQL;

        end;
        DM.ADOConnection1.CommitTrans;
      except  on E: Exception do
        begin
          dm.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;

      BtnRefreshClick(Sender);

      with dm.ADS842 do
      begin
        Close;
        Parameters.ParamByName('RKEY').Value:=dm.ADS567RKEY.Value;
        Open;
      end;
    end;
  finally

  end;

end;

procedure Tfrm_main.N6Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights,vNUMBER:string;
  BeginTime:TDateTime;
begin
  try
    Screen.Cursor := crHourGlass;
    if ShowResetUsernameForm(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'以其他用户受理') then
    begin
      if (strtoint(vUser_rights)in [2,3,4])=False then
      begin
        messagedlg('对不起,您没有受理的权限！',mtinformation,[mbok],0)  ;
        Exit ;
      end;
      if EmployeeStatusCheck(vEmployeeRkey,vNUMBER)  then
      begin
        Exit;
      end;
      if  Self.find_error(dm.ADS567RKEY.Value,dm.ADS567STATUS.Value) then
      begin
        ShowMessage('状态已经改变，请刷新');
        Exit;
      end
      else
      begin
        try
          DM.ADOConnection1.BeginTrans;
          with DM.tmp do
          begin
            Close;
            SQL.Text :='select rkey,disposal_emplptr,maintain_empl,disposal_date,STATUS'+
            ',D840_ptr from data0567 where rkey='+dm.ADS567RKEY.AsString;
            Open;
            Edit;
            DM.ADOQuery1.Close;
            DM.ADOQuery1.SQL.Text :='select rkey,employee_name from data0005 where rkey='+vEmployeeRkey;
            DM.ADOQuery1.Open;
            FieldByName('disposal_emplptr').Value:=StrToInt(vEmployeeRkey);
            FieldByName('maintain_empl').Value:= DM.ADOQuery1.FieldByName('employee_name').Value;
            FieldByName('disposal_date').Value:= getsystem_date(dm.adoquery1,0);
            FieldByName('STATUS').Value:=2;
            Post;
            BeginTime:=  FieldByName('disposal_date').Value;
          end;
          with  DM.tmp do
          begin
            Close;                      //在DATA0841表添加一行改变状态的记录。
            SQL.Text:='insert into dbo.DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date)'
                  +'values('+DM.ADS567RKEY.AsString+','+vUsernameRkey+','+'2'+','
                  +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',BeginTime))+')';
            ExecSQL;
            Close;                                //自动添加维修受理的维修人员记录。
            SQL.Text:='insert into data0842(Work_ptr,WorkDate,BeginTime,Empl_ptr,Status)values('
            +DM.ADS567RKEY.AsString+',CONVERT(VARCHAR(10),GETDATE(),120),'//getDate()'
            +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',BeginTime))
            +','+vEmployeeRkey+','+'3' +')' ;
            ExecSQL;
          end;
          DM.ADOConnection1.CommitTrans;
        except
          on E: Exception do
          begin
            dm.ADOConnection1.RollbackTrans;
            messagedlg(E.Message,mterror,[mbcancel],0);
          end;
        end;
      end;
      BtnRefreshClick(Sender);
    end;
  finally    
    Screen.Cursor := crDefault;
  end;

end;

procedure Tfrm_main.CancelAcceptance(vEmployeeRkey,vUsernameRkey,vUser_rights: string);
begin
  try
    Screen.Cursor := crHourGlass;
    if (strtoint(vUser_rights)=1)  then
    begin
      messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0);
      Abort;
    end;
    if messagebox(Self.Handle,'你确定要取消受理吗？','询问',MB_YESNO)=idNo then
    begin
      Abort;
    end;
    if (dm.ADS567disposal_emplptr.Value<>StrToInt(vEmployeeRkey))and(strtoint(vUser_rights)<>4) then
    begin
      messagedlg('只有受理本人才能取消受理，或者有最高权限！',mtinformation,[mbok],0);
      Abort;
    end;

    if not Self.find_error(dm.ADS567RKEY.Value,dm.ADS567STATUS.Value) then
    begin
      try
        DM.ADOConnection1.BeginTrans;
        with DM.tmp do
        begin
          Close;
          SQL.Text :='select rkey,disposal_emplptr,maintain_empl,disposal_date,STATUS'+
          ',D840_ptr,stop_house,fail_type,maintain_text from data0567 where rkey='+dm.ADS567RKEY.AsString;
          Open;
          Edit;
          FieldByName('disposal_emplptr').Value := null;
          FieldByName('disposal_date').Value := null;
          FieldByName('STATUS').Value := 1;
          FieldByName('stop_house').Value := null;
          FieldByName('fail_type').Value := '';
          FieldByName('maintain_text').Value := '';
          FieldByName('maintain_empl').Value := '';
          Post;
        end;

        with  DM.tmp do
        begin
          Close; //在DATA0841表添加一行改变状态的记录。
          SQL.Text := 'insert into dbo.DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date)'
                +'values('+DM.ADS567RKEY.AsString+','+vUsernameRkey+','+'1'+','
                +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',getsystem_date(dm.adoquery1,0)))+')';
          ExecSQL;

          Close; // 删除维修受理的维修人员记录。
          SQL.Text := 'delete data0842 where Work_ptr= '+ DM.ADS567RKEY.AsString;
          ExecSQL;

          Close; //删除维修单暂停信息
          SQL.Text := 'delete data0577 where rkey567= '+ DM.ADS567RKEY.AsString;
          ExecSQL;
        end;
        DM.ADOConnection1.CommitTrans;
      except
        on E: Exception do
        begin
          dm.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
     BtnRefreshClick(Self);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_main.N7Click(Sender: TObject);
begin
  CancelAcceptance(user_ptr,rkey73,vprev);
end;

procedure Tfrm_main.N8Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  if ShowResetUsernameForm(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'以其他用户取消受理') then
  begin
    CancelAcceptance(vEmployeeRkey,vUsernameRkey,vUser_rights);
  end;
end;

procedure Tfrm_main.Exec_EndPause(vEmployeeRkey,vUsernameRkey:string);
var
  vNUMBER:string;
  NowDate:TDateTime;
begin
  try
    Screen.Cursor := crHourGlass;
    if EmployeeStatusCheck(vEmployeeRkey,vNUMBER) then
    begin
      Abort;
    end;

    NowDate:= getsystem_date(dm.adoquery1,0) ;
    DM.ADOConnection1.BeginTrans;
    with DM.tmp do
    begin
      Close;                                //自动添加维修受理的维修人员记录。
      SQL.Text:='insert into data0842(Work_ptr,WorkDate,BeginTime,Empl_ptr,Status,DayShift)values('
      +DM.ADS567RKEY.AsString+',CONVERT(VARCHAR(10),GETDATE(),120),'//getDate()'
      +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',NowDate))
      +','+vEmployeeRkey+','+'3,'+'1' +')' ;
      ExecSQL;
    end;

    with dm.tmp do
    begin
      Close;
      SQL.Text :='select rkey ,status,stop_house from data0567 where rkey='+dm.ADS567RKEY.AsString;
      Open;
      DM.ADOQuery1.Close;
      DM.ADOQuery1.SQL.Text := 'select isnull(cast(sum(datediff(minute,stop_begin_date,stop_end_date))as dec(10,2))/60,0)  '
      +' from data0577 where rkey567='+dm.ADS567RKEY.AsString ;
      DM.ADOQuery1.Open;
      Edit;
      FieldByName('status').Value := 2;
      if FieldList[0].IsNull then
        FieldByName('stop_house').Value := ''
      else
        FieldByName('stop_house').Value := DM.ADOQuery1.FieldList[0].Value;
      Post;
    end;

    with dm.tmp do
    begin
      Close;          //将暂停记录的结束时间填写上
      SQL.Text:='update DATA0577 set stop_end_date=getdate() where rkey567='+dm.ads567RKEY.AsString +' and stop_end_date is null';
      ExecSQL;
      //在DATA0841表添加一行改变状态的记录。
      Close;
      SQL.Text:='insert into DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date)'
            +'values('+DM.ADS567RKEY.AsString+','+vUsernameRkey+','+'2'+','
            +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',NowDate))+')';
      ExecSQL;
    end;
    DM.ADOConnection1.CommitTrans;
    BtnRefreshClick(Self);
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure Tfrm_main.N9Click(Sender: TObject);
begin
  if (StrToInt(vprev) in[2,3,4])=False then
  begin
    ShowMessage('你没有暂停结束的权限！');
    Exit;
  end;
  if messagebox(Self.Handle,'你确定要暂停结束吗？','询问',MB_yesno+MB_iconquestion)=idNo then
  Exit ;
  Exec_EndPause(user_ptr,rkey73) ;
end;

procedure Tfrm_main.N10Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  if ShowResetUsernameForm(Self,DM.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'以其他用户暂停结束') then
  begin
    if (StrToInt(vUser_rights) in[2,3,4])=False then
    begin
      ShowMessage('你没有暂停结束的权限！');
      Exit;
    end;
    Exec_EndPause(vEmployeeRkey,vUsernameRkey) ;
  end;
end;

procedure Tfrm_main.N11Click(Sender: TObject);
begin
  frm_Pause := Tfrm_Pause.Create(Application);
  frm_Pause.ShowModal;
end;

procedure Tfrm_main.Exec_CompleteWork(vUsernameRkey,vEmployeeRkey,vUser_rights: string);
var
  worktime,maintaintime:TDateTime;
begin
  if (strtoint(vUser_rights)=1) then
  begin
    messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0);
    Abort;
  end;
        //如果当前操作用户<>受理人 和不是最高权限，不允许完工
  if (DM.ADS567disposal_emplptr.Value<>StrToInt(vEmployeeRkey))and(strtoint(vUser_rights)<>4) then
  begin
    MessageDlg('你没有该维修单完工的权限，只有受理人或最高权限人才可完工！',mtInformation,[mbOK],0);
    Abort;
  end;
  if not Self.find_error(dm.ADS567RKEY.Value,dm.ADS567STATUS.Value) then
  begin
    try
      DM.ADOConnection1.BeginTrans;
      with DM.tmp do
      begin
        Close;
        SQL.Text:='select status,complete_date,completion_emplptr,maintain_house,Staff_Sum_house from data0567 where rkey='+dm.ADS567RKEY.AsString;
        Open;
        Edit;
        FieldByName('status').Value := 3;
        FieldByName('complete_date').Value := getsystem_date(DM.ADOQuery1,0);
        FieldByName('completion_emplptr').Value := StrToInt(vEmployeeRkey);
        FieldByName('maintain_house').Value := HoursBetween(DM.ADS842BeginTime.Value,getsystem_date(DM.ADOQuery1,0));
        maintaintime :=0;
        worktime:=0;
        DM.ADOQuery1.Close;
        DM.ADOQuery1.SQL.Text:='select rkey,status,WorkTime,begintime,endtime from data0842 where data0842.work_ptr ='+dm.ADS567RKEY.AsString;
        DM.ADOQuery1.Open;
        DM.ADOQuery1.First;
        while not DM.ADOQuery1.Eof do
        begin
          if DM.ADOQuery1.FieldByName('WorkTime').Value>0  then    //工作时间
          worktime:= worktime+ DM.ADOQuery1.FieldByName('WorkTime').Value;
          DM.ADOQuery1.Next;
        end;
        FieldByName('Staff_Sum_house').Value:=  worktime ;
        DM.ADOQuery1.First;
        while not DM.ADOQuery1.Eof do
        begin
          if DM.ADOQuery1.FieldByName('EndTime').Value<>null  then    //工作时间
          maintaintime:= maintaintime+ HoursBetween(DM.ADOQuery1.FieldByName('begintime').Value,DM.ADOQuery1.FieldByName('EndTime').Value);
          DM.ADOQuery1.Next;
        end;
        FieldByName('maintain_house').Value:=  maintaintime ;
        Post;
      end;

      with  DM.tmp do            //在DATA0841表添加一行改变状态的记录。
      begin
        Close;
        SQL.Text:='insert into dbo.DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date)'
              +'values('+DM.ADS567RKEY.AsString+','+vUsernameRkey+','+'3'+','
              +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',getsystem_date(DM.ADOQuery1,0)))+')';
        ExecSQL;
      end;
      DM.ADOConnection1.CommitTrans;
    except
      on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
    BtnRefreshClick(Self);
  end;
end;

procedure Tfrm_main.N12Click(Sender: TObject);
begin

  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,Work_ptr,Status from data0842 where Work_ptr='+dm.ADS567RKEY.AsString+' and Status in(3,6)';
    Open;
    if IsEmpty=False then
    begin
      ShowMessage('明细表有状态是“执行中”的雇员记录，请先结束！！！');
      Exit;
    end;
  end;
  PageControl1Change(Self);
  CheckEditNull();
  if messagebox(Self.Handle,'你确定要完工吗？','询问',MB_YESNO)=idNo then
  begin
    Exit;
  end;
  Exec_CompleteWork(rkey73,user_ptr,vprev);
end;

procedure Tfrm_main.N13Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select rkey,Work_ptr,Status from data0842 where Work_ptr='+dm.ADS567RKEY.AsString+' and Status in(3,6)';
    Open;
    if IsEmpty=False then
    begin
      ShowMessage('明细表有状态是“执行中”的雇员记录，请先结束！！！');
      Exit;
    end;
  end;
  CheckEditNull();

  if ShowResetUsernameForm(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'以其他用户完工') then
  begin
    Exec_CompleteWork(vUsernameRkey,vEmployeeRkey,vUser_rights);
  end;
end;

procedure Tfrm_main.Exec_CancelWork(vUsernameRkey, vEmployeeRkey, vUser_rights: string);
begin
  if (strtoint(vUser_rights)=1)  then
  begin
    messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0);
    Exit;
  end;
  if (DM.ADS567completion_emplptr.Value<>StrToInt(vEmployeeRkey))and(strtoint(vUser_rights)<>4) then
  begin
    MessageDlg('你没有该维修单取消完工的权限,只有完工人或最高权限人才可完工！',mtInformation,[mbOK],0);
    Exit;
  end;

  if not Self.find_error(dm.ADS567RKEY.Value,dm.ADS567STATUS.Value) then
  begin
    try
      DM.ADOConnection1.BeginTrans;
      with DM.tmp do
      begin
        Close;
        SQL.Text:='select status,complete_date,completion_emplptr,maintain_house,Staff_Sum_house from data0567 where rkey='+dm.ADS567RKEY.AsString;
        Open;
        Edit;
        FieldByName('status').Value := 2;
        FieldByName('complete_date').Value := null;
        FieldByName('completion_emplptr').Value := null;
        FieldByName('maintain_house').Value := null;
        FieldByName('Staff_Sum_house').Value := null;
        Post;
      end;

      with  DM.tmp do            //在DATA0841表添加一行改变状态的记录。
      begin
        Close;
        SQL.Text:='insert into dbo.DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date)'
              +'values('+DM.ADS567RKEY.AsString+','+vUsernameRkey+','+'2'+','
              +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',getsystem_date(dm.adoquery1,0)))+')';
        ExecSQL;
      end;
      DM.ADOConnection1.CommitTrans;
    except
      on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
    BtnRefreshClick(Self);
  end;
end;

procedure Tfrm_main.N14Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if messagebox(Self.Handle,'你确定要取消完工吗？','询问',MB_YESNO)=idNo then
    begin
      Exit;
    end;
    Exec_CancelWork(rkey73,user_ptr,vprev);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_main.N15Click(Sender: TObject);
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  try
    Screen.Cursor := crHourGlass;
    if ShowResetUsernameForm(Self,dm.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'以其他用户取消完工') then
    begin
      Exec_CancelWork(vUsernameRkey,vEmployeeRkey,vUser_rights);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_main.N16Click(Sender: TObject);
var
  strReason:string;
begin
  if strtoint(vprev)<>4  then
  begin
    MessageDlg('只有最高权限人才可退回申请！',mtInformation,[mbOK],0);
    Exit;
  end;
  if messagedlg('您确定要退回该故障申请吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  if not Self.find_error(dm.ADS567RKEY.Value,dm.ADS567STATUS.Value) then
  begin
    if InputDlg(Self.Handle,'退回原因','退回原因',strReason) then
    begin
      try
        DM.ADOConnection1.BeginTrans;
        with DM.tmp do
        begin
          Close;
          SQL.Text:='select rkey,status,maintain_text,referring_date from data0567 where rkey='+dm.ADS567RKEY.AsString;
          Open;
          Edit;
          FieldByName('status').Value := 5;
          FieldByName('maintain_text').Value := strReason ;
          FieldByName('referring_date').Value := null;
          Post;
        end;
        with DM.tmp do
        begin
          Close;
          SQL.Text := 'insert into DATA0841(D567_ptr,User_ptr,Status_ptr,Record_date)'
                  +'values('+DM.ADS567RKEY.AsString+','+rkey73+','+'5'+','
                  +QuotedStr(FormatDateTime('yyyy-MM-dd H:mm:ss',getsystem_date(DM.ADOQuery1,0)))+')';
          ExecSQL;
        end;
        DM.ADOConnection1.CommitTrans;
      except
        on E: Exception do
        begin
          dm.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end;
  end;
  BtnRefreshClick(Sender);
end;

procedure Tfrm_main.N17Click(Sender: TObject);
begin
  frm_Recordt:=Tfrm_Recordt.Create(Application);
  frm_Recordt.Caption:=(Sender as TMenuItem).Caption;

 // if frm_Recordt.ShowModal=mrok then
  with frm_Recordt do
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Text:='select data0073.USER_FULL_NAME ,case data0841.Status_ptr when 0 then ''未提交'' when 1 then ''待受理'''+
     ' when 2 then ''已受理'' when 3 then ''已完工'' when 4 then ''已验收'' when 5 then ''被退回'' when 6 then ''已暂停'''+
     ' when 7 then ''投诉'' end as Status,data0841.Record_date,data0841.remark from DATA0841 join data0073 on DATA0841.User_ptr= data0073.rkey'+
     ' where Status_ptr<>7 and D567_ptr= ' + DM.ADS567RKEY.AsString;
    ADOQuery1.Open;
    DBGridEh1.Columns[0].Title.Caption := '用户';
    DBGridEh1.Columns[0].Width :=120;
    DBGridEh1.Columns[1].Title.Caption := '状态';
    DBGridEh1.Columns[1].Width :=80;
    DBGridEh1.Columns[2].Title.Caption := '日期';
    DBGridEh1.Columns[2].Width :=150;
    DBGridEh1.Columns[3].Title.Caption := '描述';
    DBGridEh1.Columns[3].Width :=200;
    ShowModal;
  end;
end;

procedure Tfrm_main.N18Click(Sender: TObject);
begin
    frm_Recordt:=Tfrm_Recordt.Create(Application);
  frm_Recordt.Caption:=(Sender as TMenuItem).Caption;
  with frm_Recordt do
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Text:='select data0073.USER_FULL_NAME ,case data0841.Status_ptr when 0 then ''未提交'' when 1 then ''待受理'''+
     ' when 2 then ''已受理'' when 3 then ''已完工'' when 4 then ''已验收'' when 5 then ''被退回'' when 6 then ''已暂停'''+
     ' when 7 then ''投诉'' end as Status,data0841.Record_date,data0841.remark from DATA0841 join data0073 on DATA0841.User_ptr= data0073.rkey'+
     ' where Status_ptr=7 and D567_ptr= ' + DM.ADS567RKEY.AsString;
    ADOQuery1.Open;
    DBGridEh1.Columns[0].Title.Caption := '用户';
    DBGridEh1.Columns[0].Width :=120;
    DBGridEh1.Columns[1].Title.Caption := '状态';
    DBGridEh1.Columns[1].Width :=80;
    DBGridEh1.Columns[2].Title.Caption := '日期';
    DBGridEh1.Columns[2].Width :=150;
    DBGridEh1.Columns[3].Title.Caption := '描述';
    DBGridEh1.Columns[3].Width :=200;
    ShowModal;
  end;
end;

procedure Tfrm_main.PopupMenu2Popup(Sender: TObject);
begin
  N5.Enabled := (dm.ADS567STATUS.Value in[1,8])and(StrToInt(vprev)in [2,3,4]);   //开始受理
  N6.Enabled := (dm.ADS567STATUS.Value in[1,8]);                                 //以其他用户受理
  N7.Enabled := (dm.ADS567STATUS.Value=2) and(StrToInt(vprev)in [2,3,4]);        //取消受理
  N8.Enabled := (dm.ADS567STATUS.Value=2);                                       //以其他用户取消受理
  N9.Enabled := (DM.ADS567STATUS.Value=6)and(StrToInt(vprev)in [2,3,4]);         //暂停结束
  N10.Enabled := (DM.ADS567STATUS.Value=6);                                      //以其他用户暂停结束
  N12.Enabled  := (dm.ADS567STATUS.Value=2) and(StrToInt(vprev)in [2,3,4]);      //完工处理
  N13.Enabled := (dm.ADS567STATUS.Value=2);                                      //以其他用户完工
  N14.Enabled  := (dm.ADS567STATUS.Value=3)and(StrToInt(vprev)in [2,3,4]);       //取消完工
  N15.Enabled := (dm.ADS567STATUS.Value=3);                                      //以其他用户取消完工
  N16.Enabled :=(n5.Enabled) and (StrToInt(vprev)in [4]);
  N17.Enabled := not (DM.ADS567.IsEmpty);
  N18.Enabled := not (DM.ADS567.IsEmpty);
  N20.Enabled :=not (DM.ADS567.IsEmpty);                        //退回申请
end;



procedure Tfrm_main.UpDown1ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
   dbgrideh1.FrozenCols := newvalue;
end;

procedure Tfrm_main.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then abort//判断是否输入数字
//  else
//  if key = chr(46) then
//  if pos('.',Edt_timereset.Text)>0then abort;//第二列小数点'.'不能重复
end;

procedure Tfrm_main.DBGridEh1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
//  if messagedlg('数据还没有保存,你要保存吗?',mtconfirmation,[mbyes,mbno,mbcancel],0) = mryes  then
  SaveColsInfo(Self,StrToInt(rkey73));
end;



procedure Tfrm_main.DateTimePicker1Exit(Sender: TObject);
begin
  DM.ADS567.Close;
  dm.ADS567.CommandText := sql_text+strStatusValue+ssql+' and (data0567.failure_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0567.failure_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+')';
  DM.ADS567.Open;
end;

procedure Tfrm_main.DateTimePicker1CloseUp(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure Tfrm_main.DateTimePicker2CloseUp(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure Tfrm_main.DateTimePicker2Exit(Sender: TObject);
begin
  DM.ADS567.Close;
  dm.ADS567.CommandText := sql_text+strStatusValue+ssql+' and (data0567.failure_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0567.failure_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+')';
  DM.ADS567.Open;
end;



procedure Tfrm_main.N19Click(Sender: TObject);
//var
//  bm: TBookmark;
//  col, row: Integer;
//  sline: String;
//  mem: TMemo;
//  ExcelApp: Variant;
begin
// Screen.Cursor := crHourglass;
//    DBGridEh2.DataSource.DataSet.DisableControls;
////    bm := DBGridEh2.DataSource.DataSet.GetBookmark;
//    DBGridEh2.DataSource.DataSet.First;
//
//    ExcelApp := CreateOleObject('Excel.Application');
//    ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
//    ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;
//
//    mem := TMemo.Create(Self);
//    mem.Visible := false;
//    mem.Parent := self;
//    mem.Clear;
//    sline := '';
//
//    DM.ADS567.First;
//  while not DM.ADS567.Eof do
//  begin
//
//    for col := 0 to DBGridEh1.FieldCount-1 do
//      sline := sline + DBGridEh1.Columns[col].Title.Caption + #9;
//    mem.Lines.Add(sline);
//
//    sline := '';
//    for col := 0 to DBGridEh1.FieldCount-1 do
//      sline := sline + DBGridEh1.Fields[col].AsString + #9;
//    mem.Lines.Add(sline);            //导出请购编号
//
//    mem.Lines.Add('');//增加一行空行
//
//    sline := '';
//    for col := 0 to DBGridEh2.FieldCount-1 do
//     sline := sline + DBGridEh2.Columns[col].Title.Caption + #9;
//    mem.Lines.Add(sline);
//
//    for row := 0 to DBGridEh2.DataSource.DataSet.RecordCount-1 do
//    begin
//      sline := '';
//      for col := 0 to DBGridEh2.FieldCount-1 do
//        sline := sline + DBGridEh2.Fields[col].AsString + #9;
//      mem.Lines.Add(sline);
//      DBGridEh2.DataSource.DataSet.Next;
//    end;
//    mem.Lines.Add('');//增加一行空行
//    mem.Lines.Add('');//增加一行空行
//    DM.ADS567.Next;
//  end;
////    mem.Lines.Add('');//增加一行空行
////    mem.Lines.Add('备注');//增加一行空行
////    sline := '';
////    with dm.ADO11 do
////    begin
////      dm.ADO11.Close;           //查找记事本
////      dm.ADO11.Parameters[0].Value:=DM.AQ68rkey.Value;
////      dm.ADO11.Open;
////      if not isempty then
////      for col := 1 to 4 do
////       mem.Lines.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(col)).AsString);
////    end;
//
//    mem.SelectAll;
//    mem.CopyToClipboard;
//
//    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
//    ExcelApp.Visible := true;
//    FreeAndNil(mem);
//
////    DBGridEh2.DataSource.DataSet.GotoBookmark(bm);
////    DBGridEh2.DataSource.DataSet.FreeBookmark(bm);
//    DBGridEh2.DataSource.DataSet.EnableControls;
//    Screen.Cursor := crDefault;
end;

procedure Tfrm_main.N20Click(Sender: TObject);
var
  bm: TBookmark;
  col, row: Integer;
  sline: String;
  mem: TMemo;
  ExcelApp: Variant;
begin
  if  (not DM.ADs567.IsEmpty) and(CheckBox8.Checked) then
  begin
    DM.ADs468.Close;
    DM.ADs468.Parameters[0].Value:=DM.ADS567RKEY.Value;
    DM.ADs468.Open;
  end
  else
  begin
    ShowMessage('没有勾选自动显示材料领用明细');
    Exit;
  end;
  if DM.ADS468.RecordCount > 0 then
  begin
    Screen.Cursor := crHourglass;
    DBGrid1.DataSource.DataSet.DisableControls;
    bm := DBGrid1.DataSource.DataSet.GetBookmark;
    DBGrid1.DataSource.DataSet.First;

    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
    ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    mem := TMemo.Create(Self);
    mem.Visible := false;
    mem.Parent := self;
    mem.Clear;
    sline := '';
    for col := 0 to DBGridEh1.FieldCount-1 do
      sline := sline + DBGridEh1.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    sline := '';
    for col := 0 to DBGridEh1.FieldCount-1 do
      sline := sline + DBGridEh1.Fields[col].AsString + #9;
    mem.Lines.Add(sline);            //导出请购编号

    mem.Lines.Add('');//增加一行空行

    sline := '';
    for col := 0 to DBGrid1.FieldCount-1 do
     sline := sline + DBGrid1.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
        sline := sline + DBGrid1.Fields[col].AsString + #9;
      mem.Lines.Add(sline);
      DBGrid1.DataSource.DataSet.Next;
    end;


    mem.SelectAll;
    mem.CopyToClipboard;

    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    FreeAndNil(mem);

    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end
  else
  begin
    ShowMessage('没用领用材料明细');
  end;
end;

end.

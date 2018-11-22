unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus,DateUtils,
  ComCtrls;

type
  TForm_Main = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label1: TLabel;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure item_Click(Sender:TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure fun(sender:TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
    list:TStringList;
    sortDate,longDate:TDateTime;
  public
    { Public declarations }
    sql_Text:string;
  end;

var
  Form_Main: TForm_Main;

implementation

uses dmo, common, Reg, Query;

{$R *.dfm}

procedure TForm_Main.FormCreate(Sender: TObject);
var i:Integer;
item:TMenuItem;
begin
  if not app_init_2(DM.ADOConn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  Self.Caption:=Application.Title;
  list:=TStringList.Create;
  with DM.ADOQuery2 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select getdate() as v_dt');
    Active:=True;
    longDate:=StrToDateTime(FormatDateTime('YYYY-MM-DD HH:MM:SS',FieldValues['v_dt']));
    sortDate:=StrToDate((DateToStr(FieldValues['v_dt'])));
  end;
  sql_Text:=DM.ADOAskLeaveRegister.CommandText;
  dm.ADOAskLeaveRegister.CommandText:= dm.ADOAskLeaveRegister.CommandText + ' and AskLeaveRegister.starttime>='+
      quotedstr(formatdatetime('YYYY-MM-DD',IncMonth(sortDate,-1)-dayof(sortDate)+1))+ 'and AskLeaveRegister.starttime<= '+
      quotedstr(formatdatetime('YYYY-MM-DD',IncMonth(sortDate,3)));
  DM.ADOAskLeaveRegister.Open;
  for  i:=0  to DBGridEh1.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=DBGridEh1.Columns[i].Title.Caption;
    if DBGridEh1.Columns[i].Visible then item.Checked:=True;
    item.OnClick:=item_Click;
    PopupMenu1.Items.Add(item);
  end;
  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
end;

procedure TForm_Main.item_Click(Sender: TObject);
var i:Integer;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  if (Sender as TMenuItem).Checked=True then
  begin
    for  i:=0  to DBGridEh1.Columns.Count-1 do
    begin
      if (Sender as TMenuItem).Caption=DBGridEh1.Columns[i].Title.Caption then
      begin
        DBGridEh1.Columns[i].Visible:=True;
        Break;
      end;
    end;
  end
  else
  begin
    for i :=0  to DBGridEh1.Columns.Count-1 do
    begin
      if (Sender as TMenuItem).Caption=DBGridEh1.Columns[i].Title.Caption then
      begin
        DBGridEh1.Columns[i].Visible:=False;
        Break;
      end;
    end;
  end;
end;

procedure TForm_Main.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_Main.BitBtn2Click(Sender: TObject);
begin
  DM.ADOAskLeaveRegister.Close;
  DM.ADOAskLeaveRegister.Open;
  Edit1.Text:='';
  Edit1.SetFocus;
end;

procedure TForm_Main.BitBtn3Click(Sender: TObject);
var
  i:Byte;
begin
  Form_Query:=TForm_Query.Create(Application);
  Form_Query.ComboBox1.Items.Clear;
  DM.ADOAskForLeave.Close;
  DM.ADOAskForLeave.Parameters[0].Value:='';
  DM.ADOAskForLeave.Open;
  DM.ADOAskForLeave.DisableControls;
  DM.ADOAskForLeave.First;
  while not DM.ADOAskForLeave.Eof do
  begin
    Form_Query.ComboBox1.Items.Add(DM.ADOAskForLeaveleavetype.Value);
    DM.ADOAskForLeave.Next;
  end;
  DM.ADOAskForLeave.EnableControls;
  Form_Query.ComboBox1.ItemIndex:=0;
  Form_Query.list:=list;
  Form_Query.DateTimePicker1.Date:=IncMonth(sortDate,-1)-dayof(sortDate)+1;
  Form_Query.DateTimePicker2.Date:=IncMonth(sortDate,3);
  if Form_Query.ShowModal=mrok then
  begin
    list:=Form_Query.list;
    with DM.ADOAskLeaveRegister do
    begin
      Close;
      CommandText:=sql_Text+' and AskLeaveRegister.starttime>='+
      quotedstr(formatdatetime('YYYY-MM-DD',Form_Query.DateTimePicker1.Date))+ 'and AskLeaveRegister.starttime<= '+
      quotedstr(formatdatetime('YYYY-MM-DD',Form_Query.DateTimePicker2.Date+1));
      for i := 1 to Form_Query.SGrid1.RowCount-2 do
        CommandText:=CommandText+Form_Query.SGrid1.Cells[2,i];
      Open;
    end;
  end;
end;

procedure TForm_Main.BitBtn4Click(Sender: TObject);
begin
  if DBGridEh1.RowCount>0 then
    Export_dbGridEH_to_Excel(DBGridEh1,Application.Title);
end;

procedure TForm_Main.BitBtn5Click(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.ADOAskLeaveRegister.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADOAskLeaveRegister.IndexFieldNames:=Column.FieldName;
  end;
  if (Column.Title.Caption<>'开始时间') and (Column.Title.Caption<>'结束时间') and (Column.Title.Caption<>'登记日期') then
  begin
    if preColumn.FieldName<>Column.FieldName then
    begin
      Label1.Caption:=Column.Title.Caption+':';
      preColumn.Title.Color:=clBtnFace;
      Column.Title.Color:=clRed;
      preColumn:=Column;
      Edit1.Text:='';
      Edit1.SetFocus;
    end;
  end;
end;


procedure TForm_Main.Edit1Change(Sender: TObject);
begin
  if preColumn.Title.Color=clRed then
  begin
    if Trim(Edit1.Text)<>'' then
      DM.ADOAskLeaveRegister.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
    else
      DM.ADOAskLeaveRegister.Filter:='';
  end
  else
  begin
    Edit1.Text:='';
    Edit1.SetFocus;
    DM.ADOAskLeaveRegister.Filter:='';
    Exit;
  end;
end;

procedure TForm_Main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  fun(nil);
  with Form_Reg do
  begin
    ComboBox1.ItemIndex:=1;
    DateTimePicker1.Date:=sortDate;
    DateTimePicker2.Date:=sortDate;
    DateTimePicker3.DateTime:=StrToDateTime(DateTimeToStr(sortDate)+' 08:00:00');
    DateTimePicker4.DateTime:=StrToDateTime(DateTimeToStr(sortDate)+' 20:00:00');
    DateTimePicker5.DateTime:=longDate;
  end;
  DM.ADOQuery1.Close;
  DM.ADOQuery1.Parameters[0].Value:=null;
  DM.ADOQuery1.Open;
  DM.ADOQuery1.Append;
  if Form_Reg.ShowModal=mrok then
  begin
    BitBtn2Click(nil);
    DM.ADOAskLeaveRegister.Locate('rkey',DM.ADOQuery1rkey.Value,[]);
    DM.ADOQuery1.Close;
  end;
end;

procedure TForm_Main.fun(sender:TObject);
begin
  Form_Reg:=TForm_Reg.Create(Application);
  Form_Reg.ComboBox1.Items.Clear;
  DM.ADOAskForLeave.Close;
  dm.ADOAskForLeave.Parameters[0].Value:='';
  DM.ADOAskForLeave.Open;
  DM.ADOAskForLeave.DisableControls;
  DM.ADOAskForLeave.First;
  while not DM.ADOAskForLeave.Eof do
  begin
    Form_Reg.ComboBox1.Items.Add(DM.ADOAskForLeaveleavetype.Value);
    DM.ADOAskForLeave.Next;
  end;
  DM.ADOAskForLeave.EnableControls;
end;

procedure TForm_Main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  fun(nil);
  DM.ADOQuery1.Close;
  DM.ADOQuery1.Parameters[0].Value:=DM.ADOAskLeaveRegisterrkey.Value;
  DM.ADOQuery1.Open;
  DM.ADOQuery1.Edit;
  with Form_Reg do
  begin
    ADOemployeemsg.Close;
    ADOemployeemsg.Parameters[0].Value:=DM.ADOAskLeaveRegisteremployeeid.Value;
    ADOemployeemsg.Open;
    Edit1.Text:=ADOemployeemsgemployeecode.Value;
    Label9.Caption:=ADOemployeemsgchinesename.Value;
    with DM.ADOQuery2 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select leavetype from AskForLeave where rkey='+dm.ADOAskLeaveRegisterleavetype.Text);
      Active:=True;
    end;
    ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(DM.ADOQuery2.FieldValues['leavetype']);
    DateTimePicker1.Date:=DM.ADOAskLeaveRegisterstartdate.Value;
    DateTimePicker2.Date:=DM.ADOAskLeaveRegisterenddate.Value;
    DateTimePicker3.DateTime:=DM.ADOAskLeaveRegisterstarttime.Value;
    DateTimePicker4.DateTime:=DM.ADOAskLeaveRegisterendtime.Value;
    DateTimePicker5.Date:=DM.ADOAskLeaveRegistermakedate.Value;
    if DM.ADOAskLeaveRegisterCurStatus.Value=1 then
      CheckBox1.Checked:=True
    else
      CheckBox1.Checked:=False;
    Edit2.Text:=DM.ADOQuery1leavereason.Value;
    Edit3.Text:=DM.ADOQuery1remark.Value;
  end;
  if Form_Reg.ShowModal=mrok then
  begin
    BitBtn2Click(nil);
    DM.ADOAskLeaveRegister.Locate('rkey',DM.ADOQuery1rkey.Value,[]);
    DM.ADOQuery1.Close;
  end;
end;

procedure TForm_Main.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  if MessageBox(Handle,'数据一旦删除无法恢复，确定要删除？','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO then
    Exit;
  DM.ADOConn.BeginTrans;
  try
    DM.ADOQuery1.Close;
    DM.ADOQuery1.Parameters[0].Value:=DM.ADOAskLeaveRegisterrkey.Value;
    DM.ADOQuery1.Open;
    DM.ADOQuery1.Delete;
    BitBtn2Click(Sender);
    if DBGridEh1.RowCount>2 then
    begin
      DM.ADOAskLeaveRegister.RecNo:=DBGridEh1.RowCount-1;
    end;
    DM.ADOConn.CommitTrans;
  except
    DM.ADOConn.RollbackTrans;
  end;
end;

end.

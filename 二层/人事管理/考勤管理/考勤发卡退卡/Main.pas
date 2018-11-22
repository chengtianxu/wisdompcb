unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, Menus,DateUtils;

type
  TForm_Main = class(TForm)
    Panel1: TPanel;
    DBGrd: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Popup1: TPopupMenu;
    Popup2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrdTitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure item_Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure common(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
    longDate:TDateTime;
    sortDate:TDateTime;
    sql_Text:string;
    sql_Text1:string;
    command_Text:string;
    status:Byte;
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;

implementation

uses dmo, common, AddAttendance, Search;

{$R *.dfm}

procedure TForm_Main.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_Main.BitBtn2Click(Sender: TObject);
begin
  DM.ADOEmployeecardMsg.Close;
  DM.ADOEmployeecardMsg.Open;
end;

procedure TForm_Main.BitBtn3Click(Sender: TObject);
var
  i:Byte;
begin
  Form_Search:=TForm_Search.Create(Application);
  Form_Search.command_Text:=command_Text;
  Form_Search.dtpk1.DateTime:=sortDate-dayof(sortDate)+1;
  Form_Search.dtpk2.DateTime:=sortDate;
  if Form_Search.ShowModal=mrok then
  begin
    command_Text:=Form_Search.command_Text;
    with DM.ADOEmployeecardMsg do
    begin
      Close;
      CommandText:=sql_Text;
      for i := 1 to Form_Search.SGrd.RowCount-2 do
      begin
        CommandText:=CommandText+Form_Search.SGrd.Cells[2,i];
      end;
      Open;
    end;
  end;
end;

procedure TForm_Main.BitBtn4Click(Sender: TObject);
begin
  if not DM.ADOEmployeecardMsg.IsEmpty then
    Export_dbGridEH_to_Excel(DBGrd,Application.Title);
end;

procedure TForm_Main.BitBtn5Click(Sender: TObject);
begin
  Popup2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm_Main.FormShow(Sender: TObject);
begin
  Self.Caption:=Application.Title;
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    N1.Enabled:=False;
    N2.Enabled:=False;
    N3.Enabled:=False;
    N4.Enabled:=False;
  end;
  if DM.ADOConn.Connected then
  begin
    DM.ADOEmployeecardMsg.Open;
    sql_Text:=DM.ADOEmployeecardMsg.CommandText;
    sql_Text1:=DM.ADOEmployeeMsg.CommandText;
    Form_AddAttendance:=TForm_AddAttendance.Create(Application);
    Form_AddAttendance.Label3.Visible:=False;
    Form_AddAttendance.dtpk2.Visible:=False;
  end;
end;

procedure TForm_Main.DBGrdTitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.ADOEmployeecardMsg.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADOEmployeecardMsg.IndexFieldNames:=Column.FieldName;
  end;
  if preColumn.FieldName<>Column.FieldName then
  begin
    if (Column.Title.Caption<>'发卡日期') and (Column.Title.Caption<>'退卡\挂失日期') and (Column.Title.Caption<>'发卡操作日期') then
    begin
      Label1.Caption:=Column.Title.Caption;
      preColumn.Title.Color:=clBtnFace;
      Column.Title.Color:=clRed;
      preColumn:=Column;
    end
    else
      preColumn.Title.Color:=clBtnFace;
    Edit1.Text:='';
    Edit1.SetFocus;
  end;
end;

procedure TForm_Main.FormCreate(Sender: TObject);
var
  i:Byte;
  item:TMenuItem;
begin
  if not app_init_2(DM.ADOConn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
//  vprev:='2';
//  rkey73:='2012';
  preColumn:=DBGrd.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
  for i := 0 to DBGrd.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=DBGrd.Columns[i].Title.Caption;
    if DBGrd.Columns[i].Visible then item.Checked:=True;
    item.OnClick:=item_Click;
    Popup2.Items.Add(item);
  end;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select getdate() as v_dt');
    Active:=True;
    longDate:=StrToDateTime(FormatDateTime('YYYY-MM-DD HH:MM:SS',FieldValues['v_dt']));
    sortDate:=FieldValues['v_dt'];
  end;
end;

procedure TForm_Main.item_Click(Sender: TObject);
var
  i:Byte;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  if (Sender as TMenuItem).Checked then
  begin
    for i := 0 to DBGrd.Columns.Count-1 do
    begin
      if (Sender as TMenuItem).Caption=DBGrd.Columns[i].Title.Caption then
      begin
        DBGrd.Columns[i].Visible:=True;
        Break;
      end;
    end;
  end
  else
  begin
    for i := 0 to DBGrd.Columns.Count-1 do
    begin
      if (Sender as TMenuItem).Caption=DBGrd.Columns[i].Title.Caption then
      begin
        DBGrd.Columns[i].Visible:=False;
        Break;
      end;
    end;
  end;
end;

procedure TForm_Main.N1Click(Sender: TObject);
begin
  Form_AddAttendance:=TForm_AddAttendance.Create(Application);
  Form_AddAttendance.dtpk1.DateTime:=longDate;
  DM.ADOEmployeecardMsg.Append;
  if Form_AddAttendance.ShowModal=mrok then
  begin
    BitBtn2Click(Sender);
  end;
end;

procedure TForm_Main.Edit1Change(Sender: TObject);
begin
  if preColumn.Title.Color=clRed then
  begin
    if Trim(Edit1.Text)<>'' then
      DM.ADOEmployeecardMsg.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
    else
      DM.ADOEmployeecardMsg.Filter:='';
  end
  else
  begin
    Edit1.Text:='';
    Edit1.SetFocus;
    DM.ADOEmployeecardMsg.Filter:='';
    Exit;
  end;
end;

procedure TForm_Main.N2Click(Sender: TObject);
var
  rec:Integer;
begin
  if messagedlg('是否确定要退卡？',mtConfirmation,[mbyes,mbno],0)=6 then
  begin
    if DM.ADOEmployeecardMsgstatus.Value<>1 then
    begin
      ShowMessage('此卡不是有效状态，不能退卡');
      Exit;
    end;
    with DM.ADO73 do
    begin
      Close;
      Parameters[0].Value:=rkey73;
      Open;
    end;
    try
      DM.ADOConn.BeginTrans;
      common(Sender);
      status:=3;
      DM.ADOEmployeecardMsg.Edit;
      rec:=DM.ADOEmployeecardMsg.RecNo;
      DM.ADOEmployeecardMsgend_time.Value:=Form_AddAttendance.dtpk2.DateTime;
      DM.ADOEmployeecardMsgstatus.Value:=status;
      DM.ADOEmployeecardMsgoper_person.Value:=DM.ADO73employee_ptr.Value;
//      DM.ADOEmployeecardMsgoper_person.Value:=781;
      //更新员工档案表中的考勤卡号
      with DM.ADOEmployeeMsg do
      begin
        Close;
        CommandText:=sql_Text1+' and rkey='+dm.ADOEmployeecardMsgemployeeid.Text;
        Open;
        Edit;
      end;
      //发卡时在员工档案表记录考勤卡号，否则考勤卡号为空
      DM.ADOEmployeeMsgCardno.Value:='';
      DM.ADOEmployeecardMsg.Post;
      DM.ADOEmployeeMsg.Post;
      DM.ADOConn.CommitTrans;
    except
      DM.ADOConn.RollbackTrans;
    end;
    BitBtn2Click(Sender);
    DM.ADOEmployeecardMsg.RecNo:=rec;
  end;
end;

procedure TForm_Main.N3Click(Sender: TObject);
var
  rec:Integer;
begin
  if messagedlg('是否确定要挂失？',mtConfirmation,[mbyes,mbno],0)=6 then
  begin
    if DM.ADOEmployeecardMsgstatus.Value<>1 then
    begin
      ShowMessage('此卡不是有效状态，不能挂失');
      Exit;
    end;
    with DM.ADO73 do
    begin
      Close;
      Parameters[0].Value:=rkey73;
      Open;
    end;
    try
      DM.ADOConn.BeginTrans;
      common(Sender);
      status:=2;
      DM.ADOEmployeecardMsg.Edit;
      rec:=DM.ADOEmployeecardMsg.RecNo;
      DM.ADOEmployeecardMsgend_time.Value:=Form_AddAttendance.dtpk2.DateTime;
      DM.ADOEmployeecardMsgstatus.Value:=status;
      DM.ADOEmployeecardMsgoper_person.Value:=DM.ADO73employee_ptr.Value;
  //    DM.ADOEmployeecardMsgoper_person.Value:=781;
      //更新员工档案表中的考勤卡号
      with DM.ADOEmployeeMsg do
      begin
        Close;
        CommandText:=sql_Text1+' and rkey='+dm.ADOEmployeecardMsgemployeeid.Text;
        Open;
        Edit;
      end;
      //发卡时在员工档案表记录考勤卡号，否则考勤卡号为空
      DM.ADOEmployeeMsgCardno.Value:='';
      DM.ADOEmployeecardMsg.Post;
      DM.ADOEmployeeMsg.Post;
      DM.ADOConn.CommitTrans;
    except
      DM.ADOConn.RollbackTrans;
    end;
    BitBtn2Click(Sender);
    DM.ADOEmployeecardMsg.RecNo:=rec;
  end;
end;

procedure TForm_Main.N4Click(Sender: TObject);
var
  rec:Integer;
begin
  if messagedlg('是否确定要换卡？',mtConfirmation,[mbyes,mbno],0)=6 then
  begin
    if DM.ADOEmployeecardMsgstatus.Value<>1 then
    begin
      ShowMessage('此卡不是有效状态，不能换失');
      Exit;
    end;
    with DM.ADO73 do
    begin
      Close;
      Parameters[0].Value:=rkey73;
      Open;
    end;
    try
      DM.ADOConn.BeginTrans;
      common(Sender);
      status:=4;
      DM.ADOEmployeecardMsg.Edit;
      rec:=DM.ADOEmployeecardMsg.RecNo;
      DM.ADOEmployeecardMsgend_time.Value:=Form_AddAttendance.dtpk2.DateTime;
      DM.ADOEmployeecardMsgstatus.Value:=status;
      DM.ADOEmployeecardMsgoper_person.Value:=DM.ADO73employee_ptr.Value;
  //    DM.ADOEmployeecardMsgoper_person.Value:=781;
      //更新员工档案表中的考勤卡号
      with DM.ADOEmployeeMsg do
      begin
        Close;
        CommandText:=sql_Text1+' and rkey='+dm.ADOEmployeecardMsgemployeeid.Text;
        Open;
        Edit;
      end;
      //发卡时在员工档案表记录考勤卡号，否则考勤卡号为空
      DM.ADOEmployeeMsgCardno.Value:='';
      DM.ADOEmployeecardMsg.Post;
      DM.ADOEmployeeMsg.Post;
      DM.ADOConn.CommitTrans;
    except
      DM.ADOConn.RollbackTrans;
    end;
    BitBtn2Click(Sender);
    DM.ADOEmployeecardMsg.RecNo:=rec;
  end;
end;

procedure TForm_Main.common(Sender: TObject);
begin
  Form_AddAttendance:=TForm_AddAttendance.Create(Application);
  with Form_AddAttendance do
  begin
    ADOEmployeeMsg.Close;
    ADOEmployeeMsg.Parameters[0].Value:=DM.ADOEmployeecardMsgemployeeid.Value;
    ADOEmployeeMsg.Open;
    dtpk1.DateTime:=DM.ADOEmployeecardMsgbegin_time.Value;
    dtpk2.DateTime:=longDate;
    Label3.Visible:=True;
    dtpk2.Visible:=True;
    dtpk1.Enabled:=False;
    dtpk2.Enabled:=False;
  end;
end;
end.

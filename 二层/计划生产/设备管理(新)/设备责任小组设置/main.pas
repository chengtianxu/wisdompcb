unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus;

type
  TFrm_main = class(TForm)
    BitQuit: TBitBtn;
    BitRefresh: TBitBtn;
    BtnExportToExcel: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    StatusBar1: TStatusBar;
    panel1: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    PopupMenu2: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure BitQuitClick(Sender: TObject);
    procedure BitRefreshClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
  private
    PreColumn: TColumnEh;
    sql_text:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation

uses damo,common, ResponsibilityGroup, EmployeeSet,DB;

{$R *.dfm}

procedure TFrm_main.BitQuitClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFrm_main.BitRefreshClick(Sender: TObject);
var
  rkey840:integer;
begin
  rkey840:=DM.ADS840RKEY.Value;
  dm.ADS840.Close;
  dm.ADS840.Prepared;
  dm.ADS840.Open;
  if rkey840>0 then
  dm.ADS840.Locate('rkey',rkey840,[]);
end;

procedure TFrm_main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS840.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TFrm_main.FormShow(Sender: TObject);
var
  num:Integer;
begin

  PreColumn := DBGridEh1.Columns[1];
  num :=0;
  sql_text := DM.ADS840.CommandText;
  DM.ADS840.Open;
  DM.ADS855.Open;
  frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS840.RecNo)+
  '/总记录数:'+ IntToStr(DM.ADS840.RecordCount);

  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select EMPLOYEE_PTR,USER_FULL_NAME,USER_LOGIN_NAME from data0073 where  rkey='+rkey73;
    Open;
    user_ptr:=Fields[0].AsString;
    StatusBar1.Panels[1].Text:='用户名：'+trim(FieldValues['USER_FULL_NAME'])+' ('+trim(FieldValues['USER_LOGIN_NAME'])+')';
  end;

  DM.ADS855.First;
  while not DM.ADS855.Eof do
  begin
    if DM.ADS855.FieldByName('DepaDate').IsNull then
    num := num+1;
   DM.ADS855.Next;
  end;
  StatusBar1.Panels[2].Text := '在职雇员人数：'+inttostr(num);

end;

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not app_init_2(DM.ADOConnection1) then
  begin
    showmsg('程序起动失败请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;

//  rkey73:='851';
//  user_ptr := '963';
//  vprev := '2';
end;

procedure TFrm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADS840.CommandText);
end;

procedure TFrm_main.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADS855.CommandText);
end;

procedure TFrm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker = smDownEh) or (Column.Title.SortMarker = smNoneEh)then
  begin
    column.Title.SortMarker := smUpEh;
    dm.ADS840.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADS840.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
    (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
  edit1.SetFocus;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  frm_ResponsilibyGroup := Tfrm_ResponsilibyGroup.Create(Application);
  frm_ResponsilibyGroup.v_status :=0;
  if frm_ResponsilibyGroup.ShowModal = mrok then
  begin
    dm.ADS840.Close;
    dm.ads840.Open;
    dm.ADS840.Locate('rkey',frm_ResponsilibyGroup.rkey840,[]);
    ShowMsg('新增操作成功!',1);
  end;
end;

procedure TFrm_main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  frm_ResponsilibyGroup := Tfrm_ResponsilibyGroup.Create(Application);
  frm_ResponsilibyGroup.v_status :=1;
  if frm_ResponsilibyGroup.ShowModal = mrok then
  begin
    BitRefreshClick(Sender);
    ShowMsg('编辑操作成功!',1);
  end;
end;

procedure TFrm_main.N3Click(Sender: TObject);
begin
  frm_ResponsilibyGroup := Tfrm_ResponsilibyGroup.Create(Application);
  frm_ResponsilibyGroup.v_status :=2;
  if frm_ResponsilibyGroup.ShowModal = mrok then
end;

procedure TFrm_main.N4Click(Sender: TObject);
var
  num:Integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  try
    DM.ADOConnection1.BeginTrans;
    with DM.tmp do
    begin
      Close;
      SQL.Text := 'delete data0855 where D840_ptr='+dm.ADS840rkey.AsString;
      ExecSQL;
      Close;
      SQL.Text :='delete data0840 where rkey='+dm.ADS840rkey.AsString;
      ExecSQL;
      num :=1;
    end;
    DM.ADOConnection1.CommitTrans;
    if num=1 then
    begin
      common.ShowMsg('删除操作成功！',1);
      self.BitRefreshClick(Sender);
    end;
  except
    on e:Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      ShowMessage('本责任小组在设备维修定义中被引用，不能删除');
    end;
  end;
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled := (StrToInt(vprev) in[2,4]) ;
  N2.Enabled := (StrToInt(vprev) in[2,4]) and (not DM.ADS840.IsEmpty);
  N4.Enabled := (StrToInt(vprev) in[2,4]) and (not DM.ADS840.IsEmpty);
  N3.Enabled :=  not DM.ADS840.IsEmpty;
end;

procedure TFrm_main.N5Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  frm_EmployeeSet := Tfrm_EmployeeSet.Create(Application);
  frm_EmployeeSet.v_status := 0;
  if frm_EmployeeSet.ShowModal=mrok then
  begin
    dm.ADS855.Close;
    dm.ads855.Open;
    dm.ADS855.Locate('rkey',frm_EmployeeSet.rkey855,[]);
    ShowMsg('新增操作成功!',1);
  end;
end;

procedure TFrm_main.N6Click(Sender: TObject);
var
  rkey855 : Integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  frm_EmployeeSet := Tfrm_EmployeeSet.Create(Application);
  frm_EmployeeSet.v_status := 1;
  if frm_EmployeeSet.ShowModal=mrok then
  begin
    rkey855 := DM.ADS855Rkey.Value;
    dm.ADS855.Close;
    dm.ads855.Open;
    dm.ADS855.Locate('rkey',rkey855,[]);
    ShowMsg('编辑操作成功!',1);
  end;
end;

procedure TFrm_main.N7Click(Sender: TObject);
begin
  frm_EmployeeSet := Tfrm_EmployeeSet.Create(Application);
  frm_EmployeeSet.v_status :=2;
  if frm_EmployeeSet.ShowModal = mrok then
end;

procedure TFrm_main.N8Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  try
    with DM.tmp do
    begin
      Close;
      SQL.Text := 'delete data0855 where rkey='+dm.ADS855rkey.AsString;
      if ExecSQL>0 then
      begin
        common.ShowMsg('删除操作成功！',1);
        self.BitRefreshClick(Sender);
      end;
    end;
  except
    on e:Exception do
    begin
      messagedlg(E.Message,mterror,[mbcancel],0);
    end
  end;
end;

procedure TFrm_main.PopupMenu2Popup(Sender: TObject);
begin
  N5.Enabled := (StrToInt(vprev) in[2,4]) and (not DM.ADS840.IsEmpty) ;
  N6.Enabled := (StrToInt(vprev) in[2,4]) and (not DM.ADS855.IsEmpty);
  N7.Enabled := not DM.ADS855.IsEmpty;
  N8.Enabled := (StrToInt(vprev) in[2,4]) and (not DM.ADS855.IsEmpty);
end;

end.

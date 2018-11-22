unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,DB, DBGridEh, common, Menus, IniFiles;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnClose: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    BitBtn5: TBitBtn;
    dbMain: TDBGridEh;
    lbFilter: TLabel;
    edtFilter: TEdit;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    nAdd: TMenuItem;
    nBack: TMenuItem;
    nDrop: TMenuItem;
    nChang: TMenuItem;
    ComboBox1: TComboBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure dbMainTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure dbMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnQueryClick(Sender: TObject);
    procedure dbMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure nAddClick(Sender: TObject);
    procedure nBackClick(Sender: TObject);
    procedure nDropClick(Sender: TObject);
    procedure nChangClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
  private
    mainSql,querySql:string;
    preColumn:TColumnEh;
    EmployeecarMsg_ini:Tinifile;
    procedure itemClick(Sender: TObject);

    { Private declarations }
  public
    FDoorIP : string;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DAMO, PasQuery, DateUtils, PasSend;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not App_init_2(DM.ADOConnection1) then
  begin
    ShowMessage('程序启动失败，请联系管理员');
    Application.Terminate;
  end;
  Self.Caption := Application.Title;
//  user_ptr:='3057';
//  vprev:='2';
end;

procedure TfrmMain.itemClick(Sender: TObject);
var
  i:Integer;
begin
  (Sender as TMenuItem).Checked:= not (Sender as TMenuItem).Checked;
  for i:=0 to dbMain.Columns.Count-1 do
  begin
    if (Sender as TMenuItem).Caption=dbMain.Columns[i].Title.Caption then
    begin
      dbMain.Columns[i].Visible:=(Sender as TMenuItem).Checked;
      Break;
    end;
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  i:Integer;
  item:TMenuItem;
begin
  preColumn:=dbMain.Columns[0];
  lbFilter.Caption:=preColumn.Title.Caption;
  mainSql:=DM.adoMain.CommandText;
  with DM.adoMain do
  begin
    Close;
    Open;
  end;

  for i:=0 to dbMain.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=dbMain.Columns[i].Title.Caption;
    item.Checked:=dbMain.Columns[i].Visible;
    item.OnClick:=itemClick;
    PopupMenu1.Items.Add(item);
  end;

  nAdd.Enabled:= (vprev='2') or (vprev='4');
  nBack.Enabled:= (vprev='2') or (vprev='4');
  nDrop.Enabled:= (vprev='2') or (vprev='4');
  nChang.Enabled:= (vprev='2') or (vprev='4');
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  mainrkey:Integer;
begin
  mainrkey:= DM.adoMainrkey.Value;
  DM.adoMain.Close;
  DM.adoMain.CommandText:=mainSql + querySql;
  DM.adoMain.Open;
  if mainrkey>0 then DM.adoMain.Locate('rkey',mainrkey,[]);
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  if  not DM.adoMain.IsEmpty then
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(dbMain,'考勤发卡');
end;

procedure TfrmMain.BitBtn5Click(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain.dbMainTitleClick(Column: TColumnEh);
begin
  if (Column.Title.Caption<>preColumn.Title.Caption) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    Column.Title.Color:= clRed;
    preColumn.Title.Color:=clBtnFace;
    lbFilter.Caption:=Column.Title.Caption;
    edtFilter.SetFocus;
    preColumn:=Column;
  end;

  if Column.Title.SortMarker= smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.adoMain.IndexFieldNames:=Column.FieldName + ' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.adoMain.IndexFieldNames:=Column.FieldName;
  end;
end;

procedure TfrmMain.edtFilterChange(Sender: TObject);
begin
  if Trim(edtFilter.Text)<>'' then
  begin
    DM.adoMain.Filtered:=False;
    DM.adoMain.Filter:=preColumn.FieldName + ' like ''%'+ Trim(edtFilter.Text)+ '%''';
    DM.adoMain.Filtered:=True;
  end
  else DM.adoMain.Filter:='';
end;

procedure TfrmMain.dbMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then ShowMessage(DM.adoMain.CommandText);
end;

procedure TfrmMain.btnQueryClick(Sender: TObject);
var
  i:Integer;
begin
  if frmQuery=nil then frmQuery:=TfrmQuery.Create(Application);
  frmQuery.dtpkFrom.Date:= IncYear(getsystem_date(DM.adoTmp,1),-1);
  frmQuery.dtpkTo.Date:=getsystem_date(DM.adoTmp,1);
  if frmQuery.ShowModal=mryes then
  begin
    querySql:='';
    for i:=1 to frmQuery.sgCondition.RowCount-2 do
    begin
      querySql:=frmQuery.sgCondition.Cells[2,i]+ #13 + querySql;
    end;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.dbMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
  begin
    if dbMain.SelectedRows.Count<=1 then
    begin
      dbMain.SelectedRows.Clear;
      dbMain.SelectedRows.CurrentRowSelected:=True;
    end;
  end;
end;

procedure TfrmMain.nAddClick(Sender: TObject);
begin
  try
    frmSend:=TfrmSend.Create(Application);
    frmSend.FIP := FDoorIP;
    if frmSend.ShowModal=mryes then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmSend.Free;
  end;
end;

procedure TfrmMain.nBackClick(Sender: TObject);
begin
  if DM.adoMainrkey.Value<>0 then
  begin
    if MessageDlg('你确定要退卡吗？',mtConfirmation, [mbYes,mbNo],0)= mryes then
    begin
      if DM.adoMainstatus.Value<>1 then
      begin
        ShowMessage('此卡不是有效状态，不能退卡');
        exit;
      end;
      try
        DM.ADOConnection1.BeginTrans;
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update employeecardmsg set status=3,end_time='+ QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',getsystem_date(DM.adoTime,0)))+
                    ', oper_person='+ user_ptr +', oper_date='+ QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',getsystem_date(DM.adoTime,0)))+#13+
                    'where rkey='+ IntToStr(DM.adoMainrkey.Value);
          ExecSQL;
        end;
        if (DM.adoMain.FieldByName('cardno_dec').AsString <> '0') and (not DM.adoMain.FieldByName('cardno_dec').IsNull) then
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update employeemsg set cardno='''' where rkey = '+ IntToStr(DM.adoMainemployeeid.Value);
          ExecSQL;
        end;

        if (DM.adoMain.FieldByName('ICCardno').AsString <> '0') and (not DM.adoMain.FieldByName('ICCardno').IsNull) then
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update employeemsg set ICCardno='''' where rkey='+ IntToStr(DM.adoMainemployeeid.Value);
          ExecSQL;
        end;
        DM.ADOConnection1.CommitTrans;

        btnRefreshClick(nil);
      except
        on E: Exception do
        begin
          DM.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
      try
        if Trim(FDoorIP) <> '' then
        if (DM.adoMain.FieldByName('ICCardno').AsString <> '0') and (not DM.adoMain.FieldByName('ICCardno').IsNull) then
        begin
           DM.adoInsert.Close;
           DM.adoInsert.SQL.Text := 'insert into ['+ FDoorIP +'].[security_db].[dbo].[third_base_middata](obj_type,data_content,op_type)'+
                        ' values(''PersPerson'',''{"pin":"'+ DM.adoMain.FieldByName('employeecode').AsString +'"}'',''delByIds'')';
          DM.adoInsert.ExecSQL;
        end;
      except
        on E: Exception do
        begin
          ShowMessage('更新门禁数据失败！！');
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.nDropClick(Sender: TObject);
begin
  if DM.adoMainrkey.Value<>0 then
  begin
    if MessageDlg('你确定要挂失吗？',mtConfirmation, [mbYes,mbNo],0)= mryes then
    begin
      if DM.adoMainstatus.Value<>1 then
      begin
        ShowMessage('此卡不是有效状态，不能挂失');
        exit;
      end;
      try
      DM.ADOConnection1.BeginTrans;
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update employeecardmsg set status=2,end_time='+ QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',getsystem_date(DM.adoTime,0)))+
                    ', oper_person='+ user_ptr +', oper_date='+ QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',getsystem_date(DM.adoTime,0)))+#13+
                    'where rkey='+ IntToStr(DM.adoMainrkey.Value);
          ExecSQL;
        end;
        if (DM.adoMain.FieldByName('cardno_dec').AsString <> '0') and (not DM.adoMain.FieldByName('cardno_dec').IsNull) then
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update employeemsg set cardno='''' where rkey='+ IntToStr(DM.adoMainemployeeid.Value);
          ExecSQL;
        end;
        if (DM.adoMain.FieldByName('ICCardno').AsString <> '0') and (not DM.adoMain.FieldByName('ICCardno').IsNull) then
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update employeemsg set ICCardno='''' where rkey='+ IntToStr(DM.adoMainemployeeid.Value);
          ExecSQL;
        end;

        if Trim(FDoorIP) <> '' then
        if (DM.adoMain.FieldByName('ICCardno').AsString <> '0') and (not DM.adoMain.FieldByName('ICCardno').IsNull) then
        with DM.adoInsert do
        begin

          Close;
          SQL.Text := 'insert into ['+ FDoorIP +'].[security_db].[dbo].[third_base_middata](obj_type,data_content,op_type)'+
                      ' values(''PersPerson'',''{"pin":"'+ DM.adoMain.FieldByName('employeecode').AsString +'"}'',''delByIds'')';
        end;

        DM.ADOConnection1.CommitTrans;

        if Trim(FDoorIP) <> '' then
        if (DM.adoMain.FieldByName('ICCardno').AsString <> '0') and (not DM.adoMain.FieldByName('ICCardno').IsNull) then
        begin
          DM.adoInsert.ExecSQL;
        end;
        btnRefreshClick(nil);
      except
        on E: Exception do
        begin
          DM.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.nChangClick(Sender: TObject);
begin
  if DM.adoMainrkey.Value<>0 then
  begin
    if MessageDlg('你确定要换卡吗？',mtConfirmation, [mbYes,mbNo],0)= mryes then
    begin
      if DM.adoMainstatus.Value<>1 then
      begin
        ShowMessage('此卡不是有效状态，不能换卡');
        exit;
      end;
      try
      DM.ADOConnection1.BeginTrans;
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update employeecardmsg set status=4,end_time='+ QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',getsystem_date(DM.adoTime,0)))+
                    ', oper_person='+ user_ptr +', oper_date='+ QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',getsystem_date(DM.adoTime,0)))+#13+
                    'where rkey='+ IntToStr(DM.adoMainrkey.Value);
          ExecSQL;
        end;
        if (DM.adoMain.FieldByName('cardno_dec').AsString <> '0') and (not DM.adoMain.FieldByName('cardno_dec').IsNull) then
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update employeemsg set cardno='''' where rkey='+ IntToStr(DM.adoMainemployeeid.Value);
          ExecSQL;
        end;
        if (DM.adoMain.FieldByName('ICCardno').AsString <> '0') and (not DM.adoMain.FieldByName('ICCardno').IsNull) then
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='update employeemsg set ICCardno='''' where rkey='+ IntToStr(DM.adoMainemployeeid.Value);
          ExecSQL;
        end;
        if Trim(FDoorIP) <> '' then
        if (DM.adoMain.FieldByName('ICCardno').AsString <> '0') and (not DM.adoMain.FieldByName('ICCardno').IsNull) then
        with DM.adoInsert do
        begin
          Close;
          SQL.Text := 'insert into ['+ FDoorIP +'].[security_db].[dbo].[third_base_middata](obj_type,data_content,op_type)'+
                      ' values(''PersPerson'',''{"pin":"'+ DM.adoMain.FieldByName('employeecode').AsString +'"}'',''delByIds'')';
        end;
        DM.ADOConnection1.CommitTrans;
        if Trim(FDoorIP) <> '' then
        if (DM.adoMain.FieldByName('ICCardno').AsString <> '0') and (not DM.adoMain.FieldByName('ICCardno').IsNull) then
        begin
          DM.adoInsert.ExecSQL;
        end;
        btnRefreshClick(nil);
      except
        on E: Exception do
        begin
          DM.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
var
  i : Integer;
begin
  EmployeecarMsg_ini := Tinifile.Create(extractfilepath(paramstr(0)) +'EmployeecarMsg.INI');

  if not FileExists('EmployeecarMsg.INI') then
  begin
    EmployeecarMsg_ini.WriteString('门禁','东莞','172.18.111.10');
    EmployeecarMsg_ini.WriteString('门禁','梅州','172.17.52.254');
    EmployeecarMsg_ini.WriteString('门禁','无门禁','');
  end;
  ComboBox1.Clear;
  EmployeecarMsg_ini.ReadSection('门禁',combobox1.Items);
  for i := 0 to ComboBox1.Items.Count-1 do
  begin
    if Trim(common.GetServerRegion(DM.ADOConnection1)) = Trim(ComboBox1.Items[i]) then
    begin
      ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(ComboBox1.Items[i]);
      Break;
    end
    else
      ComboBox1.ItemIndex := ComboBox1.Items.IndexOf('无门禁');
  end;
  FDoorIP := EmployeecarMsg_ini.ReadString('门禁',ComboBox1.Text,'');

//   edit2.Text:=program_ini.ReadString('服务器',combobox3.Text,'');
// edit3.Text:=program_ini.ReadString('数据库',combobox3.Text,'');
//ShowMessage(IntToStr(ComboBox1.Items.IndexOf(Self.Caption)))/
end;

procedure TfrmMain.ComboBox1Change(Sender: TObject);
begin
  FDoorIP := EmployeecarMsg_ini.ReadString('门禁',ComboBox1.Text,'');

//  ShowMessage(ComboBox1.Items[ComboBox1.ItemIndex]);
//  ShowMessage(IntToStr(ComboBox1.Items.IndexOf(ComboBox1.Text)))
end;

procedure TfrmMain.ComboBox1Enter(Sender: TObject);
begin
  if StrToInt(vprev) <> 4 then
  begin
    ShowMessage('权限不够，不能发其它厂的卡');
    dbMain.SetFocus;
    Exit ;
  end;
end;

end.

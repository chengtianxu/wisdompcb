unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus, DB, ADODB,
  ppEndUsr, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    dbgrdh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;                           
    Label1: TLabel;
    edt_1: TEdit;
    PopupMenu2: TPopupMenu;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure dbgrdh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure dbgrdh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure dbgrdh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name, sSql: string;
    procedure item_click(sender:TObject);
    //procedure ClearMemory;
  public
    { Public declarations }

  end;

var
  frmMain: TfrmMain;

implementation

uses
  common, Damo, AddFrm, QueFrm, apprvFrm, PPReportFrm;

{$R *.dfm}

//主窗体创建事件
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not common.App_Init(DM.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    Application.Terminate;
    exit;
  end;
  {user_ptr := '121';
  vprev := '4';}
  Caption := application.Title;
end;

{procedure TfrmMain.ClearMemory;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
      SetProcessWorkingSetSize(GetCurrentProcess, $FFFFFFFF, $FFFFFFFF);
      application.ProcessMessages;
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  ClearMemory;
end; }

//主窗体显示事件
procedure TfrmMain.FormShow(Sender: TObject);
var
  i: Integer;
  item: TMenuItem;
begin
  Self.sSql := DM.qryCp85.SQL.Text;
  DM.qryCp85.Close;
  DM.qryCp85.SQL.Text := Self.sSql + ' and qte_date >= ' + QuotedStr(DateToStr(FrmQue.DateTimePicker1.date))
    + ' and qte_date <= ' + QuotedStr(DateToStr(FrmQue.DateTimePicker2.date))
    + ' order by tnumber desc';
  DM.qryCp85.Open;
  field_name := dbgrdh1.Columns[0].FieldName;
  PreColumn := dbgrdh1.Columns[0];
  dbgrdh1.Columns[0].Title.Color := clred ;
  label1.Caption := dbgrdh1.Columns[0].Title.Caption;
  if dm.ADOConnection1.Connected then
  begin
      //dbgrdh1TitleClick(PreColumn);
      for i:=1 to dbgrdh1.Columns.Count do
      begin
          item := TmenuItem.Create(self) ;
          item.Caption := dbgrdh1.Columns[i-1].Title.Caption ;
          if dbgrdh1.Columns[i-1].Visible then
              item.Checked := true ;
          item.OnClick := item_click ;
          PopupMenu2.Items.Add(item) ;
      end;
  end;
  //BitBtn2.Click;
end;

//主窗体退出事件
procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

//单击字段，过滤显示字段。
procedure TfrmMain.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
    begin
      for i := 0 to dbgrdh1.Columns.Count - 1 do
      begin
        if dbgrdh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
        begin
          dbgrdh1.Columns[i].Visible := true;
          break;
        end ;
      end;
    end
  else
  begin
    for i := 0 to dbgrdh1.FieldCount - 1 do
    begin
      if dbgrdh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
      begin
        dbgrdh1.Columns[i].Visible := false;
        break;
      end;
    end;
  end ;
end;

//新增报价单
procedure TfrmMain.N1Click(Sender: TObject);
begin
  if strtoint(vprev) < 2 then
  begin
    messagedlg('对不起! 您的权限（可写）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  dm.flag := 0;
  FrmAdd := TFrmAdd.Create(Application);
  FrmAdd.ShowModal;
  FrmAdd.Free;
end;

//删除报价单
procedure TfrmMain.N2Click(Sender: TObject);
var
  i: Integer;
begin
  if strtoint(vprev) < 2 then
  begin
    messagedlg('对不起! 您的权限（可写）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  if MessageBox(Handle,'确定删除此记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  with DM.qrytemp do
  begin
    i := dbgrdh1.Row;
    Close;
    SQL.Clear;
    SQL.Text := 'delete from wzcp0085 where rkey = ' + IntToStr(DM.qryCp85.FieldValues['rkey']);
    ExecSQL;
  end;
  DM.qryCp85.Close;
  DM.qryCp85.Open;
  DM.qryCp85.MoveBy(i - 1);
end;

//编辑报价单
procedure TfrmMain.N3Click(Sender: TObject);
begin
  if strtoint(vprev) < 2 then
  begin
    messagedlg('对不起! 您的权限（可写）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  dm.flag := 1;
  DM.qry85.Close;
  DM.qry85.Parameters.ParamByName('rkey85').Value := DM.qryCp85rkey.AsInteger;
  DM.qry85.Open;
  FrmAdd := TFrmAdd.Create(Application);
  FrmAdd.ShowModal;
  FrmAdd.Free;
end;

//检查报价单
procedure TfrmMain.N4Click(Sender: TObject);
begin
  dm.flag := 2;
  DM.ADO87.Close;
  DM.ADO87.Parameters[0].Value:=DM.qryCp85rkey.Value;
  DM.ADO87.Open;
  FrmAdd := TFrmAdd.Create(Application);
  FrmAdd.ShowModal;
  FrmAdd.Free;
end;

//刷新
procedure TfrmMain.BitBtn2Click(Sender: TObject);
var
  i: Integer;
begin
  i := DM.qryCp85rkey.Value;
  DM.qryCp85.Close;
  DM.qryCp85.Open;
  DM.qryCp85.Locate('rkey',i, []);
end;

//导出
procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(dbgrdh1, '快速报价');
end;

//绘制表格奇偶颜色
procedure TfrmMain.dbgrdh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with  (Sender as TDBGridEh)do
  begin
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
  Canvas.brush.Color := $00FFC4C4;
  If DM.qryCp85AUDITED_STATUS.Value in [2, 4] then
  Begin
      dbgrdh1.Canvas.Font.Color := clRed;
      dbgrdh1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End;
end;

//单击表格title时排序
procedure TfrmMain.dbgrdh1TitleClick(Column: TColumnEh);
begin
  if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qryCp85.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qryCp85.Sort:=Column.FieldName+' DESC';
  end;
  if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
end;

//根据edt_1的值过滤查询表格内容
procedure TfrmMain.edt_1Change(Sender: TObject);
begin
  dbgrdh1.DataSource.DataSet.Filtered := True;
  if dbgrdh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_1.text) <> '' then
      begin
        if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            dbgrdh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
          end
        else
          if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            dbgrdh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
          end;
      end
    else
      dbgrdh1.DataSource.DataSet.Filter:='';
  end;
end;

//Alt+V显示SQL语句
procedure TfrmMain.dbgrdh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.qryCp85.SQL.Text);
end;

//单击字段事件
procedure TfrmMain.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

//提交审批
procedure TfrmMain.N5Click(Sender: TObject);
var
  Cp85rkey, rkey264, i: Integer;
  auth_flag, sysdate: string;
begin
  if strtoint(vprev) < 2 then
  begin
    messagedlg('对不起! 您的权限（可写）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  Cp85rkey := DM.qryCp85rkey.Value;
  rkey264 := DM.qryCp85PROD_ROUTE_PTR.Value;

  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select getdate() as sysdate ';
    Open;
    sysdate := FieldValues['sysdate'];
  end;
  with DM.qryCp85 do
  begin
    Edit;
    FieldByName('audited_status').AsInteger := 1;
    FieldByName('apprv_by_ptr').AsString := user_ptr;
    FieldByName('apprv_date').AsDateTime:= StrToDateTime(sysdate);
    Post;
    Close;
    Open;
  end;

  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select * from data0265 where auth_group_ptr = ' + IntToStr(rkey264);
    Open;
    if IsEmpty then Exit;
    First;
    for i := 0 to RecordCount - 1 do
    begin
      if i = 0 then auth_flag := 'Y' else auth_flag := 'N';
      DM.qrytemp1.Close;
      DM.qrytemp1.SQL.Clear;
      DM.qrytemp1.SQL.Text := Format('insert into data0274(qte_ptr, user_ptr, ranking, auth_flag) '
        + 'values(%d, %d,  %d, ''%s'')', [Cp85rkey, FieldByName('user_ptr').AsInteger, i + 1, auth_flag]);
      dm.qrytemp1.ExecSQL;
      Next;
    end;
  end;
  
  DM.qryCp85.Locate('rkey', Cp85rkey, []);
end;

//取消提交
procedure TfrmMain.N6Click(Sender: TObject);
var
  Cp85rkey: Integer;
begin
  if strtoint(vprev) < 2 then
  begin
    messagedlg('对不起! 您的权限（可写）不够，请联系管理员！',mtinformation,[mbok],0);
    Exit;
  end;
  Cp85rkey := DM.qryCp85rkey.Value;
  try
    DM.ADOConnection1.BeginTrans;
    with DM.qryCp85 do
    begin
      Edit;
      FieldByName('audited_status').AsInteger := 0;
      FieldByName('apprv_by_ptr').Value := NULL;
      FieldByName('apprv_date').Value:= NULL;
      Post;
    end;
    DM.ADOConnection1.CommitTrans;

    DM.ADOConnection1.BeginTrans;
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'delete from data0274 where qte_ptr= ' + IntToStr(Cp85rkey);
      ExecSQL;
    end;
    DM.ADOConnection1.CommitTrans;
    DM.qryCp85.Close;
    DM.qryCp85.Open;
    DM.qryCp85.Locate('rkey', Cp85rkey, []);
  except
    on e: Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      ShowMessage('网络异常，请稍候重试！ (' + e.Message + ')');
    end;
  end;
end;

//打开查询条件窗口
procedure TfrmMain.BitBtn4Click(Sender: TObject);
var
 i: byte;
begin
  with FrmQue do
  begin
    if ShowModal = mrok then
    begin
      with dm.qryCp85 do
      begin
        close;
        SQL.Text := self.sSql + #13;
        for i := 1 to SGrid1.RowCount-2 do SQL.Text := SQL.Text+SGrid1.Cells[2,i] + #13;
        SQL.Text := SQL.Text + ' and qte_date >= ' + QuotedStr(DateToStr(FrmQue.DateTimePicker1.date))
          + ' and qte_date <= ' + QuotedStr(DateToStr(FrmQue.DateTimePicker2.date))
          + ' order by qte_date desc';
        open;
      end;
    end;
  end;
end;

//审批信息
procedure TfrmMain.N7Click(Sender: TObject);
begin
  frmApprv := TfrmApprv.Create(Application);
  frmApprv.ShowModal;
  frmApprv.Free;
end;

//右键菜单显隐藏设置
procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
  //0未提交， 1待审核， 2已过期， 3已审批， 4被退回
  //N1增， N2删， N3改， N4查， N5提交审批， N6取消提交， N7审批信息
  if (DM.qryCp85AUDITED_STATUS.Value = 0)  or (DM.qryCp85AUDITED_STATUS.Value = 4) then
  begin
    N2.Enabled := True;
    N3.Enabled := True;
    N4.Enabled := True;
    N5.Enabled := True;
    N6.Enabled := False;
    N7.Enabled := True;
    if DM.qryCp85AUDITED_STATUS.Value = 0 then N7.Enabled := False;
    if DM.qryCp85AUDITED_STATUS.Value = 4 then
    begin
      N3.Enabled := False;
      N5.Enabled := False;
      N6.Enabled := False;
    end;
  end;
  if DM.qryCp85AUDITED_STATUS.Value = 1 then
  begin
    N2.Enabled := False;
    N3.Enabled := False;
    N4.Enabled := True;
    N5.Enabled := False;
    N6.Enabled := True;
    N7.Enabled := True;
  end;
  if DM.qryCp85AUDITED_STATUS.Value = 2 then
  begin
    N2.Enabled := False;
    N3.Enabled := False;
    N4.Enabled := True;
    N5.Enabled := False;
    N6.Enabled := False;
    N7.Enabled := True;
  end;
  if DM.qryCp85AUDITED_STATUS.Value = 3 then
  begin
    N2.Enabled := False;
    N3.Enabled := False;
    N4.Enabled := True;
    N5.Enabled := False;
    N6.Enabled := False;
    N7.Enabled := True;
  end;
end;

procedure TfrmMain.dbgrdh1GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then
   Background := $00FFC4C4;
end;

//更新所有已审核的过期报价单
procedure TfrmMain.N8Click(Sender: TObject);
var
  i: Integer;
  rkey85: string;
begin
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select convert(varchar(100),getdate(),23) as sysdate, rkey, expiration_date from wzcp0085 '
      + 'where convert(varchar(100),getdate(),23) > expiration_date and audited_status <> 2 and audited_status = 3';
    Open;
    if Recordcount > 0  then
    begin
      rkey85 := '';
      First;
      for i := 0 to RecordCount - 1 do     // 获取已审过期报价单rkey
      begin
        rkey85 := rkey85 + IntToStr(FieldValues['rkey']) + ',';
        Next;
      end;
      rkey85 := '(' + Copy(rkey85, 0, Length(rkey85) - 1) + ')';

      try                                 // 更新状态为2已过期
        dm.ADOConnection1.BeginTrans;
        with DM.qrytemp1 do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'update wzcp0085 set audited_status = 2 where rkey in ' + rkey85;
          ExecSQL;
        end;
        dm.ADOConnection1.CommitTrans;
        ShowMessage('所有已审过期报价单已更新！');
        DM.qryCp85.Close;
        DM.qryCp85.Open;
      except
        on e: Exception do
        begin
          dm.ADOConnection1.RollbackTrans;
          ShowMessage('网络异常，请稍后重试！ (' + e.Message + ')');
        end;
      end;
    end
    else
      ShowMessage('经查证，没有需要更新的已审过期报价单！');
  end;
end;

procedure TfrmMain.N9Click(Sender: TObject);
begin
  DM.ADO274Report.Close;
  DM.ADO274Report.Parameters[0].Value:=DM.qryCp85TNUMBER.Value;
  DM.ADO274Report.Open;
  DM.ADO274Report_1.Close;
  DM.ADO274Report_1.Parameters[0].Value:=DM.qryCp85TNUMBER.Value;
  DM.ADO274Report_1.Open;
  FrmReport:=TFrmReport.Create(Application);
  try
    FrmReport.ppReport1.Reset;
    FrmReport.ppReport1.Template.FileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',
      [rfReplaceAll]) + 'QteNumberInfo.rtm';     // 'QteNumberInfo.rtm';
    FrmReport.ppReport1.Template.LoadFromFile;
    FrmReport.ppReport1.SaveAsTemplate := false;
    DM.qry85Report.SQL.Text := sSql + ' and wzcp0085.rkey = ' + IntToStr(DM.qryCp85rkey.Value);
    DM.qry85Report.Open;

    DM.qry86Report.Close;
    DM.qry86Report.Parameters[0].Value := DM.qryCp85rkey.Value;
    DM.qry86Report.Open;
    FrmReport.ppReport1.Print;
  finally
    FrmReport.free;
  end;
end;

end.

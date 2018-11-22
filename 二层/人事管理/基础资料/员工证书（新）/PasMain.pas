unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGridEh, Buttons, Menus,DateUtils;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnClose: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    btnField: TBitBtn;
    lbName: TLabel;
    edtFilter: TEdit;
    dbShow: TDBGridEh;
    Panel4: TPanel;
    Panel5: TPanel;
    StaticText1: TStaticText;
    DBGridEh1: TDBGridEh;
    Panel6: TPanel;
    Panel7: TPanel;
    StaticText2: TStaticText;
    btnBat: TBitBtn;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    chkoutduty: TCheckBox;
    PopupMenu2: TPopupMenu;
    nAdd: TMenuItem;
    nEdit: TMenuItem;
    nCheck: TMenuItem;
    nDelete: TMenuItem;
    N1: TMenuItem;
    nImport: TMenuItem;
    lblCount1: TLabel;
    lblcount2: TLabel;
    lbl1: TLabel;
    lblCOUNT: TLabel;
    btnExport2: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFieldClick(Sender: TObject);
    procedure dbShowTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure chkoutdutyClick(Sender: TObject);
    procedure nAddClick(Sender: TObject);
    procedure nEditClick(Sender: TObject);
    procedure nCheckClick(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure btnBatClick(Sender: TObject);
    procedure dbShowKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure dbShowMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure nImportClick(Sender: TObject);
    procedure btnExport2Click(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
    status,cbbindex:Integer;
    mainSQL,querySQL:string;
    beginDate,endDate:TDateTime;
    procedure itemClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses damo,common,DB, PasQuery, PasAddEdit, PasImport;

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not App_Init(DM.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption:=Application.Title;

//  user_ptr:='1307';
//  vprev:='2';

end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  selectRkey:Integer;
begin
  selectRkey:= DM.adoMainrkey.Value;
  with DM.adoMain do
  begin
    Close;
    Parameters.ParamByName('status').Value:= status;
    Parameters.ParamByName('ondate').Value:= beginDate;
    Parameters.ParamByName('todate').Value:= endDate;
    CommandText:=mainSQL+ #13 + querySQL;
    Open;
//    Sort:='departmentname';
  end;
  if selectRkey > 0 then DM.adoMain.Locate('rkey',selectRkey,[]);
  with DM.adoWillOut do
  begin
    Close;
    Parameters.ParamByName('beforedate').value:= getsystem_date(DM.adoTime,1);
    Parameters.ParamByName('enddate').Value:= IncDay(IncMonth(getsystem_date(DM.adoTime,1)),-1);
    Open;
    sort:='enddate';
  end;

  with DM.adoOut do
  begin
    Close;
    Parameters.ParamByName('today').Value:= getsystem_date(DM.adoTime,1);
    Open;
    sort:='enddate';
  end;
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  if not DM.adoMain.IsEmpty then
    if MessageDlg('你确定要导出数据吗？', mtInformation, [mbYes,mbNo],0)= mryes then
      Export_dbGridEH_to_Excel(Self.dbShow,Self.Caption);
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  i:Integer;
  item:TMenuItem;
begin
  querySQL:='';
  cbbindex:=-1;
  preColumn:=dbshow.columns[0];
  mainSQL:=DM.adoMain.CommandText;
  status:=1;
  beginDate:=incYear(getsystem_date(DM.adoTmp,1),-2);
  endDate:= getsystem_date(DM.adoTmp,1);
  lbName.Caption:=preColumn.Title.Caption;
  edtFilter.SetFocus;
  for i:=0 to dbShow.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=dbShow.Columns[i].Title.Caption;
    item.Checked:=dbShow.Columns[i].Visible;
    item.OnClick:=itemClick;
    PopupMenu1.Items.Add(item);
  end;
  
  with DM.adoMain do
  begin
    Close;
    Parameters.ParamByName('status').Value:= status;
    Parameters.ParamByName('ondate').Value:= beginDate;
    Parameters.ParamByName('todate').Value:= endDate;
    CommandText:=mainSQL+ #13 + querySQL;
    Open;
//    Sort:='departmentname';
 lblCount.Caption:=IntToStr(DM.adoMain.recordcount);
  end;

  with DM.adoWillOut do
  begin
    Close;
    Parameters.ParamByName('beforedate').value:= getsystem_date(DM.adoTime,1);
    Parameters.ParamByName('enddate').Value:= IncDay(IncMonth(getsystem_date(DM.adoTime,1)),-1);
    Open;
    sort:='enddate';

  end;
   if not DM.adoWillOut.IsEmpty then
  lblCount1.Caption:=IntToStr(DM.adoWillOut.recordcount);

  with DM.adoOut do
  begin
    Close;
    Parameters.ParamByName('today').Value:= getsystem_date(DM.adoTime,1);
    Open;
    sort:='enddate';
  end;
   if not DM.adoOut.IsEmpty then
  lblCount2.Caption:=IntToStr(DM.adoOut.recordcount);
end;

procedure TfrmMain.itemClick(Sender: TObject);
var
  i:Integer;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  for i:=0 to dbShow.Columns.Count-1 do
  begin
    if (Sender as TMenuItem).Caption=dbShow.Columns[i].Title.Caption then
    begin
      dbShow.Columns[i].Visible:=(Sender as TMenuItem).Checked;
      Break;
    end;
  end;
end;

procedure TfrmMain.btnFieldClick(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain.dbShowTitleClick(Column: TColumnEh);
begin
  if (preColumn.FieldName<>Column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbName.Caption:=Column.Title.Caption;
    Column.Title.Color:= clRed;
    preColumn.Title.Color:= clBtnFace;
    edtFilter.Focused;
    preColumn:=Column;    //注意要把当前列赋值给前一列
  end;

  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.adoMain.Sort:=Column.FieldName + ' DESC ';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.adoMain.Sort:=Column.FieldName;
  end;
end;

procedure TfrmMain.edtFilterChange(Sender: TObject);
begin
  DM.adoMain.Filtered:=True;
  if Trim(edtFilter.Text)<>'' then
    DM.adoMain.Filter:=preColumn.FieldName + ' like %' + Trim(edtFilter.Text)+ '%'
  else
    DM.adoMain.Filter:='';
end;

procedure TfrmMain.btnQueryClick(Sender: TObject);
var
  i:Integer;
begin
  if frmQuery=nil then frmQuery:=TfrmQuery.Create(Application);
  frmQuery.dtpkOn.Date:= beginDate;
  frmQuery.dtpkTo.Date:= endDate;
  querySQL:='';
  if cbbindex<>-1 then frmQuery.lbCondition.ItemIndex:= cbbindex
  else frmQuery.lbCondition.ItemIndex:=0;
  if frmQuery.ShowModal=mrok then
  begin
    beginDate:= frmQuery.dtpkOn.Date;
    endDate:= frmQuery.dtpkTo.Date;
    if frmQuery.sgQuery.RowCount>2 then
    begin
    for i:=1 to frmQuery.sgQuery.RowCount-1 do
      querySQL:=querySQL+#13+ frmQuery.sgQuery.Cells[2,i];
    end;

    with DM.adoMain do
    begin
      Close;
      Parameters.ParamByName('status').Value:= status;
      Parameters.ParamByName('ondate').Value:=beginDate;
      Parameters.ParamByName('todate').Value:=endDate;
      CommandText:=mainSQL+ #13 + querySQL;
//      ShowMessage(CommandText);
      Open;
    end;
  end;
  cbbindex:=frmQuery.lbCondition.ItemIndex;
end;

procedure TfrmMain.chkoutdutyClick(Sender: TObject);
begin
  if chkoutduty.Checked=True then
    status:=2
  else
    status:=1;
  with DM.adoMain do
  begin
    Close;
    Parameters.ParamByName('status').Value:= status;
    Parameters.ParamByName('ondate').Value:=beginDate;
    Parameters.ParamByName('todate').Value:=endDate;
    CommandText:=mainSQL+#13+ querySQL;
    Open;
  end;
end;

procedure TfrmMain.nAddClick(Sender: TObject);
begin
  try
    frmAddEdit:= TfrmAddEdit.Create(Application);
    frmAddEdit.state:=1;        //新增
    frmAddEdit.ShowModal;
    Self.btnRefreshClick(nil);
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmMain.nEditClick(Sender: TObject);
begin
  try
    frmAddEdit:= TfrmAddEdit.Create(Application);
    frmAddEdit.state:=2;        //编辑
    frmAddEdit.rkey_ptr:=DM.adoMainrkey.Value;
    if frmAddEdit.ShowModal=mrok then
    begin
      Self.btnRefreshClick(nil);
    end;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmMain.nCheckClick(Sender: TObject);
begin
  try
    frmAddEdit:= TfrmAddEdit.Create(Application);
    frmAddEdit.state:=3;        //检查
    frmAddEdit.rkey_ptr:=DM.adoMainrkey.Value;
    frmAddEdit.ShowModal;
  finally
    frmAddEdit.Free;
  end;
end;

procedure TfrmMain.nDeleteClick(Sender: TObject);
var
  i:Integer;
  strRkey:string;
begin
  strRkey:='';

  if MessageDlg('你确定要永久删除选择的记录吗？',mtWarning, [mbYes,mbNo], 0)=mryes then
  begin
    try
      for i:=0 to dbShow.SelectedRows.Count-1 do
      begin
        dbShow.DataSource.DataSet.Bookmark := dbShow.SelectedRows.Items[i];
        strRkey:= IntToStr(dm.adoMainrkey.Value)+','+ strRkey;
      end;
      strRkey:=Copy(strRkey,0,Length(strRkey)-1);
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('delete from hrcertificate where rkey in (' + strRkey +')');
        ExecSQL;
      end;
    except

    end;
    Self.btnRefreshClick(nil);
  end;

end;

procedure TfrmMain.nImportClick(Sender: TObject);
begin
  try
    frmImport:=TfrmImport.Create(Application);
    if frmImport.ShowModal=mrok then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmImport.Free;
  end;
end;

procedure TfrmMain.btnBatClick(Sender: TObject);
begin
  if (vprev='1') or (vprev='3') then
  begin
    ShowMessage('你没有权限操作！');
    Abort;
  end;
  if DM.adoOut.IsEmpty then Exit;
  btnBat.Enabled:=False;
  DM.ADOConnection1.BeginTrans;
  try
    with dm.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update hrcertificate set status = 0 where enddate < ''' + DateToStr(getsystem_date(DM.adoTime,1))+'''');
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
  Self.btnRefreshClick(nil);
  btnBat.Enabled:=True;
end;

procedure TfrmMain.dbShowKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Chr(Key)='V') and (ssalt in Shift) then
    ShowMessage(DM.adoMain.CommandText);
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  nAdd.Enabled:= (vprev='2') or (vprev='4');
  nEdit.Enabled:= (vprev='2') or (vprev='4');
//  nCheck.Enabled:= (vprev='2') or (vprev='4');
  nDelete.Enabled:= (vprev='2') or (vprev='4');
  nImport.Enabled:= (vprev='2') or (vprev='4');
end;

procedure TfrmMain.dbShowMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button=mbRight) then
  begin
//    if (not (ssshift in Shift)) then
      if (dbShow.SelectedRows.Count<=1) then
      begin
        dbShow.SelectedRows.Clear;
        dbShow.SelectedRows.CurrentRowSelected:=True;
      end;
  end;
end;



procedure TfrmMain.btnExport2Click(Sender: TObject);
begin
  if not DM.adoWillOut.IsEmpty then
      Export_dbGridEH_to_Excel(DBGridEh1,'证书即将到期明细');
end;

end.

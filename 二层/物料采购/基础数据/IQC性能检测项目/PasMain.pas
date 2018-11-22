unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus,IdTCPConnection, IdTCPClient, IdFTP;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btnClose: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnQuery: TBitBtn;
    btnField: TBitBtn;
    btnDec: TBitBtn;
    lblFilter: TLabel;
    edtFilter: TEdit;
    ehMain: TDBGridEh;
    ehDetail: TDBGridEh;
    pm1: TPopupMenu;
    pmMain: TPopupMenu;
    nAdd: TMenuItem;
    nEdit: TMenuItem;
    nCheck: TMenuItem;
    nDel: TMenuItem;
    pm2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure btnCloseClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnFieldClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ehMainTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure nAddClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure pm2Popup(Sender: TObject);
    procedure nEditClick(Sender: TObject);
    procedure nCheckClick(Sender: TObject);
    procedure nDelClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure btnDecClick(Sender: TObject);
    procedure ehMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    DStart,DEnd:TDateTime;
    mainSql:string;
    preColumn:TColumnEh;
    procedure itemClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  DEMO,common, PasQuery,DateUtils,DB, PasModify,ADODB, PasCycle,ShellAPI;

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  mainrkey:Integer;
begin
  mainrkey:= DM.adsMainrkey.Value;
  DM.adsMain.Close;
  DM.adsMain.Open;
  if mainrkey>0 then DM.adsMain.Locate('rkey',mainrkey,[]);
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  if  not DM.adsMain.IsEmpty then
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(ehMain,frmMain.Caption);
end;

procedure TfrmMain.btnFieldClick(Sender: TObject);
begin
  pm1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain.btnQueryClick(Sender: TObject);
var
  querySql:string;
  i :Integer;
begin
  if frmQuery=nil then frmQuery:=TfrmQuery.Create(Application);
  frmQuery.dtpkFrom.Date:= DStart;
  frmQuery.dtpkTo.Date:= DEnd;
  if frmQuery.ShowModal=mryes then
  begin
    DStart:=frmQuery.dtpkFrom.Date;
    DEnd:=frmQuery.dtpkTo.Date;
    querySql:='';
    for i:=1 to frmQuery.sgCondition.RowCount-1 do
    begin
      querySql:= frmQuery.sgCondition.Cells[2,i] +#13+ querySql;
    end;
    DM.adsMain.Close;
    DM.adsMain.CommandText:= mainSql + #13 + querySql;
    DM.adsMain.Parameters.ParamByName('d1').Value:=DStart;
    DM.adsMain.Parameters.ParamByName('d2').Value:=DEnd;
    DM.adsMain.Open;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not App_init_2(DM.con1) then
  begin
    ShowMsg('程序启动失败请联系管理员',1);
    application.Terminate;
  end;
  frmMain.Caption:=Application.Title;



//  user_ptr:='3301';
//  rkey73:='3023';
//  vprev:='4';

end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  i:Integer;
  item:TMenuItem ;
begin
  DEnd:= IncDay(common.getsystem_date(DM.qrytmp,1),1);
  DStart:= IncMonth(DEnd,-2);
  mainSql:= DM.adsMain.CommandText;
  preColumn:=ehMain.Columns[0];
  lblFilter.Caption:=preColumn.Title.Caption;
  with DM.adsMain do
  begin
    Close;
    CommandText:= DM.adsMain.CommandText;
    Parameters.ParamByName('d1').Value:= DStart;
    Parameters.ParamByName('d2').Value:= DEnd;
    Open;
  end;
  dm.adsCell.Open;

  for i:=0 to ehMain.Columns.Count-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=ehMain.Columns[i].Title.Caption;
    item.Checked:=ehMain.Columns[i].Visible;
    item.OnClick:= itemClick;
    pm1.Items.Add(item);
  end;
end;

procedure TfrmMain.ehMainTitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker= smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.adsMain.IndexFieldNames:=Column.FieldName + ' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.adsMain.IndexFieldNames:=Column.FieldName;
  end;

  if (Column.Title.Caption<>preColumn.Title.Caption) and
     (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lblFilter.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtFilter.SetFocus;
    edtFilter.Text:='';
    preColumn:=Column;
  end;
end;

procedure TfrmMain.itemClick(Sender: TObject);
var
  i:Integer;
begin
  (Sender as TMenuItem).Checked:= not (Sender as TMenuItem).Checked;
  for i:=0 to ehMain.Columns.Count-1 do
  begin
    if (Sender as TMenuItem).Caption=ehMain.Columns[i].Title.Caption then
    begin
       ehMain.Columns[i].Visible:=(Sender as TMenuItem).Checked;
       Break;
    end;
  end;
end;

procedure TfrmMain.edtFilterChange(Sender: TObject);
begin
  if Trim(edtFilter.Text)<>'' then
  begin
    DM.adsMain.Filtered:=False;
    DM.adsMain.Filter:= preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text) + '%''';
    DM.adsMain.Filtered:=True;
  end
  else
    DM.adsMain.Filter:='';
end;

procedure TfrmMain.nAddClick(Sender: TObject);
var
  LFrm:TfrmDetail;
begin
  LFrm:= TfrmDetail.Create(nil);
  try
    LFrm.Ltype:= 1;
    if LFrm.ShowModal = mrok then btnRefreshClick(nil);
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.N1Click(Sender: TObject);
var
  LTmp:TADOQuery;
  LFTp: TIdFTP;
  LFtpDir,LFileName,LFtpName:string;
  LSaveDlg: TSaveDialog;
begin
  LSaveDlg:= TSaveDialog.Create(nil);
  LTmp:= TADOQuery.Create(nil);
  LTmp.Connection:= dm.con1;
  LFtp:= TIdFTP.Create(nil);
  try
    LFileName:= DM.adsCell.Fields[0].AsString;
    LFtpName:= DM.adsCell.Fields[4].AsString;
//     with DM.qryFileList do
//     begin
//       Close;
//       Parameters[0].Value:= DM.adsMainrkey.Value;
//       open;
//     end;
     with DM.qryFtp do
     begin
       Close;
       Parameters[0].Value:= DM.adsCell.FieldByName('IDKey').AsString;
       Open;
     end;
    LSaveDlg.FileName:= DM.adsCell.Fields[0].AsString;
    if LSaveDlg.Execute then
    begin
      LFileName:= LSaveDlg.FileName;
      with LTmp do
      begin
        Close;
        SQL.Text:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                   ' from tier3_ftplist where rkey = ' + DM.qryFtp.Fields[2].AsString;

        open;
        if not IsEmpty then
        begin
          LFtp.Host := Fields[1].AsString;
          LFtp.Username := Fields[2].AsString;
          LFtp.Password := Fields[3].AsString;
          LFtpDir := Trim(Fields[4].AsString);
        end
        else
        begin
          ShowMessage('没有找到FTP服务器，请联系管理员');
          exit;
        end;
      end;
      try
        if not LFtp.Connected then LFtp.Connect(True,10000);
        if LFTp.Connected then
        begin
//          ShowMessage(LFtpDir+LFtpName +','+LFileName);
  //                LFTp.TransferType:= ftBinary;
          LFTp.Get(LFtpDir+LFtpName,LFileName,True);
          ShellExecute(0,'open',pchar(LFileName),nil,nil,SW_SHOWNORMAL);
          ShowMessage('下载完成！');
        end;
      except
        ShowMessage('FTP链接失败,下载失败');
        Exit;
      end;
    end;
  finally
    if LFTp.Connected then LFTp.Disconnect;
    LSaveDlg.Free;
    LTmp.Free;
    LFTp.Free;
  end;
end;

procedure TfrmMain.pm2Popup(Sender: TObject);
begin
  N1.Enabled:= not DM.adsCell.IsEmpty;
end;

procedure TfrmMain.nEditClick(Sender: TObject);
var
  LFrm:TfrmDetail;
begin
  LFrm:= TfrmDetail.Create(nil);
  try
    LFrm.Ltype:= 2;
    LFrm.btn1.Enabled:= False;
    LFrm.LInit;
    if LFrm.ShowModal = mrok then btnRefreshClick(nil);
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.nCheckClick(Sender: TObject);
var
  LFrm:TfrmDetail;
begin
  LFrm:= TfrmDetail.Create(nil);
  try
    LFrm.Ltype:= 3;
    LFrm.btn1.Enabled:= False;
    LFrm.LInit;
    LFrm.cbbCycle.Enabled:= False;
    LFrm.btnSave.Enabled:= False;

    if LFrm.ShowModal = mrok then btnRefreshClick(nil);
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.nDelClick(Sender: TObject);
begin
  if MessageDlg('确定要删除吗？', mtWarning, [mbYes,mbNo],0) = mryes then
  with Dm.qrytmp do
  begin
    Close;
    SQL.Text:='delete from data0622 where rkey = '+ DM.adsMainrkey.AsString;
    ExecSQL;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  if MessageDlg('确定要生效吗？', mtWarning, [mbYes,mbNo],0) = mryes then
  with Dm.qrytmp do
  begin
    Close;
    SQL.Text:='update data0622 set status = 1 where rkey = '+ DM.adsMainrkey.AsString;
    ExecSQL;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.pmMainPopup(Sender: TObject);
begin
  nAdd.Enabled:= (vprev = '2') or (vprev = '4');
  nEdit.Enabled:= (not DM.adsMain.IsEmpty) and ((vprev = '2') or (vprev = '4')) and (DM.adsMainstatus.AsBoolean = False);
  nCheck.Enabled:= (not DM.adsMain.IsEmpty);
  nDel.Enabled:= (not DM.adsMain.IsEmpty) and ((vprev = '2') or (vprev = '4')) and (DM.adsMainstatus.AsBoolean = False);
  N3.Enabled:= (not DM.adsMain.IsEmpty) and ((vprev = '2') or (vprev = '4')) and (DM.adsMainstatus.AsBoolean = False);
end;

procedure TfrmMain.btnDecClick(Sender: TObject);
var
  LFrm: TfrmCycle;
begin
  Lfrm:= TfrmCycle.Create(nil);
  try
    dm.qryCylce.Close;
    DM.qryCylce.Open;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.ehMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (chr(Key) = 'V') and (ssalt in Shift) then
    showmessage(dm.adsMain.CommandText);
end;

end.

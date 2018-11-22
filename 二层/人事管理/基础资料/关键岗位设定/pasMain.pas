unit pasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btnClose: TBitBtn;
    btnRefresh: TBitBtn;
    lbl1: TLabel;
    edtFilter: TEdit;
    dbMain: TDBGridEh;
    dbDetail: TDBGridEh;
    pm1: TPopupMenu;
    btnExport: TBitBtn;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure dbMainTitleClick(Column: TColumnEh);
  private
    preColumn: TColumnEh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses Demo, pasModify,common,DB;

{$R *.dfm}

procedure TfrmMain.N1Click(Sender: TObject);
var
  LFrm: TfrmModify;
begin
  if (vprev = '1') or (vprev = '3') then
  begin
    ShowMessage('没有权限');
    exit;
  end;
  LFrm:= TfrmModify.Create(nil);
  try
    Lfrm.Caption:= '新增';
    LFrm.status:= 1;
    if LFrm.ShowModal = mrok then
    begin
      btnRefreshClick(nil);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not app_init(DM.con1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;

//  vprev:='2';

  self.caption := application.Title;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  rkey:Integer;
begin
  rkey:= DM.adsMainrkey.AsInteger;
  DM.adsMain.Close;
  DM.adsMain.Open;
  DM.adsMain.Locate('rkey',rkey,[]);
end;

procedure TfrmMain.pm1Popup(Sender: TObject);
begin
  N2.Enabled:= (not DM.adsMain.IsEmpty) and ((vprev = '2') or (vprev = '4')) ;
  N3.Enabled:= N2.Enabled;
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  if not DM.adsMain.IsEmpty then
  begin
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       Export_dbGridEH_to_Excel(dbMain,'关键岗位');
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  DM.adsMain.Close;
  DM.adsMain.Open;
  preColumn:= dbMain.Columns[0];
  lbl1.Caption:= preColumn.Title.Caption;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.N2Click(Sender: TObject);
var
  LFrm: TfrmModify;
begin
  if (vprev = '1') or (vprev = '3') then
  begin
    ShowMessage('没有权限');
    exit;
  end;
  LFrm:= TfrmModify.Create(nil);
  try
    Lfrm.Caption:= '编辑';
    LFrm.status:= 2;
    if LFrm.ShowModal = mrok then
    begin
      btnRefreshClick(nil);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  if MessageDlg('确定要删除吗？',mtWarning,[mbYes,mbNo],0) = mryes then
  begin
    with DM.qryTmp do
    begin
      Close;
      SQL.Text:= 'DELETE FROM hr_KeyPosition WHERE RKEY = '+ DM.adsMainrkey.AsString;
      ExecSQL;
    end;
    btnRefreshClick(nil);
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

procedure TfrmMain.dbMainTitleClick(Column: TColumnEh);
begin
  if (Column.Title.Caption <> preColumn.Title.Caption) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbl1.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtFilter.SetFocus;
    preColumn:=Column;
  end;
end;

end.

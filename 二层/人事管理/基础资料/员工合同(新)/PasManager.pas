unit PasManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons;

type
  TfrmManager = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnQuit: TBitBtn;
    dbManager: TDBGridEh;
    dbTopManager: TDBGridEh;
    Label1: TLabel;
    btnManager: TBitBtn;
    btnTopManager: TBitBtn;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnManagerClick(Sender: TObject);
    procedure btnTopManagerClick(Sender: TObject);
  private
    { Private declarations }
    procedure dbGridEH_to_Excel(dbGrid: TDBGridEh; title_caption: string);
  public
    { Public declarations }
  end;

var
  frmManager: TfrmManager;

implementation

uses DAMO,common,DB,ComObj;

{$R *.dfm}

procedure TfrmManager.dbGridEH_to_Excel(dbGrid: TDBGridEh; title_caption: string);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if not dbgrid.DataSource.DataSet.Active then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
  dbgrid.DataSource.DataSet.DisableControls;
  dbgrid.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to dbgrid.Columns.Count - 1 do
    if dbgrid.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        dbgrid.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not dbgrid.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to dbgrid.Columns.Count - 1 do
      if dbgrid.Columns[iCount].Visible = true then
       begin
        if dbgrid.Columns[iCount].Field.DataType in [ftString,ftWideString,ftDateTime] then
          Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn].NumberFormatLocal:='@';
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          dbgrid.Columns[iCount].Field.AsString;
       end
      else
        inc(v_cloumn);
    Inc(jCount);
    dbgrid.DataSource.DataSet.Next;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrid.DataSource.DataSet.First;
  dbgrid.DataSource.DataSet.EnableControls;
end;

procedure TfrmManager.FormShow(Sender: TObject);
begin
  Panel2.Width:=Round(frmManager.Width/2);
//  Panel3.Width:=Round(frmManager.Width/2)-5;
  dbManager.Height:=Panel2.Height-30;
  dbTopManager.Height:=Panel3.Height-30;
  with DM.adoManager do
  begin
    Close;
    Parameters.ParamByName('userManager').Value:=rkey73;
    Open;
    Sort:='enddate';
  end;
  with DM.adoTopManager do
  begin
    Close;
    Parameters.ParamByName('userTopManager').Value:=rkey73;
    Open;
    Sort:='enddate';
  end;
end;

procedure TfrmManager.FormResize(Sender: TObject);
begin
  Panel2.Width:=Round(frmManager.Width/2);
//  Panel3.Width:=Round(frmManager.Width/2)-5;
  dbManager.Height:=Panel2.Height-30;
  dbTopManager.Height:=Panel3.Height-30;
end;

procedure TfrmManager.btnManagerClick(Sender: TObject);
begin
  if not DM.adoManager.IsEmpty then
  begin
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       dbGridEH_to_Excel(dbManager,'经理级合同');
  end;
end;

procedure TfrmManager.btnTopManagerClick(Sender: TObject);
begin
  if not DM.adoTopManager.IsEmpty then
  begin
    if MessageDlg('你确定要导出数据吗？',mtInformation, [mbYes,mbNo],0)= mryes then
       dbGridEH_to_Excel(dbTopManager,'总经理级合同');
  end;
end;
end.

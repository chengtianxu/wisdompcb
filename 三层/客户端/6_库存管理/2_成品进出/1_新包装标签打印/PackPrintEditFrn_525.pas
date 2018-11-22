unit PackPrintEditFrn_525;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseDBGridEhListFrm,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmPackPrintEdit_525 = class(TfrmBaseDBGridEhList)
    pnl1: TPanel;
    btnSave: TButton;
    btnCancel: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    FPackID: Integer;
    procedure GetData;override;
  end;


var
  frmPackPrintEdit_525: TfrmPackPrintEdit_525;

implementation

uses
  uCommFunc;

{$R *.dfm}

{ TfrmPackPrintEdit_525 }

procedure TfrmPackPrintEdit_525.btnCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPackPrintEdit_525.btnSaveClick(Sender: TObject);
begin
  inherited;
  if cdsMain.State in [dsEdit,dsInsert] then cdsMain.Post;

  if cdsMain.ChangeCount > 0 then
  begin
    if gSvrIntf.IntfPostDataByTable('Pack_PrintTypeDef',cdsMain.Delta) then
    begin
      cdsMain.MergeChangeLog;
      ShowMessage('保存成功');
    end else
      ShowMessage('保存失败');
  end;
end;

procedure TfrmPackPrintEdit_525.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmPackPrintEdit_525 := nil;
end;

procedure TfrmPackPrintEdit_525.GetData;
var
  LSql: string;
  I: Integer;
begin
  inherited;
  LSql := StringReplace(cdsMain.CommandText,':p1',IntToStr(FPackID),[rfReplaceAll, rfIgnoreCase]);
  gSvrIntf.IntfGetDataBySql(LSql,cdsMain);
  for I := 0 to ehMain.Columns.Count - 1 do
    ehMain.Columns[I].Width := 100;
end;

end.

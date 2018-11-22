unit ReportBindFrm_Mod664;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmReportBind_Mod664 = class(TfrmBaseMain)
    mniadd: TMenuItem;
    mniDel: TMenuItem;
    procedure mniaddClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData;override;
  end;

var
  frmReportBind_Mod664: TfrmReportBind_Mod664;

implementation

uses uCommFunc, AddTypeFrm_Mod664;

{$R *.dfm}

{ TfrmReportBind_Mod664 }

procedure TfrmReportBind_Mod664.GetData;
begin
  FMainFrmSql:= cdsMain.CommandText;
  inherited;
end;

procedure TfrmReportBind_Mod664.mniaddClick(Sender: TObject);
var
  LFrm:TfrmAddType_Mod664;
begin
  inherited;
  LFrm:= TfrmAddType_Mod664.Create(nil);
  try
    LFrm.LoadData;
    if LFrm.ShowModal = mrOk then
    begin
      btnRefreshClick(nil);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmReportBind_Mod664.mniDelClick(Sender: TObject);
var
  LSql:string;
  LCds:TClientDataSet;
begin
  inherited;
  LSql:= 'SELECT * FROM DATA0395 WHERE rkey496=' + cdsMain.FieldByName('rkey496').AsString;
  LCds:= TClientDataSet.Create(self);
  try
    if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then Exit;
    if not LCds.IsEmpty then  LCds.Delete;

    if LCds.ChangeCount > 0 then
    if gSvrIntf.IntfPostDataByTable('data0395',LCds.Delta) then
    begin
      LCds.MergeChangeLog;
      ShowMessage('É¾³ý³É¹¦£¡');
      btnRefreshClick(nil);
    end;
  finally
    LCds.Free;
  end;
end;

end.

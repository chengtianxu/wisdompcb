unit uBaseDispachAuthFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, RzEdit, RzBtnEdt, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Datasnap.DBClient,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, uBaseMainFrm, Vcl.Menus,
  uBaseDBGridEhListFrm, Vcl.XPMan;

type
  TfrmBaseDispchAuth = class(TfrmBaseMain)
    mniAddDispath: TMenuItem;
    mniDeleDispathch: TMenuItem;
    procedure mniAddDispathClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure mniDeleDispathchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData;override;
  end;

implementation

uses
  uCommFunc, uBaseAddDispatchFrm;

{$R *.dfm}


procedure TfrmBaseDispchAuth.btnExitClick(Sender: TObject);
begin
  //inherited;
  Close;
end;

procedure TfrmBaseDispchAuth.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //

end;

procedure TfrmBaseDispchAuth.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;
  FWhere2 := ' AND Tier3_UserAddsModOperator.ModID = ' + IntToStr(FModID);
             //' AND Tier3_UserModAuthCards.D73_Ptr = ' + gVar.rkey73;
  FOrderby := ' Order By d34.rkey,d73_2.rkey';
  inherited;
end;

procedure TfrmBaseDispchAuth.mniAddDispathClick(Sender: TObject);
var
  LFrm: TfrmAddNewDispathOperator;
begin
  inherited;
  LFrm := TfrmAddNewDispathOperator.Create(Self);
  try
    LFrm.FModID := FModID;
    LFrm.GetData(IntToStr(FModID));
    if LFrm.ShowModal = mrOk then
    begin

    end;
    GetData;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmBaseDispchAuth.mniDeleDispathchClick(Sender: TObject);
var
  LCds: TClientDataSet;
begin
  inherited;
  LCds := TClientDataSet.Create(Self);
  try
    if gSvrIntf.IntfGetDataBySql('SELECT  * FROM Tier3_UserAddsModOperator WHERE IDKey = ' + QuotedStr(cdsMain.FieldByName('IDKey').AsString),LCds) then
    begin
      if not LCds.IsEmpty then
      begin
        LCds.Delete;
        if gSvrIntf.IntfPostDataByTable('Tier3_UserAddsModOperator',LCds.Delta) then
        begin
          cdsMain.Delete;
          cdsMain.MergeChangeLog;
        end;
      end;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmBaseDispchAuth.pmMainPopup(Sender: TObject);
begin
  inherited;
  mniDeleDispathch.Enabled := not cdsMain.IsEmpty;
end;

end.

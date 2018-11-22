unit PasViewCredit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,PasPublic,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient,uBaseFrm,ucommfunc,uBaseSinglePickListFrm;

type
  TfrmViewCredit = class(TfrmBase)
    Panel2: TPanel;
    spBtnExport: TSpeedButton;
    spBtnQuery: TSpeedButton;
    Label5: TLabel;
    SpeedButton4: TSpeedButton;
    edtCustId: TEdit;
    Panel4: TPanel;
    spBtnExit: TSpeedButton;
    DBGridEh1: TDBGridEh;
    dsCalcCREDIT: TDataSource;
    cdsCalcCREDIT: TClientDataSet;
    procedure spBtnExitClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure spBtnQueryClick(Sender: TObject);
    procedure spBtnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    LsWhere:Integer;
    { Public declarations }
    procedure GetData;
  end;

var
  frmViewCredit: TfrmViewCredit;

implementation

{$R *.dfm}

procedure TfrmViewCredit.GetData;
var LPostData: OleVariant;
begin
  LPostData := VarArrayCreate([0,2],varVariant);
  LPostData[0] :=edtCustId.text;
  LPostData[1] :=gVar.rkey73;
  LPostData[2] :=LsWhere; //权限设置可见全部或个人
  gSvrIntf.IntfspGetData('Calc_CREDIT',LPostData,cdsCalcCREDIT);
end;

procedure TfrmViewCredit.spBtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmViewCredit.spBtnExportClick(Sender: TObject);
begin
  PasPublic.Export_dbGridEH_to_Excel(DBGridEh1);
end;

procedure TfrmViewCredit.spBtnQueryClick(Sender: TObject);
begin
  inherited;
  GetData;
end;

procedure TfrmViewCredit.SpeedButton4Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin

  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,1,'');
    if LFrm.ShowModal = mrOk then
    begin
      if LFrm.cdsPick.RecordCount>0 then
      begin
        edtCustId.Text:=LFrm.cdsPick.FieldByName('CUST_CODE').AsString;//
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

end.

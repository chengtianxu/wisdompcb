unit qk1909001Edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditVGridFrm, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, EhLibVCL, GridsEh, DBAxisGridsEh, DBVertGridsEh,
  Vcl.ExtCtrls, RzButton, RzPanel, qkBaseEditFrm, RzEdit, Vcl.StdCtrls,
  Vcl.Mask, RzDBEdit, RzLabel, RzRadChk, RzDBChk, Vcl.DBCtrls;

type
  Tfrmqk1909001Edit = class(Tfrmqkbaseedit)
    lbl3: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edtCurr_Code: TDBEdit;
    edtCurr_ChsName: TDBEdit;
    edt1: TRzEdit;
    edt3: TRzEdit;
    edt4: TRzEdit;
    edt5: TRzEdit;
    lbl5: TLabel;
    ds1: TDataSource;
    mt1: TFDMemTable;
    dtpTDate: TRzDBDateTimeEdit;
    cbxIsBase: TRzDBCheckBox;
    edtRateTobase: TEdit;
    edtBaseToRate: TEdit;
    edtPrice_RateToBase: TEdit;
    edtPrice_basetoRate: TEdit;
    procedure edtCurr_CodeChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtRateTobaseChange(Sender: TObject);
    procedure edtPrice_RateToBaseChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function InitEdit(AIDKey: int64): boolean;
  end;

var
  frmqk1909001Edit: Tfrmqk1909001Edit;

implementation

uses
  qkSvrIntf.ClientIntf,qkFunc.Commfunc;

{$R *.dfm}

procedure Tfrmqk1909001Edit.btnSaveClick(Sender: TObject);
begin
  mt1.Edit;
  mt1.FieldByName('BaseToRate').AsString := edtBaseToRate.Text;
  mt1.FieldByName('RateTobase').AsString := edtRateTobase.Text;
  mt1.FieldByName('Price_basetoRate').AsString := edtPrice_basetoRate.Text;
  mt1.FieldByName('Price_RateToBase').AsString := edtPrice_RateToBase.Text;
  mt1.Post;
  qkCommfunc.SetCurrIDKey(mt1);
  inherited;
end;

procedure Tfrmqk1909001Edit.edtCurr_CodeChange(Sender: TObject);
begin
  inherited;
  edt1.Text := edtCurr_Code.Text + '/本位币';
  edt3.Text := '本位币/' + edtCurr_Code.Text;
  edt4.Text := edt1.Text;
  edt5.Text := edt3.Text;
end;

procedure Tfrmqk1909001Edit.edtPrice_RateToBaseChange(Sender: TObject);
begin
  inherited;
  if StrToFloatdef(edtPrice_RateToBase.Text,0) = 0 then
  begin
    edtPrice_basetoRate.Text := '0';
  end else
  begin
    edtPrice_basetoRate.Text := qkCommfunc.FloatToString(1/ StrToFloat(edtPrice_RateToBase.Text));
  end;
end;

procedure Tfrmqk1909001Edit.edtRateTobaseChange(Sender: TObject);
begin
  inherited;
  if StrToFloatdef(edtRateTobase.Text,0) = 0 then
  begin
    edtBaseToRate.Text := '0';
  end else
  begin
   edtBaseToRate.Text := qkCommfunc.FloatToString(1/ StrToFloat(edtRateTobase.Text));
  end;
end;

procedure Tfrmqk1909001Edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmqk1909001Edit := nil;
end;

function Tfrmqk1909001Edit.InitEdit(AIDKey: int64): boolean;
begin
  Result := False;
  if not qkDataIntf.GetTableData(mt1,'gBase_Curr',' IDKey = ' + AIDKey.ToString) then
    exit;

  edtBaseToRate.Text := mt1.FieldByName('BaseToRate').AsString;
  edtRateTobase.Text := mt1.FieldByName('RateTobase').AsString;
  edtPrice_basetoRate.Text := mt1.FieldByName('Price_basetoRate').AsString;
  edtPrice_RateToBase.Text := mt1.FieldByName('Price_RateToBase').AsString;

  PostTableArr := 'gBase_Curr';
  PostDsList.Add(mt1);
  Result := true;
end;

end.

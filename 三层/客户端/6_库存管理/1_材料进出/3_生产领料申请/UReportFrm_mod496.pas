unit UReportFrm_mod496;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxPreview, Data.DB,
  Data.Win.ADODB, Datasnap.Provider, frxDBSet, Datasnap.DBClient, ucommfunc;

type
TAfterPtintEvent_Mod496 = procedure of object;
  TfrmReport_mod496 = class(TForm)
    frxdbdtst268: TfrxDBDataset;
    frxdbdtst468: TfrxDBDataset;
    cds268: TClientDataSet;
    cds468: TClientDataSet;
    frxrprt1: TfrxReport;
    qry1: TADOQuery;
    qry1RKEY: TAutoIncField;
    qry1CUT_NO: TStringField;
    qry1SO_NO: TStringField;
    qry1FLOW_NO: TIntegerField;
    qry1STEP: TSmallintField;
    qry1DEPT_PTR: TIntegerField;
    qry1INVENT_PTR: TIntegerField;
    qry1QUAN_BOM: TFloatField;
    qry1STATUS: TSmallintField;
    qry1PRINTIT: TStringField;
    qry1VENDOR: TStringField;
    qry1Invent_or: TSmallintField;
    qry1quan_alloc: TBCDField;
    qry1overproof: TWordField;
    qry1INV_PART_NUMBER: TStringField;
    qry1INV_PART_DESCRIPTION: TStringField;
    qry1unit_name: TStringField;
    qry1PRINTIT_S: TStringField;
    qry1control_ptr: TIntegerField;
    qry1control_name: TStringField;
    qry1remark: TStringField;
    qry1supplier_ptr: TIntegerField;
    qry1ExReason: TStringField;
    qry1standards: TStringField;
    qry1quan_onhand: TFloatField;
    qry1QUAN_ISSUED: TStringField;
    procedure frxrprt1AfterPrintReport(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  FAfterPtint:  TAfterPtintEvent_Mod496;
    procedure GetData(srkey: string);
  end;

var
  frmReport_mod496: TfrmReport_mod496;

implementation

{$R *.dfm}
{ TfrmReport_mod496 }

procedure TfrmReport_mod496.frxrprt1AfterPrintReport(Sender: TObject);
begin
 FAfterPtint;
end;

procedure TfrmReport_mod496.GetData(srkey: string);
begin
  //
  gSvrintf.IntfGetDataBySql(cds268.CommandText + ' and data0268.rkey=' +
    srkey, cds268);
  gSvrintf.IntfGetDataBySql(cds468.CommandText + ' and data0468.flow_no=' +
    srkey, cds468);

end;

end.

unit ufrmDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppEndUsr, ppDB, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppVar;

type
  TfrmDetail = class(TForm)
    DB526: TppDBPipeline;
    ppDesigner1: TppDesigner;
    DataSource1: TDataSource;
    ds526: TADODataSet;
    ds526RKEY: TAutoIncField;
    ds526VOUCHER: TStringField;
    ds526TDATE: TDateTimeField;
    ds526DESCRIPTION: TStringField;
    ds526DEBIT: TBCDField;
    ds526CREDIT: TBCDField;
    ds526DB_CR: TStringField;
    ds526BALANCE: TBCDField;
    ds526CURR_CODE: TStringField;
    ds526EXCH_RATE: TFloatField;
    ds526D_QTY: TFloatField;
    ds526C_QTY: TFloatField;
    ds526PRICE: TFloatField;
    ds526AMOUNT: TBCDField;
    ds526CLOSE_QTY: TFloatField;
    ds526REF_NUMBER: TStringField;
    ds526gl_acct_ptr: TFloatField;
    ds526remark: TStringField;
    ds526orig_amount: TBCDField;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLabel11: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLabel15: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine6: TppLine;
    ppLine22: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLine7: TppLine;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine24: TppLine;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppLine3: TppLine;
    ppLine23: TppLine;
    ppLine1: TppLine;
    ppLine19: TppLine;
    ppLine5: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel2: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetail: TfrmDetail;

implementation

{$R *.dfm}

end.

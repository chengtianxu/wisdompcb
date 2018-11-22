unit OrderDetailFrm_mod284;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Data.DB, Datasnap.DBClient,uCommFunc,
  Data.Win.ADODB;

type
  TfrmOrderDetail_mod284 = class(TfrmBase)
    CdsOrderDetail: TClientDataSet;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    edt_ENT_DATE: TRKeyRzBtnEdit;
    edt_SALES_ORDER: TRKeyRzBtnEdit;
    edt_ORIG_REQUEST_DATE: TRKeyRzBtnEdit;
    edt_ORIG_SCHED_SHIP_DATE: TRKeyRzBtnEdit;
    edt_SCH_DATE: TRKeyRzBtnEdit;
    edt_PRODUCT_NAME: TRKeyRzBtnEdit;
    edt_PO_DATE: TRKeyRzBtnEdit;
    edt_PO_NUMBER: TRKeyRzBtnEdit;
    edt_MANU_PART_NUMBER: TRKeyRzBtnEdit;
    edt_CUST_CODE: TRKeyRzBtnEdit;
    edt_MANU_PART_DESC: TRKeyRzBtnEdit;
    edt_PARTS_ORDERED: TRKeyRzBtnEdit;
    edt_TO_BE_CONFIRMED: TRKeyRzBtnEdit;
    edt_EXCH_RATE: TRKeyRzBtnEdit;
    edt_CURR_NAME: TRKeyRzBtnEdit;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    dsOrderDetail: TDataSource;
    qrySql: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure getdata(ARkey:string);
  end;

var
  frmOrderDetail_mod284: TfrmOrderDetail_mod284;

implementation

{$R *.dfm}

{ TfrmOrderDetail_mod284 }

procedure TfrmOrderDetail_mod284.Getdata(Arkey: string);
var
  Lsql:string;
begin
  Lsql:= qrySql.SQL.Text+ ' WHERE  data0060.rkey= '+ARkey ;
 //showmessage(Lsql);
  gSvrIntf.IntfGetDataBySql(Lsql,CdsOrderDetail) ;



end;

end.

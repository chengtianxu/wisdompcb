unit SelShipAddrFrm_mod284;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm,uCommFunc, Data.DB,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.DBCGrids,
  Vcl.Buttons, Vcl.ExtCtrls, Datasnap.DBClient;

type
  TfrmSelShipAddr_mod284 = class(TfrmBase)
    pnl1: TPanel;
    lbl1: TLabel;
    edt_qry: TEdit;
    btn_Reset: TBitBtn;
    pnl2: TPanel;
    btn2: TButton;
    btn3: TButton;
    dbctrlgrd1: TDBCtrlGrid;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    dbedt_location: TDBEdit;
    dbedt_state: TDBEdit;
    dbedt_zip: TDBEdit;
    dbmmo_ship_to_address_1: TDBMemo;
    ds1: TDataSource;
    cds1: TClientDataSet;
    procedure btn_ResetClick(Sender: TObject);
    procedure edt_qryChange(Sender: TObject);
    procedure dbctrlgrd1DblClick(Sender: TObject);
    procedure edt_qryKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(arkey10:string);
  end;

var
  frmSelShipAddr_mod284: TfrmSelShipAddr_mod284;

implementation

{$R *.dfm}

procedure TfrmSelShipAddr_mod284.btn_ResetClick(Sender: TObject);
begin
  inherited;
 edt_qry.Text:='';
 edt_qry.SetFocus;
end;

procedure TfrmSelShipAddr_mod284.dbctrlgrd1DblClick(Sender: TObject);
begin
  inherited;
if not cds1.IsEmpty then ModalResult:=mrok;
end;

procedure TfrmSelShipAddr_mod284.edt_qryChange(Sender: TObject);
begin
  inherited;
 if trim(edt_qry.text)<>'' then
  cds1.Filter :=' location like '''+Trim(edt_qry.Text)+'%'''
 else
  cds1.filter:='';
if cds1.IsEmpty then
 btn_Reset.Enabled:=false
else
 btn_Reset.Enabled:=true;
end;

procedure TfrmSelShipAddr_mod284.edt_qryKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if (key=13) and (not cds1.IsEmpty) then ModalResult:=mrok;
end;

procedure TfrmSelShipAddr_mod284.GetData(arkey10: string);
var
Lsql:string;
begin
  Lsql:='select rkey,location,ship_to_address_1,state,zip,SHIP_CTAX_PTR, '+
' SHIP_TO_CONTACT,SHIP_TO_PHONE,SHIP_SHIPPING_METHOD,SHIP_FOB,ship_lead_time'+
' from data0012 where customer_ptr='+ arkey10+
' order by location ';
  gSvrintf.IntfGetDataBySql(Lsql, cds1);
end;

end.

unit uWoShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls, Menus, DB, ADODB, DBGridEh, ExtCtrls;

type
  TFrmWoShow = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DBGridEh1: TDBGridEh;
    ADS464_LIST: TADODataSet;
    DataSource1: TDataSource;
    ADS464_LISTWORK_ORDER_NUMBER: TStringField;
    ADS464_LISTMATL_COST: TFloatField;
    ADS464_LISTOVHD_COST: TFloatField;
    ADS464_LISTQUAN_PROD: TIntegerField;
    ADS464_LISTsquare: TFloatField;
    ADS464_LISTAMOUNT: TFloatField;
    ADS464_LISTWO_PTR: TIntegerField;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    ADS464_LISTdragin_cost: TFloatField;
    ADS464_LISTscap_cost: TFloatField;
    ADS464_LISToutsource_cost: TFloatField;
    ADS464_LISTovhd1_cost: TFloatField;
    ADS464_LISToutsource_pcs: TFloatField;
    ADS464_LISTtotal_cost: TFloatField;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure SetStrGridTitl();
  public

  end;

var
  FrmWoShow: TFrmWoShow;

implementation

uses uMD, Unit_lot;

{$R *.dfm}

procedure TFrmWoShow.BitBtn2Click(Sender: TObject);
begin
 self.Close ;
end;

procedure TFrmWoShow.SetStrGridTitl();
begin

end;

procedure TFrmWoShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
self.ADS464_LIST.Close;
end;

procedure TFrmWoShow.N1Click(Sender: TObject);
begin
 try
  Form_lot:=tForm_lot.Create(application);
  Form_lot.ADO410_16.close;
  Form_lot.ADO410_16.Parameters.ParamByName('rkey06').Value:=self.ADS464_LISTWO_PTR.Value;
  Form_lot.ADO410_16.Open;
  Form_lot.ShowModal;
 finally
  Form_lot.ADO410_16.close;
  Form_lot.Free;
 end;
end;

procedure TFrmWoShow.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ADS464_LIST.CommandText);
end;

end.

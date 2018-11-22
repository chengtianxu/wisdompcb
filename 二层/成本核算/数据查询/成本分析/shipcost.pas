unit shipcost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, DB, ADODB, Menus;

type
  Tfrm_shipcost = class(TForm)
    ADS52: TADODataSet;
    DataSource1: TDataSource;
    ADS52SHIPMENT_NO: TSmallintField;
    ADS52DATE_ASSIGN: TDateTimeField;
    ADS52QUAN_SHP: TFloatField;
    ADS52WORK_ORDER_NUMBER: TStringField;
    ADS52WORK_ORDER_PTR: TIntegerField;
    ADS52LOCATION: TStringField;
    ADS52MATL_COST: TFloatField;
    ADS52OVHD_COST: TFloatField;
    ADS52PLANNED_QTY: TFloatField;
    ADS52cost_pcs: TFloatField;
    ADS52total_cost_pcs: TFloatField;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    ADS52ship_cost: TFloatField;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ADS52ovhd1_pcs: TFloatField;
    ADS52outsource_pcs: TFloatField;
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_shipcost: Tfrm_shipcost;

implementation

uses uMD,common, Unit_lot;

{$R *.dfm}

procedure Tfrm_shipcost.BitBtn2Click(Sender: TObject);
begin
 common.Export_dbGridEH_to_Excel(DBGridEh1,Self.Caption);
end;

procedure Tfrm_shipcost.N1Click(Sender: TObject);
begin
 if ADS52WORK_ORDER_PTR.Value >0 then
 try
  Form_lot:=tForm_lot.Create(application);
  Form_lot.ADO410_16.close;
  Form_lot.ADO410_16.Parameters.ParamByName('rkey06').Value:=ADS52WORK_ORDER_PTR.Value;
  Form_lot.ADO410_16.Open;
  Form_lot.ShowModal;
 finally
  Form_lot.ADO410_16.close;
  Form_lot.Free;
 end;
end;

procedure Tfrm_shipcost.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ADS52.CommandText);
end;

end.

unit costdetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, DB, ExtCtrls, ADODB;

type
  TForm_costdetail = class(TForm)
    DataSource1: TDataSource;
    ads52: TADODataSet;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    ads52WORK_ORDER_NUMBER: TStringField;
    ads52QUAN_SHP: TFloatField;
    ads52MATL_COST: TFloatField;
    ads52OVHD_COST: TFloatField;
    ads52PO_NUMBER: TStringField;
    ads52REFERENCE_NUMBER: TStringField;
    ads52MFG_DATE: TDateTimeField;
    ads52LOCATION: TStringField;
    ads52cost_2: TFloatField;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_costdetail: TForm_costdetail;

implementation

uses damo;

{$R *.dfm}

procedure TForm_costdetail.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS52.CommandText);
end;

end.

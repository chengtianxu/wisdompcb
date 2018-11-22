unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh;

type
  TFrm_detail = class(TForm)
    DBGridEh1: TDBGridEh;
    ADS209: TADODataSet;
    DataSource1: TDataSource;
    ADS209goods_name: TStringField;
    ADS209goods_guige: TStringField;
    ADS209goods_type: TStringField;
    ADS209ABBR_NAME: TStringField;
    ADS209QUANTITY: TFloatField;
    ADS209UNIT_NAME: TStringField;
    ADS209TDATE: TDateTimeField;
    ADS209Expr1: TStringField;
    ADS209remark: TWideStringField;
    ADS209shipping_method: TWideStringField;
    ADS209tran_date: TDateTimeField;
    ADS209EMPLOYEE_NAME: TStringField;
    ADS209CODE: TStringField;
    ADS209REJECT_DESCRIPTION: TStringField;
    ADS209v_state: TStringField;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_detail: TFrm_detail;

implementation

uses damo;

{$R *.dfm}

procedure TFrm_detail.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADS209.CommandText);
end;

end.

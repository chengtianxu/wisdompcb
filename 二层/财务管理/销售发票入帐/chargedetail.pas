unit chargedetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Excel2000,ClipBrd, DB, ADODB, Grids,  StdCtrls, Buttons,
  DateUtils,math, ExtCtrls, DBGrids;

type
  TFrm_chargedetail = class(TForm)
    PanelTOP: TPanel;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1REFERENCE_NO: TStringField;
    ADOQuery1VOUCHER: TStringField;
    ADOQuery1STATUS: TSmallintField;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1TDATE: TDateTimeField;
    ADOQuery1REMARK: TStringField;
    ADOQuery1status114: TWordField;
    ADOQuery1CURR_CODE: TStringField;
    ADOQuery1CURR_NAME: TStringField;
    ADOQuery1EXCHANGE_RATE: TFloatField;
    ADOQuery1BANK_NAME: TStringField;
    ADOQuery1TTYPE: TWordField;
    ADOQuery1AMOUNT: TFloatField;
    ADOQuery1BAL_AMOUNT: TFloatField;
    ADOQuery1dz_amount: TFloatField;
    ADOQuery1WAREHOUSE_CODE: TStringField;
    ADOQuery1abbrname15: TStringField;
    ADOQuery1v_ttype: TStringField;
    ADOQuery1v_status: TStringField;
    ADOQuery1v_status114: TStringField;
    ADOQuery1DEBIT_AMOUNT: TFloatField;
    ADOQuery1stand_amount: TFloatField;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_chargedetail: TFrm_chargedetail;

implementation
 uses damo,common;
{$R *.dfm}

procedure TFrm_chargedetail.FormShow(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Parameters.ParamByName('INV_PTR').Value:=DM.AqD112RKEY.Value;
  ADOQuery1.Open;
end;

procedure TFrm_chargedetail.BitBtn1Click(Sender: TObject);
begin
Close;
end;



procedure TFrm_chargedetail.BitBtn2Click(Sender: TObject);
begin
 common.Export_dbGrid_to_Excel(self.DBGrid1,self.Caption);
end;

procedure TFrm_chargedetail.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ADOQuery1.SQL.Text);
end;

end.

unit receviable_details;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, ComCtrls, StdCtrls, ExtCtrls;

type
  TForm4 = class(TForm)
    pnl1: TPanel;
    btn1: TButton;
    btn2: TButton;
    lbl1: TLabel;
    Edit1: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    DBGridEh1: TDBGridEh;
    ADO115: TADODataSet;
    DS115: TDataSource;
    strngfldADO115REFERENCE_NO: TStringField;
    strngfldADO115VOUCHER: TStringField;
    ADO115STATUS: TSmallintField;
    ADO115RKEY: TAutoIncField;
    ADO115TDATE: TDateTimeField;
    strngfldADO115REMARK: TStringField;
    ADO115status114: TWordField;
    strngfldADO115CURR_CODE: TStringField;
    strngfldADO115CURR_NAME: TStringField;
    ADO115EXCHANGE_RATE: TFloatField;
    strngfldADO115BANK_NAME: TStringField;
    strngfldADO115CUST_CODE: TStringField;
    strngfldADO115ANALYSIS_CODE4: TStringField;
    strngfldADO115ANALYSIS_CODE5: TStringField;
    strngfldADO115CUSTOMER_NAME: TStringField;
    strngfldADO115ABBR_NAME: TStringField;
    strngfldADO115FED_TAX_ID_NO: TStringField;
    ADO115TTYPE: TWordField;
    ADO115BAL_AMOUNT: TFloatField;
    ADO115dz_amount: TFloatField;
    strngfldADO115WAREHOUSE_CODE: TStringField;
    strngfldADO115abbrname15: TStringField;
    strngfldADO115v_ttype: TStringField;
    strngfldADO115v_status: TStringField;
    strngfldADO115v_status114: TStringField;
    ADO115DEBIT_AMOUNT: TFloatField;
    ADO115stand_amount: TFloatField;
    strngfldADO115NUMBER: TStringField;
    ADO115MX_amount: TBCDField;
    ADO115APPL_CASH_DISC: TBCDField;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtp1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
     preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses main,common,DAMO ;

{$R *.dfm}

procedure TForm4.btn2Click(Sender: TObject);
begin
 if not ADO115.IsEmpty then
    Export_dbGridEH_to_Excel(DBGridEh1,Application.Title);
end;

procedure TForm4.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  preColumn:=DBGridEh1.Columns[0];
  lbl1.Caption:=preColumn.Title.Caption;
end;

 
procedure TForm4.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    ADO115.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    ADO115.IndexFieldNames:=Column.FieldName;
  end;
  if Column.Tag<>1 then
  begin
    if Column.FieldName<>preColumn.FieldName then
    begin
      lbl1.Caption:=Column.Title.Caption;
      Column.Title.Color:=clRed;
      preColumn.Title.Color:=clBtnFace;
      preColumn:=Column;
      Edit1.SetFocus;
      Edit1.Text:='';
    end;
  end;
end;

procedure TForm4.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADO115.CommandText);
end;

procedure TForm4.dtp1Change(Sender: TObject);
begin
  WITH ADO115 do
  begin
    Close;
    parameters.ParamByName('vdate3').Value:=FormatDateTime('YYYY-MM-DD',dtp1.Date);
    parameters.ParamByName('vdate4').Value:=FormatDateTime('YYYY-MM-DD',dtp2.Date+1);
    Prepared;
    Open;
  end;
  ADO115.Open;
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    ADO115.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    ADO115.Filter:='';
end;

end.

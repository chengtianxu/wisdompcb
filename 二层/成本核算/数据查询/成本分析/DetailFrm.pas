unit DetailFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, Buttons, ExtCtrls, DB, ADODB;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    ADODataSet1SALES_ORDER: TStringField;
    ADODataSet1PO_NUMBER: TStringField;
    ADODataSet1MANU_PART_NUMBER: TStringField;
    ADODataSet1MANU_PART_DESC: TStringField;
    ADODataSet1DATE_ASSIGN: TDateTimeField;
    ADODataSet1QUAN_SHP: TFloatField;
    ADODataSet1CUST_CODE: TStringField;
    ADODataSet1EMPLOYEE_NAME: TStringField;
    ADODataSet1DSDesigner: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
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

uses uMD,common;

{$R *.dfm}

procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_detail.SpeedButton4Click(Sender: TObject);
begin
  if not ADODataSet1.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
    Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TFrm_detail.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADODataSet1.CommandText);
end;

end.

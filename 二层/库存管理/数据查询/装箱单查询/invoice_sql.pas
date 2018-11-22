unit invoice_sql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, ExtCtrls,ComObj,Excel2000,ClipBrd,
  Buttons;

type
  TForm4 = class(TForm)
    ADO112: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    ADO112invoice_number: TStringField;
    ADO112EMPLOYEE_NAME: TStringField;
    ADO112CURR_CODE: TStringField;
    ADO112EXCHANGE_RATE: TFloatField;
    ADO112ship_amount: TBCDField;
    ADO112DISCOUNT_AMOUNT: TBCDField;
    ADO112SHIPPING_CHARGES: TBCDField;
    ADO112FED_TAX_AMOUNT: TBCDField;
    ADO112INVOICE_TOTAL: TBCDField;
    ADO112total_paid_amount: TBCDField;
    ADO112delivery_no: TStringField;
    ADO112INVOICE_DATE: TDateTimeField;
    ADO112due_date: TDateTimeField;
    ADO112date_sailing: TDateTimeField;
    ADO112shipping_method: TStringField;
    ADO112DSDesigner: TStringField;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses main, report_pk,common;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
 form1.Show;
 close;
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
 Shift: TShiftState);
begin
if (chr(key)='S') and (ssalt in shift) then
 showmessage(ado112.SQL.Text);
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 {应增加程序判断用户的权限是否可以显示价格字段}

 ado112.DisableControls;
 form_report.ppReport3.Print;
 ado112.EnableControls;
finally
 form_report.free;
end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
      Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
 form1.Show;
 close;
end;

procedure TForm4.BitBtn4Click(Sender: TObject);
begin
      Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
    try
         form_report:=tform_report.Create(application);
         {应增加程序判断用户的权限是否可以显示价格字段}

         ado112.DisableControls;
         form_report.ppReport3.Print;
         ado112.EnableControls;
    finally
          form_report.free;
    end;
end;

end.

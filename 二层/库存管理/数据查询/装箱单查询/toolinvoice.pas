unit toolinvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, ExtCtrls,ComObj,Excel2000,ClipBrd,
  Buttons;

type
  TForm5 = class(TForm)
    ADO112: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADO112invoice_number: TStringField;
    ADO112INVOICE_TOTAL: TFloatField;
    ADO112CUST_CODE: TStringField;
    ADO112INVOICE_DATE: TDateTimeField;
    ADO112SALES_ORDER: TStringField;
    ADO112PO_NUMBER: TStringField;
    ADO112PO_DATE: TDateTimeField;
    ADO112ship_tax_amount: TFloatField;
    ADO112TOOLING_CHARGES: TFloatField;
    Panel1: TPanel;
    ADO112due_date: TDateTimeField;
    ADO112total_paid_amount: TBCDField;
    ADO112EXCHANGE_RATE: TFloatField;
    ADO112CURR_CODE: TStringField;
    ADO112DSDesigner: TStringField;
    ADO112DSDesigner2: TStringField;
    ADO112MANU_PART_NUMBER: TStringField;
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
  Form5: TForm5;

implementation
uses main, report_pk,common;
{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
 form1.Show;
 close;
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm5.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='S') and (ssalt in shift) then
 showmessage(ado112.SQL.Text);
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 {应增加程序判断用户的权限是否可以显示价格字段}

 ado112.DisableControls;
 form_report.ppReport4.Print;
 ado112.EnableControls;
finally
 form_report.free;
end;
end;

procedure TForm5.Button2Click(Sender: TObject);

 begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption);
  end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
 form1.Show;
 close;
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin
      Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
      try
           form_report:=tform_report.Create(application);
           {应增加程序判断用户的权限是否可以显示价格字段}

           ado112.DisableControls;
           form_report.ppReport4.Print;
           ado112.EnableControls;
      finally
            form_report.free;
      end;
end;

end.

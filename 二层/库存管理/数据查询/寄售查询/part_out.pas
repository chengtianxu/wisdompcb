unit part_out;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj, Excel2000,ClipBrd,
  Buttons, Menus;

type
  TForm3 = class(TForm)
    ado52: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label5: TLabel;
    ado52PRINT_NUMBER: TStringField;
    ado52MANU_PART_NUMBER: TStringField;
    ado52MANU_PART_DESC: TStringField;
    ado52EMPL_CODE: TStringField;
    ado52EMPLOYEE_NAME: TStringField;
    ado52ENT_DATE: TDateTimeField;
    ado52personnel_name: TStringField;
    ado52BRING_DATE: TDateTimeField;
    ado52QUANTITY: TIntegerField;
    ado52AMOUNT: TBCDField;
    ado52REMARK: TStringField;
    ado52receipt_number: TStringField;
    ado52CUST_CODE: TStringField;
    ado52CUSTOMER_NAME: TStringField;
    ado52CURR_CODE: TStringField;
    ado52ABBR_NAME: TStringField;
    ado52CURR_NAME: TStringField;
    ado52OUT_QTY: TIntegerField;
    ado52OUT_PRICE: TBCDField;
    ado52IN_PRICE: TBCDField;
    ado52cajia: TBCDField;
    ado52OUT_AMOUNT: TBCDField;
    ado52IN_AMOUNT: TBCDField;
    ado52cae: TBCDField;
    ado52RECE_NUMBER: TStringField;
    ado52DETAIL_REMARK: TStringField;
    ado52SALES_ORDER: TStringField;
    ado52PO_NUMBER: TStringField;
    ado52ANALYSIS_CODE_2: TStringField;
    ado52delivery_no: TStringField;
    ado52unit_sq: TFloatField;
    ado52SHIP_PTR: TIntegerField;
    ado52PROD_CODE: TStringField;
    ado52PRODUCT_NAME: TStringField;
    ado52OUTArea: TFloatField;
    ado52MFG_DATE: TDateTimeField;
    btnColumn: TBitBtn;
    pmColumn: TPopupMenu;
    ado52TAX_RATE: TBCDField;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnColumnClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Item_Click(Sender: TObject);
    procedure SetColumn(Sender: TObject);
  end;

var
  Form3: TForm3;

implementation
uses main, partin_report,common;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
 form1.Show;
 close;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form1.Show;
end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado52.SQL.Text);
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 if strtoint(vprev)<=2 then       //х╗оч
  begin
   form_report.ppDBText26.Visible:=false;
   form_report.ppDBText11.Visible:=false;
   form_report.ppDBCalc4.Visible:=false;
  end;

 ado52.DisableControls;
 form_report.ppReport3.Print;
 ado52.EnableControls;
finally
 form_report.free;
end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm3.DBGrid1TitleClick(Column: TColumn);
begin
  ado52.Sort:=Column.FieldName;
end;

procedure TForm3.btnColumnClick(Sender: TObject);
begin
  pmColumn.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm3.Item_Click(Sender: TObject);
var
  i:byte;
begin
  (sender as TMenuItem).Checked := not ((sender as TMenuItem).Checked);
  if (sender as TMenuItem).Checked then
  begin
    for i:= 0 to DBGrid1.FieldCount - 1 do
    if DBGrid1.Columns[i].Title.Caption = (sender as TMenuItem).Caption then
    begin
      DBGrid1.Columns[i].Visible:= True;
      break;
    end;
  end
  else
  begin
    for i:= 0 to DBGrid1.FieldCount - 1 do
    if DBGrid1.Columns[i].Title.Caption = (sender as TMenuItem).Caption then
    begin
      DBGrid1.Columns[i].Visible:= False;
      break;
    end;
  end;
end;

procedure TForm3.SetColumn(Sender: TObject);
var
  i: Byte;
  item: TMenuItem;
begin
  for i:= 1 to DBGrid1.FieldCount do
  begin
    item:= TMenuItem.Create(self);
    item.Caption:= DBGrid1.Columns[i-1].Title.Caption;
    if DBGrid1.Columns[i-1].Visible then item.Checked:= true;
    item.OnClick:= Item_Click;
    self.pmColumn.Items.Add(item);
  end;
end;

end.

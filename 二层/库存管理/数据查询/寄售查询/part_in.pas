unit part_in;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls,ComObj, Excel2000,ClipBrd,
  Menus;

type
  TForm2 = class(TForm)
    ADO53: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label4: TLabel;
    Button4: TButton;
    ADO53SALES_ORDER: TStringField;
    ADO53PO_NUMBER: TStringField;
    ADO53PROD_CODE: TStringField;
    ADO53PRODUCT_NAME: TStringField;
    ADO53MANU_PART_NUMBER: TStringField;
    ADO53MANU_PART_DESC: TStringField;
    ADO53QUANTITY: TIntegerField;
    ADO53EMPLOYEE_NAME: TStringField;
    ADO53MFG_DATE: TDateTimeField;
    ADO53REMARK: TStringField;
    ADO53TAX_RATE: TBCDField;
    ADO53CUST_CODE: TStringField;
    ADO53CUSTOMER_NAME: TStringField;
    ADO53ABBR_NAME: TStringField;
    ADO53CURR_CODE: TStringField;
    ADO53CURR_NAME: TStringField;
    ADO53EXCH_RATE: TBCDField;
    PopupMenu1: TPopupMenu;
    ADO53ANALYSIS_CODE_2: TStringField;
    ADO53delivery_no: TStringField;
    ADO53unit_sq: TFloatField;
    ADO53inArea: TFloatField;
    ADO53SHIP_PTR: TIntegerField;
    ADO53PRICE: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses main, partin_report,common;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado53.SQL.Text);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 if strtoint(vprev)<=2 then       //х╗оч
  form_report.ppDBText19.Visible:=false;
 ado53.DisableControls;
 form_report.ppReport2.Print;
 ado53.EnableControls;
finally
 form_report.free;
end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
  for i:=1 to dbgrid1.FieldCount do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
   if dbgrid1.Columns[i-1].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   self.PopupMenu1.Items.Add(item);
  end;
end;

procedure TForm2.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm2.DBGrid1TitleClick(Column: TColumn);
begin
  ADO53.Sort:=Column.FieldName;
end;

end.
